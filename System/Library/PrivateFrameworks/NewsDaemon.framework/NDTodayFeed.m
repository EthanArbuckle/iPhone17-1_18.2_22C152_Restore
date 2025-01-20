@interface NDTodayFeed
+ (BOOL)supportsSecureCoding;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (NDTodayFeed)initWithCoder:(id)a3;
- (NDTodayFeed)initWithConfigData:(id)a3 publishDate:(id)a4 contentManifest:(id)a5 contentArchive:(id)a6;
- (NSData)configData;
- (NSDate)publishDate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NDTodayFeed

- (NDTodayFeed)initWithConfigData:(id)a3 publishDate:(id)a4 contentManifest:(id)a5 contentArchive:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NDTodayFeed;
  v14 = [(NDTodayFeed *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    configData = v14->_configData;
    v14->_configData = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    publishDate = v14->_publishDate;
    v14->_publishDate = (NSDate *)v17;

    objc_storeStrong((id *)&v14->_contentManifest, a5);
    objc_storeStrong((id *)&v14->_contentArchive, a6);
  }

  return v14;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F7E390]) initWithObject:self];
  v4 = NSString;
  v5 = [(NDTodayFeed *)self configData];
  v6 = objc_msgSend(v4, "stringWithFormat:", @"<%lu bytes>", objc_msgSend(v5, "length"));
  [v3 addField:@"configData" object:v6];

  v7 = [(NDTodayFeed *)self publishDate];
  [v3 addField:@"publishDate" object:v7];

  v8 = [(NDTodayFeed *)self contentManifest];
  [v3 addField:@"contentManifest" object:v8];

  v9 = [v3 descriptionString];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDTodayFeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publishDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentManifest"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentArchive"];

  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1C9B8] data];
  }
  id v10 = v6;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v11 = v7;
  if (v7)
  {
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F7E358] empty];
    if (v8)
    {
LABEL_7:
      id v12 = [(NDTodayFeed *)self initWithConfigData:v9 publishDate:v10 contentManifest:v11 contentArchive:v8];
      if (v7) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  v14 = [MEMORY[0x1E4F7E348] empty];
  id v12 = [(NDTodayFeed *)self initWithConfigData:v9 publishDate:v10 contentManifest:v11 contentArchive:v14];

  if (v7)
  {
LABEL_8:
    if (v6) {
      goto LABEL_9;
    }
LABEL_14:

    if (v5) {
      goto LABEL_10;
    }
LABEL_15:

    goto LABEL_10;
  }
LABEL_13:

  if (!v6) {
    goto LABEL_14;
  }
LABEL_9:
  if (!v5) {
    goto LABEL_15;
  }
LABEL_10:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NDTodayFeed *)self configData];
  [v4 encodeObject:v5 forKey:@"configData"];

  v6 = [(NDTodayFeed *)self publishDate];
  [v4 encodeObject:v6 forKey:@"publishDate"];

  v7 = [(NDTodayFeed *)self contentManifest];
  [v4 encodeObject:v7 forKey:@"contentManifest"];

  id v8 = [(NDTodayFeed *)self contentArchive];
  [v4 encodeObject:v8 forKey:@"contentArchive"];
}

- (NSData)configData
{
  return self->_configData;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (FCContentManifest)contentManifest
{
  return self->_contentManifest;
}

- (FCContentArchive)contentArchive
{
  return self->_contentArchive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentArchive, 0);
  objc_storeStrong((id *)&self->_contentManifest, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);

  objc_storeStrong((id *)&self->_configData, 0);
}

@end