@interface CXHandle
+ (CXHandle)handleWithTUHandle:(id)a3;
+ (id)handlesWithTUHandles:(id)a3;
+ (id)tuHandlesWithHandles:(id)a3;
- (CXHandle)initWithDestinationID:(id)a3;
- (TUHandle)tuHandle;
@end

@implementation CXHandle

+ (CXHandle)handleWithTUHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 type];
    uint64_t v6 = 2;
    if (v5 == (id)3) {
      uint64_t v6 = 3;
    }
    if (v5 == (id)1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    id v8 = objc_alloc((Class)CXHandle);
    v9 = [v4 value];
    v10 = [v4 siriDisplayName];
    id v11 = [v8 initWithType:v7 value:v9 siriDisplayName:v10];
  }
  else
  {
    id v11 = [objc_alloc((Class)CXHandle) initWithType:2];
  }

  return (CXHandle *)v11;
}

+ (id)tuHandlesWithHandles:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "tuHandle", (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

+ (id)handlesWithTUHandles:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "handleWithTUHandle:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (CXHandle)initWithDestinationID:(id)a3
{
  id v4 = a3;
  if ([v4 destinationIdIsEmailAddress])
  {
    uint64_t v5 = 3;
  }
  else if ([v4 destinationIdIsPhoneNumber])
  {
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  if (v4) {
    id v6 = [(CXHandle *)self initWithType:v5 value:v4];
  }
  else {
    id v6 = [(CXHandle *)self initWithType:v5];
  }
  id v7 = v6;

  return v7;
}

- (TUHandle)tuHandle
{
  id v3 = [(CXHandle *)self value];
  if (!v3) {
    goto LABEL_6;
  }
  CXHandleType v4 = [(CXHandle *)self type];
  switch(v4)
  {
    case CXHandleTypeEmailAddress:
      uint64_t v5 = +[TUHandle normalizedEmailAddressHandleForValue:v3];
      break;
    case CXHandleTypePhoneNumber:
      uint64_t v5 = +[TUHandle normalizedPhoneNumberHandleForValue:v3 isoCountryCode:0];
      break;
    case CXHandleTypeGeneric:
      uint64_t v5 = +[TUHandle normalizedGenericHandleForValue:v3];
      break;
    default:
LABEL_6:
      id v6 = 0;
      goto LABEL_11;
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = [(CXHandle *)self siriDisplayName];
    [v6 setSiriDisplayName:v7];
  }
LABEL_11:

  return (TUHandle *)v6;
}

@end