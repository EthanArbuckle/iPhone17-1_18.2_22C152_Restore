@interface PRSWallpaperClient
- (void)initializeWithKnownIdentities:(id)a3 knownRoles:(id)a4 knownCollection:(id)a5;
@end

@implementation PRSWallpaperClient

- (void)initializeWithKnownIdentities:(id)a3 knownRoles:(id)a4 knownCollection:(id)a5
{
  p_publisher = &self->_publisher;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_publisher);
  [WeakRetained _initializeClient:self withKnownIdentities:v11 knownRoles:v10 knownCollection:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterCollectionChangesRole, 0);
  objc_storeStrong((id *)&self->_lastKnownPosterCollection, 0);
  objc_storeStrong((id *)&self->_activePosterObservedRoles, 0);
  for (uint64_t i = 64; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_publisher);
}

@end