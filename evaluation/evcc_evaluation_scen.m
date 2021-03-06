slotwise_lp = csvread('../log/lp_con/iter1/sim/simResults_SlotwiseAggregate.csv',1);
slotwise_jo = csvread('../log/joint/iter1/sim/simResults_SlotwiseAggregate.csv',1);
slotwise_uc = csvread('../log/uc/iter1/sim/simResults_SlotwiseAggregate.csv',1);

hdwise_lp = csvread('../log/lp_con/iter1/sim/simResults_HouseholdAggregate.csv',1);
hdwise_jo = csvread('../log/joint/iter1/sim/simResults_HouseholdAggregate.csv',1);
hdwise_uc = csvread('../log/uc/iter1/sim/simResults_HouseholdAggregate.csv',1);

av_lp = csvread('../log/lp_con/iter1/sim/simResults_EVAvailability.csv',1);
av_jo = csvread('../log/joint/iter1/sim/simResults_EVAvailability.csv',1);
av_uc = csvread('../log/uc/iter1/sim/simResults_EVAvailability.csv',1);

soc_lp = csvread('../log/lp_con/iter1/sim/simResults_BatterySOC.csv',1);
soc_jo = csvread('../log/joint/iter1/sim/simResults_BatterySOC.csv',1);
soc_uc = csvread('../log/uc/iter1/sim/simResults_BatterySOC.csv',1);

vol_lp = csvread('../log/lp_con/iter1/sim/simResults_Voltages.csv',1);
vol_jo = csvread('../log/joint/iter1/sim/simResults_Voltages.csv',1);
vol_uc = csvread('../log/uc/iter1/sim/simResults_Voltages.csv',1);

sched_lp = csvread('../log/lp_con/iter1/sim/simResults_Schedules.csv',1);
sched_jo = csvread('../log/joint/iter1/sim/simResults_Schedules.csv',1);
sched_uc = csvread('../log/uc/iter1/sim/simResults_Schedules.csv',1);

figure;
subplot(3,2,1);
edges = [10:3:40]
h1 = histogram(slotwise_lp(:,13),edges)
h1.Normalization = 'probability';
subplot(3,2,2);
edges = [10:3:40]
pr_lp = (sched_lp' ./ sum(sched_lp'))'*slotwise_lp(:,13)
pr_jo = (sched_jo' ./ sum(sched_jo'))'*slotwise_jo(:,13)
%pr_uc = (sched_uc' ./ sum(sched_uc'))'*slotwise_uc(:,13)
h61 = histogram(pr_uc,edges);
hold on
h63 = histogram(pr_jo,edges);
h62 = histogram(pr_lp,edges);
h62.Normalization = 'probability';
h61.Normalization = 'probability';
h63.Normalization = 'probability';


subplot(3,2,3);
av = sum(av_lp')/96
edges = [0:0.1:1]
h3 = histogram(av,edges)
h3.Normalization = 'probability';
subplot(3,2,4);

vollp = vol_lp/230
voljo = vol_jo/230
voluc = vol_uc/230
edges = [0.9:0.01:1]
h61 = histogram(voluc,edges);
hold on
h63 = histogram(voljo,edges);
h62 = histogram(vollp,edges);
h62.Normalization = 'probability';
h61.Normalization = 'probability';
h63.Normalization = 'probability';

subplot(3,2,5);
soc = soc_lp(:,1)/30
edges = [0:0.1:1]
h5 = histogram(soc,edges)
h5.Normalization = 'probability';

subplot(3,2,6);
soclp = soc_lp(:,96)/30
socjo = soc_jo(:,96)/30
socuc = soc_uc(:,96)/30
edges = [0:0.05:1]
h61 = histogram(socuc,edges);
hold on
h63 = histogram(socjo,edges);
h62 = histogram(soclp,edges);
h62.Normalization = 'probability';
h61.Normalization = 'probability';
h63.Normalization = 'probability';