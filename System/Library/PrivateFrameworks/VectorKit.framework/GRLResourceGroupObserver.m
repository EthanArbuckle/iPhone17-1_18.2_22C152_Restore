@interface GRLResourceGroupObserver
- (GRLResourceGroupObserver)initWithResourceProvider:(void *)a3;
- (id).cxx_construct;
- (void)clearProvider;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
@end

@implementation GRLResourceGroupObserver

- (id).cxx_construct
{
  *((void *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  return self;
}

- (GRLResourceGroupObserver)initWithResourceProvider:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GRLResourceGroupObserver;
  result = [(GRLResourceGroupObserver *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)clearProvider
{
  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((void *)self + 1) = 0;
  std::mutex::unlock(v3);
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  v4 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  objc_super v5 = (grl::ResourceProvider *)*((void *)self + 1);
  if (v5) {
    grl::ResourceProvider::notifyObserversOfTileGroupChange(v5);
  }
  std::mutex::unlock(v4);
}

@end