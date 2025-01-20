@interface NCDigestInfo
- (BOOL)isEqual:(id)a3;
- (NCDigestInfo)initWithDigestInfo:(id)a3;
- (NSDate)scheduleDate;
- (NSDateComponents)scheduleTime;
- (NSString)debugDescription;
- (NSString)headerString;
- (NSString)titleString;
- (id)_stringForDeliveryOrder:(int64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)deliveryOrder;
- (unint64_t)hash;
@end

@implementation NCDigestInfo

- (NCDigestInfo)initWithDigestInfo:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCDigestInfo;
  v5 = [(NCDigestInfo *)&v19 init];
  if (v5)
  {
    v6 = [v4 scheduleTime];
    uint64_t v7 = [v6 copy];
    scheduleTime = v5->_scheduleTime;
    v5->_scheduleTime = (NSDateComponents *)v7;

    v9 = [v4 scheduleDate];
    uint64_t v10 = [v9 copy];
    scheduleDate = v5->_scheduleDate;
    v5->_scheduleDate = (NSDate *)v10;

    v12 = [v4 titleString];
    uint64_t v13 = [v12 copy];
    titleString = v5->_titleString;
    v5->_titleString = (NSString *)v13;

    v15 = [v4 headerString];
    uint64_t v16 = [v15 copy];
    headerString = v5->_headerString;
    v5->_headerString = (NSString *)v16;

    v5->_deliveryOrder = [v4 deliveryOrder];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(NCDigestInfo *)self scheduleTime];
  v6 = [v4 scheduleTime];
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = [(NCDigestInfo *)self scheduleDate];
    v8 = [v4 scheduleDate];
    if ([v7 isEqualToDate:v8])
    {
      v9 = [(NCDigestInfo *)self titleString];
      uint64_t v10 = [v4 titleString];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(NCDigestInfo *)self headerString];
        v12 = [v4 headerString];
        if ([v11 isEqualToString:v12])
        {
          int64_t v13 = [(NCDigestInfo *)self deliveryOrder];
          BOOL v14 = v13 == [v4 deliveryOrder];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateComponents *)self->_scheduleTime hash];
  uint64_t v4 = [(NSDate *)self->_scheduleDate hash] + v3;
  NSUInteger v5 = [(NSString *)self->_titleString hash];
  return v4 + v5 + [(NSString *)self->_headerString hash] + self->_deliveryOrder;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCDigestInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NCMutableDigestInfo alloc];

  return [(NCDigestInfo *)v4 initWithDigestInfo:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(NCDigestInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  uint64_t v7 = NSString;
  v8 = [(NCDigestInfo *)self scheduleTime];
  uint64_t v9 = [v8 hour];
  uint64_t v10 = [(NCDigestInfo *)self scheduleTime];
  v11 = objc_msgSend(v7, "stringWithFormat:", @"{h:%lu m:%lu}", v9, objc_msgSend(v10, "minute"));

  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  int64_t v13 = [MEMORY[0x1E4F1CA20] systemLocale];
  [v12 setLocale:v13];

  [v12 setDateStyle:1];
  [v12 setTimeStyle:3];
  BOOL v14 = [(NCDigestInfo *)self scheduleDate];
  v15 = [v12 stringFromDate:v14];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__NCDigestInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v21[3] = &unk_1E6A93C50;
  id v16 = v6;
  id v22 = v16;
  id v23 = v11;
  id v24 = v15;
  v25 = self;
  id v17 = v15;
  id v18 = v11;
  [v16 appendBodySectionWithName:0 multilinePrefix:v5 block:v21];

  id v19 = v16;
  return v19;
}

void __54__NCDigestInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 40) withName:@"scheduleTime"];
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 48) withName:@"scheduleDate"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 56) titleString];
  [v2 appendString:v3 withName:@"titleString"];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 56) headerString];
  [v4 appendString:v5 withName:@"headerString"];

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "_stringForDeliveryOrder:", objc_msgSend(*(id *)(a1 + 56), "deliveryOrder"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendString:v7 withName:@"deliveryOrder"];
}

- (id)_stringForDeliveryOrder:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E6A93C70[a3];
  }
}

- (id)succinctDescription
{
  v2 = [(NCDigestInfo *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return [(NCDigestInfo *)self descriptionBuilderWithMultilinePrefix:&stru_1F2F516F8];
}

- (NSDateComponents)scheduleTime
{
  return self->_scheduleTime;
}

- (NSDate)scheduleDate
{
  return self->_scheduleDate;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)headerString
{
  return self->_headerString;
}

- (int64_t)deliveryOrder
{
  return self->_deliveryOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_scheduleDate, 0);

  objc_storeStrong((id *)&self->_scheduleTime, 0);
}

@end