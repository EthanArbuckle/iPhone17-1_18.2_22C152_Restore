@interface PLChoosableItem
+ (id)choosableItemsFromCloudResources:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChoosableItem:(id)a3;
- (NSString)uniformTypeIdentifier;
- (PLChoosableItem)initWithCloudResource:(id)a3;
- (PLChoosableItem)initWithWidth:(int64_t)a3 height:(int64_t)a4 type:(int)a5 uniformTypeIdentifier:(id)a6;
- (id)description;
- (int)type;
- (int64_t)compareUsingWidth:(id)a3;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
@end

@implementation PLChoosableItem

- (void).cxx_destruct
{
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (int)type
{
  return self->_type;
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)compareUsingWidth:(id)a3
{
  id v4 = a3;
  int64_t width = self->_width;
  if (width > [v4 width]) {
    goto LABEL_5;
  }
  if ([v4 width] > self->_width)
  {
    int64_t v6 = -1;
    goto LABEL_6;
  }
  int type = self->_type;
  if (type > (int)[v4 type])
  {
LABEL_5:
    int64_t v6 = 1;
    goto LABEL_6;
  }
  if ((int)[v4 type] <= self->_type) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = -1;
  }
LABEL_6:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLChoosableItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PLChoosableItem *)self isEqualToChoosableItem:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqualToChoosableItem:(id)a3
{
  int type = self->_type;
  return type == [a3 type];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PLChoosableItem;
  v3 = [(PLChoosableItem *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" - width: %lld, height: %lld, type: %d, uti: %@", self->_width, self->_height, self->_type, self->_uniformTypeIdentifier];

  return v4;
}

- (PLChoosableItem)initWithCloudResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 unorientedWidth];
  uint64_t v6 = [v4 unorientedHeight];
  uint64_t v7 = [v4 cplType];
  v8 = [v4 uniformTypeIdentifier];

  v9 = [v8 identifier];
  v10 = [(PLChoosableItem *)self initWithWidth:v5 height:v6 type:v7 uniformTypeIdentifier:v9];

  return v10;
}

- (PLChoosableItem)initWithWidth:(int64_t)a3 height:(int64_t)a4 type:(int)a5 uniformTypeIdentifier:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLChoosableItem;
  v11 = [(PLChoosableItem *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    uniformTypeIdentifier = v11->_uniformTypeIdentifier;
    v11->_uniformTypeIdentifier = (NSString *)v12;

    v11->_int64_t width = a3;
    v11->_height = a4;
    v11->_int type = a5;
  }

  return v11;
}

+ (id)choosableItemsFromCloudResources:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [PLChoosableItem alloc];
        uint64_t v12 = -[PLChoosableItem initWithCloudResource:](v11, "initWithCloudResource:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end