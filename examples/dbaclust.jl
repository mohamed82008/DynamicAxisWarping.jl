using TimeWarp
#using TimeWarp.WarpPlots
using TimeWarp.Datasets

# UCI data repository must be downloaded first, run TimeWarp.Datasets.download_ucr()
data, labels = ucr_traindata("MedicalImages");

# c = [ cl==1 ? :blue : :red for cl in class ]'
# plot(y, linecolor=c, legend=false)
nclust = 3
init_centers = TimeWarp.dbaclust_initial_centers(data, nclust, FastDTW(10))
centers, clustids, result =
  dbaclust(data, nclust, FastDTW(10); init_centers = deepcopy(init_centers), iterations = 1)

plot(data)
plot(centers)
plot(init_centers)
