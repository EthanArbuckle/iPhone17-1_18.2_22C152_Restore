@interface SPKeyIndexMap
- ($DA16DF39271A415335F54346D43F7DCF)mapHandle;
- (NSUUID)beaconIdentifier;
- (SPKeyIndexMap)init;
- (SPKeyIndexMap)initWithBeaconIdentifier:(id)a3 keySequence:(unsigned __int8)a4 mapHandle:(id *)a5;
- (id)headerString;
- (unsigned)sequence;
- (void)dealloc;
@end

@implementation SPKeyIndexMap

- (SPKeyIndexMap)init
{
  return 0;
}

- (void)dealloc
{
  sp_key_index_map_destroy((uint64_t)self->_mapHandle);
  v3.receiver = self;
  v3.super_class = (Class)SPKeyIndexMap;
  [(SPKeyIndexMap *)&v3 dealloc];
}

- (SPKeyIndexMap)initWithBeaconIdentifier:(id)a3 keySequence:(unsigned __int8)a4 mapHandle:(id *)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPKeyIndexMap;
  v10 = [(SPKeyIndexMap *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_beaconIdentifier, a3);
    v11->_sequence = a4;
    v11->_mapHandle = a5;
  }

  return v11;
}

- (id)headerString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"version: %u, ", sp_key_index_map_get_version((uint64_t)self->_mapHandle)];
  [v3 appendFormat:@"first-index: %u, ", sp_key_index_map_get_first_index((uint64_t)self->_mapHandle)];
  [v3 appendFormat:@"last-index: %u, ", sp_key_index_map_get_last_index((uint64_t)self->_mapHandle)];

  return v3;
}

- (NSUUID)beaconIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)sequence
{
  return self->_sequence;
}

- ($DA16DF39271A415335F54346D43F7DCF)mapHandle
{
  return self->_mapHandle;
}

- (void).cxx_destruct
{
}

@end