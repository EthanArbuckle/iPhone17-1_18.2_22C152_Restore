@interface MRIRRoute
+ (id)debugRouteWithDebugIdentifier:(id)a3;
+ (id)routeWithCandidate:(id)a3;
+ (id)routeWithEndpoint:(id)a3;
+ (id)routeWithOutputDevices:(id)a3;
- (BOOL)donateAsCandidate;
- (BOOL)isEqual:(id)a3;
- (NSSet)nodes;
- (NSString)description;
- (NSString)routeIdentifier;
- (void)setDonateAsCandidate:(BOOL)a3;
- (void)setNodes:(id)a3;
- (void)setRouteIdentifier:(id)a3;
@end

@implementation MRIRRoute

+ (id)routeWithCandidate:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MRIRRoute);
  v5 = [v3 candidateIdentifier];
  [(MRIRRoute *)v4 setRouteIdentifier:v5];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [v3 nodes];

  v8 = objc_msgSend(v7, "msv_map:", &__block_literal_global_98);
  v9 = [v6 setWithArray:v8];
  [(MRIRRoute *)v4 setNodes:v9];

  [(MRIRRoute *)v4 setDonateAsCandidate:1];

  return v4;
}

id __32__MRIRRoute_routeWithCandidate___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MRIRNode nodeFromIRNode:a2];
}

+ (id)routeWithEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MRRouteRepresentable.m" lineNumber:115 description:@"endpoint cannot be nil"];
  }
  v6 = [v5 resolvedOutputDevices];
  v7 = [a1 routeWithOutputDevices:v6];

  return v7;
}

+ (id)routeWithOutputDevices:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v3 = (void *)[v33 copy];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    int v9 = 1;
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v12 clusterType])
        {
          uint64_t v13 = [v12 clusterCompositionOutputDevices];
          v14 = (void *)v13;
          if (v13) {
            v15 = (void *)v13;
          }
          else {
            v15 = v10;
          }
          id v16 = v15;

          [v4 addObjectsFromArray:v16];
          uint64_t v17 = [v16 count];
          if (v17 != [v12 configuredClusterSize])
          {
            v18 = _MRLogForCategory(0xDuLL);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = [v12 uid];
              uint64_t v35 = [v16 count];
              uint64_t v34 = [v12 configuredClusterSize];
              v20 = [v12 debugDescription];
              *(_DWORD *)buf = 138413058;
              v41 = v19;
              __int16 v42 = 2048;
              uint64_t v43 = v35;
              __int16 v44 = 2048;
              uint64_t v45 = v34;
              __int16 v46 = 2112;
              v47 = v20;
              _os_log_error_impl(&dword_194F3C000, v18, OS_LOG_TYPE_ERROR, "[MRDRRC].IRR Donations disallowed, cluster %@ has %lu members, expected %lu; device: %@",
                buf,
                0x2Au);
            }
            int v9 = 0;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v7);
  }
  else
  {
    int v9 = 1;
  }

  v21 = [v5 arrayByAddingObjectsFromArray:v4];
  int v22 = objc_msgSend(v21, "mr_all:", &__block_literal_global_123_0);
  v23 = objc_msgSend(v5, "msv_map:", &__block_literal_global_126);
  v24 = objc_msgSend(v4, "msv_map:", &__block_literal_global_128_1);
  v25 = objc_msgSend(v23, "msv_compactMap:", &__block_literal_global_131_0);
  v26 = [v25 sortedArrayUsingSelector:sel_compare_];

  v27 = objc_alloc_init(MRIRRoute);
  v28 = [v26 componentsJoinedByString:@"|"];
  [(MRIRRoute *)v27 setRouteIdentifier:v28];

  [(MRIRRoute *)v27 setDonateAsCandidate:v22 & v9];
  v29 = objc_msgSend(v33, "msv_firstWhere:", &__block_literal_global_135_0);

  if (v29 && [v33 count] != 1) {
    [(MRIRRoute *)v27 setDonateAsCandidate:0];
  }
  v30 = [v23 arrayByAddingObjectsFromArray:v24];
  v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
  [(MRIRRoute *)v27 setNodes:v31];

  return v27;
}

BOOL __36__MRIRRoute_routeWithOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 deviceType] == 1 || objc_msgSend(v2, "deviceType") == 4;

  return v3;
}

id __36__MRIRRoute_routeWithOutputDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[MRIRNode nodeFromOutputDevice:a2];
}

id __36__MRIRRoute_routeWithOutputDevices___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[MRIRNode nodeFromOutputDevice:a2];
}

uint64_t __36__MRIRRoute_routeWithOutputDevices___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 avOutputDeviceIdentifier];
}

uint64_t __36__MRIRRoute_routeWithOutputDevices___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 deviceType] == 1) {
    uint64_t v3 = [v2 supportsBufferedAirPlay] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)debugRouteWithDebugIdentifier:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:@"/"];
  id v4 = [v3 firstObject];
  id v5 = [v3 lastObject];
  uint64_t v6 = [v5 componentsSeparatedByString:@"&"];

  uint64_t v7 = objc_alloc_init(MRIRRoute);
  [(MRIRRoute *)v7 setRouteIdentifier:v4];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  int v9 = objc_msgSend(v6, "msv_map:", &__block_literal_global_144);
  v10 = [v8 setWithArray:v9];
  [(MRIRRoute *)v7 setNodes:v10];

  [(MRIRRoute *)v7 setDonateAsCandidate:1];

  return v7;
}

MRIRNode *__43__MRIRRoute_debugRouteWithDebugIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 isEqualToString:@"Speaker"];
  uint64_t v3 = -[MRIRNode initWithAVOutputDeviceID:isLocal:]([MRIRNode alloc], "initWithAVOutputDeviceID:isLocal:", v2, [v2 isEqualToString:@"Speaker"]);

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  uint64_t v7 = [(MRIRRoute *)self routeIdentifier];
  [v6 appendFormat:@"routeIdentifier: %@", v7];

  uint64_t v8 = [(MRIRRoute *)self nodes];
  [v6 appendFormat:@", nodes: %@", v8];

  BOOL v9 = [(MRIRRoute *)self donateAsCandidate];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  [v6 appendFormat:@", donateAsCandidate: %@", v10];
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRIRRoute *)a3;
  id v5 = v4;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else if ([(MRIRRoute *)v4 conformsToProtocol:&unk_1EE6A6110])
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(MRIRRoute *)self routeIdentifier];
    uint64_t v8 = [(MRIRRoute *)v6 routeIdentifier];
    if (v7 == v8) {
      int v9 = 1;
    }
    else {
      int v9 = [v7 isEqual:v8];
    }

    v10 = [(MRIRRoute *)self nodes];
    v11 = [(MRIRRoute *)v6 nodes];
    if (v10 != v11)
    {
      v12 = [(MRIRRoute *)self nodes];
      uint64_t v13 = [(MRIRRoute *)v6 nodes];
      v9 &= [v12 isEqualToSet:v13];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (BOOL)donateAsCandidate
{
  return self->_donateAsCandidate;
}

- (void)setDonateAsCandidate:(BOOL)a3
{
  self->_donateAsCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end