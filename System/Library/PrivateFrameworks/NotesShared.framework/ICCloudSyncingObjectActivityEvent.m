@interface ICCloudSyncingObjectActivityEvent
+ (void)registerWithICCRCoder;
- (BOOL)isEqual:(id)a3;
- (ICCloudSyncingObjectActivityEvent)initWithData:(id)a3 fallbackData:(id)a4;
- (ICCloudSyncingObjectActivityEvent)initWithICCRCoder:(id)a3;
- (NSData)data;
- (NSData)fallbackData;
- (NSString)description;
- (id)deltaSince:(id)a3 in:(id)a4;
- (unint64_t)hash;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
@end

@implementation ICCloudSyncingObjectActivityEvent

+ (void)registerWithICCRCoder
{
}

- (ICCloudSyncingObjectActivityEvent)initWithData:(id)a3 fallbackData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCloudSyncingObjectActivityEvent;
  v9 = [(ICCloudSyncingObjectActivityEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_fallbackData, a4);
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ICCloudSyncingObjectActivityEvent *)self data];
  v6 = objc_msgSend(v5, "ic_stringValue");
  id v7 = [(ICCloudSyncingObjectActivityEvent *)self fallbackData];
  id v8 = objc_msgSend(v7, "ic_stringValue");
  v9 = [v3 stringWithFormat:@"<%@: %p, dataString: %@, fallbackDataString: %@>", v4, self, v6, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  v6 = [v5 data];
  id v7 = [(ICCloudSyncingObjectActivityEvent *)self data];
  char v8 = [v6 isEqual:v7];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ICCloudSyncingObjectActivityEvent *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  return 0;
}

- (void)mergeWith:(id)a3
{
  if (![(ICCloudSyncingObjectActivityEvent *)self isEqual:a3])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F836F8];
    [v3 handleFailedAssertWithCondition:"[self isEqual:other]" functionName:"-[ICCloudSyncingObjectActivityEvent mergeWith:]" simulateCrash:1 showAlert:0 format:@"Cannot merge ICCloudSyncingObjectActivity with a different value"];
  }
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ICCloudSyncingObjectActivityEvent *)self data];
  [v7 encodeData:v4 forKey:@"data"];

  v5 = [(ICCloudSyncingObjectActivityEvent *)self fallbackData];
  if (v5)
  {
    v6 = [(ICCloudSyncingObjectActivityEvent *)self fallbackData];
    [v7 encodeData:v6 forKey:@"fallbackData"];
  }
}

- (ICCloudSyncingObjectActivityEvent)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeDataForKey:@"data"];
  if ([v4 hasDecodableValueForKey:@"fallbackData"])
  {
    v6 = [v4 decodeDataForKey:@"fallbackData"];
  }
  else
  {
    v6 = 0;
  }
  id v7 = [(ICCloudSyncingObjectActivityEvent *)self initWithData:v5 fallbackData:v6];

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)fallbackData
{
  return self->_fallbackData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end