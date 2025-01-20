@interface NMSPodcastIdentifierSet
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPodcastIdentifierSet:(id)a3;
- (NMSPodcastIdentifierSet)initWithDictionary:(id)a3;
- (NMSPodcastIdentifierSet)initWithStoreID:(id)a3 feedURL:(id)a4;
- (NSNumber)storeID;
- (NSString)feedURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation NMSPodcastIdentifierSet

- (NMSPodcastIdentifierSet)initWithStoreID:(id)a3 feedURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NMSPodcastIdentifierSet;
  v9 = [(NMSPodcastIdentifierSet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeID, a3);
    objc_storeStrong((id *)&v10->_feedURL, a4);
  }

  return v10;
}

- (NMSPodcastIdentifierSet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"storeID"];
  if ([v5 isEqualToNumber:&unk_26D51D220])
  {

    v5 = 0;
  }
  v6 = [v4 objectForKey:@"feedURL"];
  if (![v6 length])
  {

    v6 = 0;
  }
  id v7 = [(NMSPodcastIdentifierSet *)self initWithStoreID:v5 feedURL:v6];

  return v7;
}

- (id)dictionaryRepresentation
{
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"storeID";
  v3 = [(NMSPodcastIdentifierSet *)self storeID];
  uint64_t v4 = [v3 copy];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = &unk_26D51D220;
  }
  v13[1] = @"feedURL";
  v14[0] = v6;
  id v7 = [(NMSPodcastIdentifierSet *)self feedURL];
  uint64_t v8 = [v7 copy];
  v9 = (void *)v8;
  v10 = &stru_26D512A48;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v14[1] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (BOOL)isEqualToPodcastIdentifierSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NMSPodcastIdentifierSet *)self storeID];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [v4 storeID];

    if (v7)
    {
      uint64_t v8 = [(NMSPodcastIdentifierSet *)self storeID];
      v9 = [v4 storeID];
      char v10 = [v8 isEqualToNumber:v9];
LABEL_7:
      BOOL v14 = v10;

      goto LABEL_15;
    }
  }
  uint64_t v11 = [(NMSPodcastIdentifierSet *)self feedURL];
  if (v11)
  {
    objc_super v12 = (void *)v11;
    v13 = [v4 feedURL];

    if (v13)
    {
      uint64_t v8 = [(NMSPodcastIdentifierSet *)self feedURL];
      v9 = [v4 feedURL];
      char v10 = [v8 isEqualToString:v9];
      goto LABEL_7;
    }
  }
  v15 = [(NMSPodcastIdentifierSet *)self storeID];
  if (v15)
  {
    BOOL v16 = 0;
  }
  else
  {
    v17 = [v4 storeID];
    BOOL v16 = v17 == 0;
  }
  v18 = [(NMSPodcastIdentifierSet *)self feedURL];
  if (v18)
  {
    BOOL v19 = 0;
  }
  else
  {
    v20 = [v4 feedURL];
    BOOL v19 = v20 == 0;
  }
  BOOL v14 = v16 && v19;
LABEL_15:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NMSPodcastIdentifierSet *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NMSPodcastIdentifierSet *)self isEqualToPodcastIdentifierSet:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(NMSPodcastIdentifierSet *)self storeID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)NMSPodcastIdentifierSet;
  id v4 = [(NMSPodcastIdentifierSet *)&v9 description];
  BOOL v5 = [(NMSPodcastIdentifierSet *)self storeID];
  v6 = [(NMSPodcastIdentifierSet *)self feedURL];
  id v7 = [v3 stringWithFormat:@"%@ storeID <%@> feedURL <%@>", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)-[NSNumber copyWithZone:](self->_storeID, "copyWithZone:");
  v6 = (void *)[(NSString *)self->_feedURL copyWithZone:a3];
  id v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStoreID:feedURL:", v5, v6);

  return v7;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedURL, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end