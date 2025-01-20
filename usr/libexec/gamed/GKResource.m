@interface GKResource
+ (GKResource)resourceWithID:(id)a3;
+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4;
+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4 TTL:(double)a5;
+ (id)resourceForPlayer:(id)a3;
+ (id)resourceForPlayer:(id)a3 TTL:(double)a4;
+ (id)resourceForRemoveGames:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isInvalid;
- (GKResource)init;
- (GKResource)initWithResourceID:(id)a3 representedItem:(id)a4 TTL:(double)a5;
- (NSMutableDictionary)metadataLookup;
- (NSObject)resourceID;
- (double)TTL;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)representedItem;
- (unint64_t)hash;
- (void)setInvalid:(BOOL)a3;
- (void)setMetadataLookup:(id)a3;
- (void)setRepresentedItem:(id)a3;
- (void)setResourceID:(id)a3;
- (void)setTTL:(double)a3;
@end

@implementation GKResource

+ (id)resourceForRemoveGames:(id)a3
{
  v3 = +[GKResource resourceWithID:a3 representedItem:a3];

  return v3;
}

+ (GKResource)resourceWithID:(id)a3
{
  return (GKResource *)[a1 resourceWithID:a3 representedItem:0 TTL:0.0];
}

+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4
{
  return (GKResource *)[a1 resourceWithID:a3 representedItem:a4 TTL:0.0];
}

+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4 TTL:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithResourceID:v8 representedItem:v7 TTL:a5];

  return (GKResource *)v9;
}

- (GKResource)initWithResourceID:(id)a3 representedItem:(id)a4 TTL:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GKResource;
  v10 = [(GKResource *)&v16 init];
  if (v10)
  {
    v11 = [v8 copyWithZone:0];
    resourceID = v10->_resourceID;
    v10->_resourceID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    metadataLookup = v10->_metadataLookup;
    v10->_metadataLookup = v13;

    v10->_TTL = a5;
    [(GKResource *)v10 setRepresentedItem:v9];
  }

  return v10;
}

- (GKResource)init
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"Can't use init on GKDataResource. Use resourceWithID: instead." userInfo:0];
  objc_exception_throw(v2);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(GKResource *)[GKMutableResource alloc] initWithResourceID:self->_resourceID representedItem:self->_representedItem TTL:self->_TTL];
  v5 = v4;
  if (v4)
  {
    v4->super._invalid = self->_invalid;
    id v6 = [(NSMutableDictionary *)self->_metadataLookup copy];
    [(GKResource *)v5 setMetadataLookup:v6];
  }
  return v5;
}

- (id)description
{
  if (qword_100329740 != -1) {
    dispatch_once(&qword_100329740, &stru_1002D98B0);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKResource;
  v3 = [(GKResource *)&v10 description];
  resourceID = self->_resourceID;
  v5 = (void *)qword_100329738;
  id v6 = +[NSDate dateWithTimeIntervalSince1970:self->_TTL];
  id v7 = [v5 stringFromDate:v6];
  id v8 = +[NSString stringWithFormat:@"%@ ID: %@ TTL: %@\nitem: %@", v3, resourceID, v7, self->_representedItem];

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)[self->_resourceID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    resourceID = self->_resourceID;
    id v6 = [v4 resourceID];
    unsigned __int8 v7 = [resourceID isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSMutableDictionary *)self->_metadataLookup objectForKeyedSubscript:a3];
}

- (BOOL)isExpired
{
  if ([(GKResource *)self isInvalid]) {
    return 1;
  }
  id v4 = +[NSDate dateWithTimeIntervalSince1970:self->_TTL];
  [v4 timeIntervalSinceNow];
  BOOL v3 = v5 <= 0.0;

  return v3;
}

- (BOOL)isInvalid
{
  return !self->_representedItem || self->_invalid;
}

- (NSObject)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
}

- (id)representedItem
{
  return self->_representedItem;
}

- (void)setRepresentedItem:(id)a3
{
}

- (double)TTL
{
  return self->_TTL;
}

- (void)setTTL:(double)a3
{
  self->_TTL = a3;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSMutableDictionary)metadataLookup
{
  return self->_metadataLookup;
}

- (void)setMetadataLookup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedItem, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);

  objc_storeStrong((id *)&self->_metadataLookup, 0);
}

+ (id)resourceForPlayer:(id)a3
{
  return _[a1 resourceForPlayer:a3 TTL:0.0];
}

+ (id)resourceForPlayer:(id)a3 TTL:(double)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  unsigned __int8 v7 = [v5 playerID];
  id v8 = [v6 resourceWithID:v7 representedItem:v5 TTL:a4];

  return v8;
}

@end