@interface PTCinematographyNetworkLabelSignal
- (NSDictionary)remap;
- (PTCinematographyNetworkLabelSignal)initWithModelDictionary:(id)a3;
- (int64_t)labelOffset;
- (unint64_t)_networkLabelForDetection:(id)a3;
- (unint64_t)labelZero;
- (void)writePayload:(id)a3 toStream:(id)a4;
@end

@implementation PTCinematographyNetworkLabelSignal

- (PTCinematographyNetworkLabelSignal)initWithModelDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PTCinematographyNetworkLabelSignal;
  v5 = [(PTCinematographyNetworkSignal *)&v26 initWithModelDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"params"];
    v7 = [v6 objectForKeyedSubscript:@"zero_label"];
    v5->_labelZero = [v7 unsignedIntegerValue];

    if (v5->_labelZero) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 0;
    }
    v5->_labelOffset = v8;
    id v9 = [v6 objectForKeyedSubscript:@"remap"];
    if (v9)
    {
      v23 = v6;
      id v24 = v4;
      v10 = objc_opt_new();
      if ([v9 count])
      {
        unint64_t v11 = 0;
        id v25 = v9;
        do
        {
          v12 = [v9 objectAtIndexedSubscript:v11];
          if (objc_opt_respondsToSelector())
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v28 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
                  v19 = [NSNumber numberWithUnsignedInteger:v11];
                  [v10 setObject:v19 forKeyedSubscript:v18];
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
              }
              while (v15);
              id v9 = v25;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              -[PTCinematographyNetworkLabelSignal initWithModelDictionary:]();
            }
            id v13 = [NSNumber numberWithUnsignedInteger:v11];
            [v10 setObject:v13 forKeyedSubscript:v12];
          }

          ++v11;
        }
        while (v11 < [v9 count]);
      }
      uint64_t v20 = [v10 copy];

      id v4 = v24;
      v6 = v23;
    }
    else
    {
      uint64_t v20 = 0;
    }

    remap = v5->_remap;
    v5->_remap = (NSDictionary *)v20;
  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PTCinematographyNetworkSignal *)self checkSignalForStream:v7])
  {
    uint64_t v8 = [v6 detection];
    unint64_t v9 = [(PTCinematographyNetworkLabelSignal *)self _networkLabelForDetection:v8];

    objc_msgSend(v7, "writeOneHot:count:", v9, -[PTCinematographyNetworkSignal count](self, "count"));
  }
  else
  {
    v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetworkNamedSignal writePayload:toStream:](v10);
    }
  }
}

- (unint64_t)_networkLabelForDetection:(id)a3
{
  id v4 = a3;
  remap = self->_remap;
  uint64_t v6 = [v4 trackIdentifier];
  if (remap)
  {
    if (v6 == 0x1000000000) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v4 detectionType];
    }
    uint64_t v8 = self->_remap;
    unint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
    v10 = [(NSDictionary *)v8 objectForKeyedSubscript:v9];
    int64_t labelZero = [v10 unsignedIntegerValue];
  }
  else if (v6 == 0x1000000000)
  {
    int64_t labelZero = self->_labelZero;
  }
  else
  {
    int64_t labelZero = self->_labelOffset + [v4 detectionType];
  }

  return labelZero;
}

- (int64_t)labelOffset
{
  return self->_labelOffset;
}

- (unint64_t)labelZero
{
  return self->_labelZero;
}

- (NSDictionary)remap
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithModelDictionary:.cold.1()
{
}

@end