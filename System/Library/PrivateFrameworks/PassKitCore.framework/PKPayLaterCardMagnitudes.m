@interface PKPayLaterCardMagnitudes
+ (BOOL)supportsSecureCoding;
+ (id)emptyMangitudes;
+ (id)fullMagnitude;
+ (id)magnitudesFromFinancingPlans:(id)a3;
+ (id)randomMagnitude;
- (PKPayLaterCardMagnitudes)initWithCoder:(id)a3;
- (PKPayLaterCardMagnitudes)initWithMaximumCount:(unint64_t)a3;
- (PKPayLaterCardMagnitudes)initWithUnknownCount:(unint64_t)a3 foodAndDrinksCount:(unint64_t)a4 shoppingCount:(unint64_t)a5 travelCount:(unint64_t)a6 servicesCount:(unint64_t)a7 funCount:(unint64_t)a8 healthCount:(unint64_t)a9 transportCount:(unint64_t)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)foodAndDrinksCount;
- (unint64_t)funCount;
- (unint64_t)healthCount;
- (unint64_t)servicesCount;
- (unint64_t)shoppingCount;
- (unint64_t)transportcount;
- (unint64_t)travelCount;
- (unint64_t)unknownCount;
- (void)encodeWithCoder:(id)a3;
- (void)setFoodAndDrinksCount:(unint64_t)a3;
- (void)setFunCount:(unint64_t)a3;
- (void)setHealthCount:(unint64_t)a3;
- (void)setServicesCount:(unint64_t)a3;
- (void)setShoppingCount:(unint64_t)a3;
- (void)setTransportcount:(unint64_t)a3;
- (void)setTravelCount:(unint64_t)a3;
- (void)setUnknownCount:(unint64_t)a3;
@end

@implementation PKPayLaterCardMagnitudes

- (PKPayLaterCardMagnitudes)initWithUnknownCount:(unint64_t)a3 foodAndDrinksCount:(unint64_t)a4 shoppingCount:(unint64_t)a5 travelCount:(unint64_t)a6 servicesCount:(unint64_t)a7 funCount:(unint64_t)a8 healthCount:(unint64_t)a9 transportCount:(unint64_t)a10
{
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterCardMagnitudes;
  result = [(PKPayLaterCardMagnitudes *)&v17 init];
  if (result)
  {
    result->_unknownCount = a3;
    result->_foodAndDrinksCount = a4;
    result->_shoppingCount = a5;
    result->_travelCount = a6;
    result->_servicesCount = a7;
    result->_funCount = a8;
    result->_healthCount = a9;
    result->_transportcount = a10;
  }
  return result;
}

- (PKPayLaterCardMagnitudes)initWithMaximumCount:(unint64_t)a3
{
  return [(PKPayLaterCardMagnitudes *)self initWithUnknownCount:0 foodAndDrinksCount:a3 shoppingCount:a3 travelCount:a3 servicesCount:a3 funCount:a3 healthCount:a3 transportCount:a3];
}

+ (id)emptyMangitudes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKPayLaterCardMagnitudes_emptyMangitudes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB403238 != -1) {
    dispatch_once(&qword_1EB403238, block);
  }
  v2 = (void *)_MergedGlobals_252;
  return v2;
}

void __43__PKPayLaterCardMagnitudes_emptyMangitudes__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_252;
  _MergedGlobals_252 = (uint64_t)v1;
}

+ (id)randomMagnitude
{
  v2 = objc_alloc_init((Class)a1);
  for (uint64_t i = 0; ; ++i)
  {
    uint32_t v4 = arc4random_uniform(0xDu);
    switch(i)
    {
      case 0:
        v2[1] = 0;
        break;
      case 1:
        v2[2] = v4;
        break;
      case 2:
        v2[3] = v4;
        break;
      case 3:
        v2[4] = v4;
        break;
      case 4:
        v2[5] = v4;
        break;
      case 5:
        v2[6] = v4;
        break;
      case 6:
        v2[7] = v4;
        break;
      case 7:
        v2[8] = v4;
        return v2;
      default:
        continue;
    }
  }
}

+ (id)fullMagnitude
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PKPayLaterCardMagnitudes_fullMagnitude__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB403248 != -1) {
    dispatch_once(&qword_1EB403248, block);
  }
  v2 = (void *)qword_1EB403240;
  return v2;
}

void __41__PKPayLaterCardMagnitudes_fullMagnitude__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithMaximumCount:14];
  v2 = (void *)qword_1EB403240;
  qword_1EB403240 = v1;
}

