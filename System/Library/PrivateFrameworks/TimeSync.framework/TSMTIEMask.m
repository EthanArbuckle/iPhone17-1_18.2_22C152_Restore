@interface TSMTIEMask
+ (id)UDPHardwareMask;
+ (id)UDPSoftwareMask;
+ (id)gPTP1Hop;
+ (id)gPTP7Hop;
+ (id)gPTPMask1;
+ (id)gPTPMask2;
+ (id)gPTPMask3;
- (BOOL)mtieConformsToMask:(id)a3 withErrors:(id *)a4;
- (NSArray)elements;
- (NSString)name;
- (TSMTIEMask)initWithDictionary:(id)a3;
- (id)mtieMaskFromStart:(double)a3 toEnd:(double)a4 withStep:(double)a5;
- (void)setElements:(id)a3;
- (void)setName:(id)a3;
@end

@implementation TSMTIEMask

+ (id)UDPHardwareMask
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"UDP End-to-End Ports over peer-to-peer wireless with Hardware Timestamping" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:1.0 offset:0.000206 lowerLimit:0.0 upperLimit:0.000006];
  [v5 addObject:v6];
  v7 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.000212 lowerLimit:0.000006 upperLimit:INFINITY];

  [v5 addObject:v7];
  [v2 setElements:v5];

  return v2;
}

+ (id)UDPSoftwareMask
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"UDP End-to-End Ports over wired or wireless infrastructure" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:1.0 offset:0.000206 lowerLimit:0.0 upperLimit:0.006];
  [v5 addObject:v6];
  v7 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.006206 lowerLimit:0.006 upperLimit:INFINITY];

  [v5 addObject:v7];
  [v2 setElements:v5];

  return v2;
}

+ (id)gPTPMask1
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"802.1AS MTIE Mask 1" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0000069548 offset:0.0 lowerLimit:0.0 upperLimit:0.0637];
  [v5 addObject:v6];
  v7 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.000000443 lowerLimit:0.0637 upperLimit:0.3183];

  [v5 addObject:v7];
  v8 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.00005 offset:0.0 lowerLimit:0.3183 upperLimit:INFINITY];

  [v5 addObject:v8];
  [v2 setElements:v5];

  return v2;
}

+ (id)gPTPMask2
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"802.1AS MTIE Mask 2" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.000000407 lowerLimit:0.0 upperLimit:0.4069];
  [v5 addObject:v6];
  v7 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.000001 offset:0.0 lowerLimit:0.4069 upperLimit:INFINITY];

  [v5 addObject:v7];
  [v2 setElements:v5];

  return v2;
}

+ (id)gPTPMask3
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"802.1AS MTIE Mask 3" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.00000005 offset:0.0 lowerLimit:0.0 upperLimit:4.0];
  [v5 addObject:v6];
  v7 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.0000002 lowerLimit:4.0 upperLimit:INFINITY];

  [v5 addObject:v7];
  [v2 setElements:v5];

  return v2;
}

+ (id)gPTP7Hop
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"gPTP MTIE Mask for 7 Hops" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.000000407 lowerLimit:0.0 upperLimit:0.4069];
  [v5 addObject:v6];
  v7 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.000001 offset:0.0 lowerLimit:0.4069 upperLimit:1.0];

  [v5 addObject:v7];
  v8 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.0000001 lowerLimit:1.0 upperLimit:INFINITY];

  [v5 addObject:v8];
  [v2 setElements:v5];

  return v2;
}

+ (id)gPTP1Hop
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"gPTP MTIE Mask for 7 Hops" value:&stru_1F1441738 table:0];
  [v2 setName:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TSMTIEMaskElement alloc] initWithCoefficient:0.0 offset:0.00000016 lowerLimit:0.0 upperLimit:INFINITY];
  [v5 addObject:v6];
  [v2 setElements:v5];

  return v2;
}

- (TSMTIEMask)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TSMTIEMask;
  v5 = [(TSMTIEMask *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"equation", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[TSMTIEMaskElement alloc] initWithDictionary:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v9];
    elements = v5->_elements;
    v5->_elements = (NSArray *)v16;

    if (![(NSArray *)v5->_elements count])
    {

      v5 = 0;
    }
  }
  return v5;
}

- (BOOL)mtieConformsToMask:(id)a3 withErrors:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    if (a4) {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v6 = 0;
    }
    v36 = a4;
    id v37 = v5;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v39 = *(void *)v46;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v46 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v13 = [(TSMTIEMask *)self elements];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = v6;
            uint64_t v17 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v42 != v17) {
                  objc_enumerationMutation(v13);
                }
                long long v19 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                [v12 observationInterval];
                double v21 = v20;
                [v19 lowerLimit];
                if (v21 >= v22)
                {
                  [v12 observationInterval];
                  double v24 = v23;
                  [v19 upperLimit];
                  if (v24 < v25)
                  {
                    [v19 a];
                    double v27 = v26;
                    [v12 observationInterval];
                    double v29 = v28 / 1000000000.0;
                    [v19 b];
                    double v31 = (v30 + v27 * v29) * 1000000000.0;
                    [v12 mtie];
                    if (v32 > v31) {
                      char v10 = 0;
                    }
                    id v6 = v16;
                    if (v32 > v31 && v16 != 0)
                    {
                      v34 = objc_alloc_init(TSMTIEMaskError);
                      [v12 observationInterval];
                      -[TSMTIEMaskError setObservationInterval:](v34, "setObservationInterval:");
                      [v12 mtie];
                      -[TSMTIEMaskError setMtie:](v34, "setMtie:");
                      [(TSMTIEMaskError *)v34 setMask:v31];
                      [v16 addObject:v34];

                      char v10 = 0;
                    }
                    goto LABEL_28;
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v15) {
                continue;
              }
              break;
            }
            id v6 = v16;
          }
LABEL_28:
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v9);
    }
    else
    {
      char v10 = 1;
    }

    if (v36) {
      id *v36 = v6;
    }

    BOOL v7 = v10 & 1;
    id v5 = v37;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)mtieMaskFromStart:(double)a3 toEnd:(double)a4 withStep:(double)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = [MEMORY[0x1E4F1CA48] array];
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    char v10 = [(TSMTIEMask *)self elements];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          [v15 lowerLimit];
          if (a3 >= v16)
          {
            [v15 upperLimit];
            if (a3 < v17)
            {
              [v15 a];
              double v20 = v19;
              [v15 b];
              double v18 = (v21 + v20 * (a3 / 1000000000.0)) * 1000000000.0;
              goto LABEL_13;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    double v18 = NAN;
LABEL_13:

    double v22 = [[TSMTIEValue alloc] initWithObservationInterval:a3 andMTIE:v18];
    [i addObject:v22];
  }
  return i;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end