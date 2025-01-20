@interface TUMetadataDestinationID
+ (BOOL)supportsSecureCoding;
+ (id)metadataDestinationIDForCall:(id)a3;
+ (id)metadataDestinationIDsForCHRecentCall:(id)a3;
+ (id)metadataDestinationIDsForCHRecentCalls:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetadataDestinationID:(id)a3;
- (NSString)isoCountryCode;
- (TUHandle)handle;
- (TUMetadataDestinationID)initWithCoder:(id)a3;
- (TUMetadataDestinationID)initWithDestinationID:(id)a3 isoCountryCode:(id)a4;
- (TUMetadataDestinationID)initWithHandle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUMetadataDestinationID

- (void).cxx_destruct
{
}

+ (id)metadataDestinationIDsForCHRecentCalls:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v3;
  uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v39;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v38 + 1) + 8 * v4);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v31 = v4;
        v32 = v5;
        v6 = [v5 remoteParticipantHandles];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v35;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v35 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
              v12 = [v11 normalizedValue];
              uint64_t v13 = [v12 length];

              if (v13)
              {
                int64_t v14 = +[TUHandle handleTypeForCHHandle:v11];
                v15 = [TUHandle alloc];
                v16 = [v11 value];
                v17 = [v11 normalizedValue];
                v18 = [(TUHandle *)v15 initWithType:v14 value:v16 normalizedValue:v17];

                goto LABEL_13;
              }
              v20 = [v11 value];
              uint64_t v21 = [v20 length];

              if (!v21) {
                goto LABEL_22;
              }
              uint64_t v22 = [v11 type];
              switch(v22)
              {
                case 1:
                  v16 = [v11 value];
                  uint64_t v23 = +[TUHandle normalizedGenericHandleForValue:v16];
                  break;
                case 2:
                  v16 = [v11 value];
                  v24 = [v32 isoCountryCode];
                  v18 = +[TUHandle normalizedPhoneNumberHandleForValue:v16 isoCountryCode:v24];

                  goto LABEL_13;
                case 3:
                  v16 = [v11 value];
                  uint64_t v23 = +[TUHandle normalizedEmailAddressHandleForValue:v16];
                  break;
                default:
                  goto LABEL_22;
              }
              v18 = (TUHandle *)v23;
LABEL_13:

              if (v18)
              {
                v19 = [[TUMetadataDestinationID alloc] initWithHandle:v18];
                if (v19) {
                  [v33 addObject:v19];
                }
              }
LABEL_22:
              ++v10;
            }
            while (v8 != v10);
            uint64_t v25 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
            uint64_t v8 = v25;
          }
          while (v25);
        }

        uint64_t v4 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v30);
  }

  v26 = [v33 allObjects];

  return v26;
}

- (TUMetadataDestinationID)initWithHandle:(id)a3
{
  id v4 = a3;
  v5 = [v4 value];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    v12 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = [v4 normalizedValue];
  uint64_t v8 = [v7 length];

  if (v8) {
    goto LABEL_3;
  }
  uint64_t v14 = [v4 type];
  switch(v14)
  {
    case 1:
      v15 = [v4 value];
      uint64_t v16 = +[TUHandle normalizedGenericHandleForValue:v15];
      goto LABEL_14;
    case 2:
      v15 = [v4 value];
      v17 = [v4 isoCountryCode];
      id v9 = +[TUHandle normalizedPhoneNumberHandleForValue:v15 isoCountryCode:v17];

LABEL_16:
      if (v9) {
        goto LABEL_4;
      }
      break;
    case 3:
      v15 = [v4 value];
      uint64_t v16 = +[TUHandle normalizedEmailAddressHandleForValue:v15];
LABEL_14:
      id v9 = (id)v16;
      goto LABEL_16;
  }
LABEL_3:
  id v9 = v4;
LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)TUMetadataDestinationID;
  uint64_t v10 = [(TUMetadataDestinationID *)&v18 init];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_handle, v9);
  }
  self = v11;

  v12 = self;
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  v2 = [(TUMetadataDestinationID *)self handle];
  id v3 = [v2 normalizedValue];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TUMetadataDestinationID *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUMetadataDestinationID *)self isEqualToMetadataDestinationID:v4];
  }

  return v5;
}

- (BOOL)isEqualToMetadataDestinationID:(id)a3
{
  unint64_t v4 = [a3 handle];
  BOOL v5 = [(TUMetadataDestinationID *)self handle];
  char v6 = [v4 isEquivalentToHandle:v5];

  return v6;
}

- (TUHandle)handle
{
  return self->_handle;
}

+ (id)metadataDestinationIDsForCHRecentCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v9 count:1];

  uint64_t v7 = objc_msgSend(a1, "metadataDestinationIDsForCHRecentCalls:", v6, v9, v10);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[TUMetadataDestinationID allocWithZone:a3];
  id v5 = [(TUMetadataDestinationID *)self handle];
  char v6 = [(TUMetadataDestinationID *)v4 initWithHandle:v5];

  return v6;
}

+ (id)metadataDestinationIDForCall:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 handle];
  id v5 = v4;
  if (v4)
  {
    if ([v4 type] == 2)
    {
      char v6 = [v5 isoCountryCode];
      if ([v6 length])
      {
LABEL_6:

        goto LABEL_7;
      }
      uint64_t v7 = [v3 isoCountryCode];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        char v6 = [v5 value];
        id v9 = [v3 isoCountryCode];
        uint64_t v10 = +[TUHandle normalizedPhoneNumberHandleForValue:v6 isoCountryCode:v9];

        id v5 = (void *)v10;
        goto LABEL_6;
      }
    }
LABEL_7:
    v11 = [[TUMetadataDestinationID alloc] initWithHandle:v5];
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (TUMetadataDestinationID)initWithDestinationID:(id)a3 isoCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if ([v6 destinationIdIsEmailAddress])
    {
      uint64_t v8 = +[TUHandle normalizedEmailAddressHandleForValue:v6];
    }
    else if ([v6 destinationIdIsPhoneNumber] && objc_msgSend(v7, "length"))
    {
      uint64_t v8 = +[TUHandle normalizedPhoneNumberHandleForValue:v6 isoCountryCode:v7];
    }
    else
    {
      uint64_t v8 = +[TUHandle normalizedGenericHandleForValue:v6];
    }
    uint64_t v10 = (void *)v8;
    if (v8)
    {
      self = [(TUMetadataDestinationID *)self initWithHandle:v8];
      id v9 = self;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)isoCountryCode
{
  v2 = [(TUMetadataDestinationID *)self handle];
  id v3 = [v2 isoCountryCode];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v4 = a3;
  NSStringFromSelector(sel_handle);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:handle forKey:v5];
}

- (TUMetadataDestinationID)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUMetadataDestinationID;
  id v5 = [(TUMetadataDestinationID *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_handle);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v8;
  }
  return v5;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromSelector(sel_handle);
  uint64_t v6 = [(TUMetadataDestinationID *)self handle];
  id v7 = [v3 stringWithFormat:@"<%@ %p %@=%@>", v4, self, v5, v6];

  return v7;
}

@end