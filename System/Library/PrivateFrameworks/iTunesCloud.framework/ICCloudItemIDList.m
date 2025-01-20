@interface ICCloudItemIDList
+ (BOOL)supportsSecureCoding;
- (ICCloudItemIDList)init;
- (ICCloudItemIDList)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4;
- (void)addGlobalPlaylistID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCloudItemIDsUsingBlock:(id)a3;
- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5;
@end

@implementation ICCloudItemIDList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idTypes, 0);

  objc_storeStrong((id *)&self->_itemIDs, 0);
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_itemIDs count];
}

- (void)enumerateCloudItemIDsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, uint64_t, unsigned __int8 *))a3;
  if (v4)
  {
    unsigned __int8 v12 = 0;
    uint64_t v5 = [(NSMutableArray *)self->_itemIDs count];
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5 - 1;
      do
      {
        v8 = [(NSMutableArray *)self->_itemIDs objectAtIndex:v6];
        v9 = [(NSMutableArray *)self->_idTypes objectAtIndex:v6];
        uint64_t v10 = [v9 integerValue];

        v4[2](v4, v8, v10, v6, &v12);
        LODWORD(v9) = v12;

        if (v9) {
          break;
        }
      }
      while (v7 != v6++);
    }
  }
}

- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5
{
  itemIDs = self->_itemIDs;
  v9 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableArray *)itemIDs insertObject:v9 atIndex:a5];

  idTypes = self->_idTypes;
  id v11 = [NSNumber numberWithInteger:a4];
  [(NSMutableArray *)idTypes insertObject:v11 atIndex:a5];
}

- (void)addGlobalPlaylistID:(id)a3
{
  [(NSMutableArray *)self->_itemIDs addObject:a3];
  idTypes = self->_idTypes;

  [(NSMutableArray *)idTypes addObject:&unk_1EF640948];
}

- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4
{
  itemIDs = self->_itemIDs;
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableArray *)itemIDs addObject:v7];

  idTypes = self->_idTypes;
  id v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableArray *)idTypes addObject:v9];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p Item ID Count = %lu>", objc_opt_class(), self, -[NSMutableArray count](self->_itemIDs, "count")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSMutableArray *)self->_itemIDs copyWithZone:a3];
    uint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSMutableArray *)self->_idTypes copyWithZone:a3];
    id v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  itemIDs = self->_itemIDs;
  id v5 = a3;
  [v5 encodeObject:itemIDs forKey:@"ICCloudItemIDListItemIDs"];
  [v5 encodeObject:self->_idTypes forKey:@"ICCloudItemIDListIDTypes"];
}

- (ICCloudItemIDList)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICCloudItemIDList;
  id v5 = [(ICCloudItemIDList *)&v18 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ICCloudItemIDListItemIDs"];
    itemIDs = v5->_itemIDs;
    v5->_itemIDs = (NSMutableArray *)v10;

    unsigned __int8 v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"ICCloudItemIDListIDTypes"];
    idTypes = v5->_idTypes;
    v5->_idTypes = (NSMutableArray *)v15;
  }
  return v5;
}

- (ICCloudItemIDList)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICCloudItemIDList;
  v2 = [(ICCloudItemIDList *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    itemIDs = v2->_itemIDs;
    v2->_itemIDs = v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    idTypes = v2->_idTypes;
    v2->_idTypes = v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end