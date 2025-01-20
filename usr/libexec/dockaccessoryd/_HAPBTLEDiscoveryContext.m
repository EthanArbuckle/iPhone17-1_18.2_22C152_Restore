@interface _HAPBTLEDiscoveryContext
- (BOOL)isComplete;
- (BOOL)isDiscovering;
- (NSMapTable)characteristicSignatures;
- (NSMapTable)serviceSignatures;
- (NSMutableArray)discoveringCharacteristics;
- (NSMutableArray)discoveringDescriptors;
- (NSMutableArray)discoveringServices;
- (NSMutableArray)readingCharacteristics;
- (NSMutableArray)readingDescriptors;
- (NSMutableArray)readingSignatureCharacteristics;
- (NSMutableArray)readingSignatureServices;
- (_HAPBTLEDiscoveryContext)init;
- (_HAPBTLEDiscoveryContext)initWithDiscoveryType:(int64_t)a3;
- (id)completionHandler;
- (int64_t)discoveryType;
- (void)reset;
- (void)setCompletionHandler:(id)a3;
- (void)setDiscovering:(BOOL)a3;
@end

@implementation _HAPBTLEDiscoveryContext

- (_HAPBTLEDiscoveryContext)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (_HAPBTLEDiscoveryContext)initWithDiscoveryType:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)_HAPBTLEDiscoveryContext;
  id v4 = [(_HAPBTLEDiscoveryContext *)&v25 init];
  v5 = v4;
  if (v4)
  {
    v4->_discoveryType = a3;
    uint64_t v6 = +[NSMutableArray array];
    discoveringServices = v5->_discoveringServices;
    v5->_discoveringServices = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableArray array];
    discoveringCharacteristics = v5->_discoveringCharacteristics;
    v5->_discoveringCharacteristics = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    readingCharacteristics = v5->_readingCharacteristics;
    v5->_readingCharacteristics = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    discoveringDescriptors = v5->_discoveringDescriptors;
    v5->_discoveringDescriptors = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    readingDescriptors = v5->_readingDescriptors;
    v5->_readingDescriptors = (NSMutableArray *)v14;

    uint64_t v16 = +[NSMutableArray array];
    readingSignatureCharacteristics = v5->_readingSignatureCharacteristics;
    v5->_readingSignatureCharacteristics = (NSMutableArray *)v16;

    uint64_t v18 = +[NSMutableArray array];
    readingSignatureServices = v5->_readingSignatureServices;
    v5->_readingSignatureServices = (NSMutableArray *)v18;

    uint64_t v20 = +[NSMapTable weakToStrongObjectsMapTable];
    characteristicSignatures = v5->_characteristicSignatures;
    v5->_characteristicSignatures = (NSMapTable *)v20;

    uint64_t v22 = +[NSMapTable weakToStrongObjectsMapTable];
    serviceSignatures = v5->_serviceSignatures;
    v5->_serviceSignatures = (NSMapTable *)v22;
  }
  return v5;
}

- (void)reset
{
  [(_HAPBTLEDiscoveryContext *)self setDiscovering:0];
  v3 = [(_HAPBTLEDiscoveryContext *)self discoveringServices];
  [v3 removeAllObjects];

  id v4 = [(_HAPBTLEDiscoveryContext *)self discoveringCharacteristics];
  [v4 removeAllObjects];

  v5 = [(_HAPBTLEDiscoveryContext *)self readingCharacteristics];
  [v5 removeAllObjects];

  uint64_t v6 = [(_HAPBTLEDiscoveryContext *)self discoveringDescriptors];
  [v6 removeAllObjects];

  v7 = [(_HAPBTLEDiscoveryContext *)self readingDescriptors];
  [v7 removeAllObjects];

  uint64_t v8 = [(_HAPBTLEDiscoveryContext *)self readingSignatureCharacteristics];
  [v8 removeAllObjects];

  v9 = [(_HAPBTLEDiscoveryContext *)self readingSignatureServices];
  [v9 removeAllObjects];

  uint64_t v10 = [(_HAPBTLEDiscoveryContext *)self characteristicSignatures];
  [v10 removeAllObjects];

  id v11 = [(_HAPBTLEDiscoveryContext *)self serviceSignatures];
  [v11 removeAllObjects];
}

- (BOOL)isComplete
{
  v3 = [(_HAPBTLEDiscoveryContext *)self discoveringServices];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(_HAPBTLEDiscoveryContext *)self discoveringCharacteristics];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      uint64_t v6 = [(_HAPBTLEDiscoveryContext *)self readingCharacteristics];
      if ([v6 count])
      {
        BOOL v4 = 0;
      }
      else
      {
        v7 = [(_HAPBTLEDiscoveryContext *)self discoveringDescriptors];
        if ([v7 count])
        {
          BOOL v4 = 0;
        }
        else
        {
          uint64_t v8 = [(_HAPBTLEDiscoveryContext *)self readingDescriptors];
          if ([v8 count])
          {
            BOOL v4 = 0;
          }
          else
          {
            v9 = [(_HAPBTLEDiscoveryContext *)self readingSignatureCharacteristics];
            if ([v9 count])
            {
              BOOL v4 = 0;
            }
            else
            {
              uint64_t v10 = [(_HAPBTLEDiscoveryContext *)self readingSignatureServices];
              BOOL v4 = [v10 count] == 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (int64_t)discoveryType
{
  return self->_discoveryType;
}

- (NSMutableArray)discoveringServices
{
  return self->_discoveringServices;
}

- (NSMutableArray)discoveringCharacteristics
{
  return self->_discoveringCharacteristics;
}

- (NSMutableArray)readingCharacteristics
{
  return self->_readingCharacteristics;
}

- (NSMutableArray)discoveringDescriptors
{
  return self->_discoveringDescriptors;
}

- (NSMutableArray)readingDescriptors
{
  return self->_readingDescriptors;
}

- (NSMutableArray)readingSignatureCharacteristics
{
  return self->_readingSignatureCharacteristics;
}

- (NSMutableArray)readingSignatureServices
{
  return self->_readingSignatureServices;
}

- (NSMapTable)characteristicSignatures
{
  return self->_characteristicSignatures;
}

- (NSMapTable)serviceSignatures
{
  return self->_serviceSignatures;
}

- (BOOL)isDiscovering
{
  return self->_discovering;
}

- (void)setDiscovering:(BOOL)a3
{
  self->_discovering = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serviceSignatures, 0);
  objc_storeStrong((id *)&self->_characteristicSignatures, 0);
  objc_storeStrong((id *)&self->_readingSignatureServices, 0);
  objc_storeStrong((id *)&self->_readingSignatureCharacteristics, 0);
  objc_storeStrong((id *)&self->_readingDescriptors, 0);
  objc_storeStrong((id *)&self->_discoveringDescriptors, 0);
  objc_storeStrong((id *)&self->_readingCharacteristics, 0);
  objc_storeStrong((id *)&self->_discoveringCharacteristics, 0);

  objc_storeStrong((id *)&self->_discoveringServices, 0);
}

@end