+ (id)magnitudesFromFinancingPlans:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v9 = [v8 state];
        if (v9 <= 4)
        {
          if (((1 << v9) & 0x13) != 0)
          {
            v10 = [v8 scheduleSummary];
            v11 = [v10 installments];
            v12 = objc_msgSend(v11, "pk_objectsPassingTest:", &__block_literal_global_153);
            uint64_t v13 = [v12 count];
          }
          else
          {
            v10 = [v8 planSummary];
            uint64_t v13 = [v10 installmentCount];
          }

          if (v13)
          {
            v14 = [v8 merchant];
            uint64_t v15 = [v14 merchantCategory];

            switch(v15)
            {
              case 0:
              case 2:
                v25 += v13;
                break;
              case 1:
                v24 += v13;
                break;
              case 3:
                v23 += v13;
                break;
              case 4:
                v22 += v13;
                break;
              case 5:
                v21 += v13;
                break;
              case 6:
                v20 += v13;
                break;
              case 7:
                v19 += v13;
                break;
              default:
                continue;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
  }
  v16 = (void *)[objc_alloc((Class)a1) initWithUnknownCount:0 foodAndDrinksCount:v24 shoppingCount:v25 travelCount:v23 servicesCount:v22 funCount:v21 healthCount:v20 transportCount:v19];

  return v16;
}

uint64_t __57__PKPayLaterCardMagnitudes_magnitudesFromFinancingPlans___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 status];
  return (v2 < 5) & (0x17u >> v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_unknownCount;
  *((void *)result + 2) = self->_foodAndDrinksCount;
  *((void *)result + 3) = self->_shoppingCount;
  *((void *)result + 4) = self->_travelCount;
  *((void *)result + 5) = self->_servicesCount;
  *((void *)result + 6) = self->_funCount;
  *((void *)result + 7) = self->_healthCount;
  *((void *)result + 8) = self->_transportcount;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterCardMagnitudes)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterCardMagnitudes;
  uint64_t v5 = [(PKPayLaterCardMagnitudes *)&v7 init];
  if (v5)
  {
    v5->_unknownCount = [v4 decodeIntegerForKey:@"unknownCount"];
    v5->_foodAndDrinksCount = [v4 decodeIntegerForKey:@"foodAndDrinksCount"];
    v5->_shoppingCount = [v4 decodeIntegerForKey:@"shoppingCount"];
    v5->_travelCount = [v4 decodeIntegerForKey:@"travelCount"];
    v5->_servicesCount = [v4 decodeIntegerForKey:@"servicesCount"];
    v5->_funCount = [v4 decodeIntegerForKey:@"funCount"];
    v5->_healthCount = [v4 decodeIntegerForKey:@"healthCount"];
    v5->_transportcount = [v4 decodeIntegerForKey:@"transportCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t unknownCount = self->_unknownCount;
  id v5 = a3;
  [v5 encodeInteger:unknownCount forKey:@"unknownCount"];
  [v5 encodeInteger:self->_foodAndDrinksCount forKey:@"foodAndDrinksCount"];
  [v5 encodeInteger:self->_shoppingCount forKey:@"shoppingCount"];
  [v5 encodeInteger:self->_travelCount forKey:@"travelCount"];
  [v5 encodeInteger:self->_servicesCount forKey:@"servicesCount"];
  [v5 encodeInteger:self->_funCount forKey:@"funCount"];
  [v5 encodeInteger:self->_healthCount forKey:@"healthCount"];
  [v5 encodeInteger:self->_transportcount forKey:@"transportCount"];
}

- (unint64_t)unknownCount
{
  return self->_unknownCount;
}

- (void)setUnknownCount:(unint64_t)a3
{
  self->_unint64_t unknownCount = a3;
}

- (unint64_t)foodAndDrinksCount
{
  return self->_foodAndDrinksCount;
}

- (void)setFoodAndDrinksCount:(unint64_t)a3
{
  self->_foodAndDrinksCount = a3;
}

- (unint64_t)shoppingCount
{
  return self->_shoppingCount;
}

- (void)setShoppingCount:(unint64_t)a3
{
  self->_shoppingCount = a3;
}

- (unint64_t)travelCount
{
  return self->_travelCount;
}

- (void)setTravelCount:(unint64_t)a3
{
  self->_travelCount = a3;
}

- (unint64_t)servicesCount
{
  return self->_servicesCount;
}

- (void)setServicesCount:(unint64_t)a3
{
  self->_servicesCount = a3;
}

- (unint64_t)funCount
{
  return self->_funCount;
}

- (void)setFunCount:(unint64_t)a3
{
  self->_funCount = a3;
}

- (unint64_t)healthCount
{
  return self->_healthCount;
}

- (void)setHealthCount:(unint64_t)a3
{
  self->_healthCount = a3;
}

- (unint64_t)transportcount
{
  return self->_transportcount;
}

- (void)setTransportcount:(unint64_t)a3
{
  self->_transportcount = a3;
}

@end