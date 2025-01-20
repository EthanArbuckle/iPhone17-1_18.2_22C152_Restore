@interface PPScoredItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScoredItem:(id)a3;
- (NSCopying)item;
- (PPScoredItem)initWithCoder:(id)a3;
- (PPScoredItem)initWithItem:(id)a3 score:(double)a4;
- (PPScoredItem)initWithItem:(id)a3 score:(double)a4 resultPosition:(unsigned __int16)a5 resultCount:(unsigned __int16)a6;
- (double)score;
- (unint64_t)hash;
- (unsigned)resultCount;
- (unsigned)resultPosition;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPScoredItem

- (void).cxx_destruct
{
}

- (unsigned)resultCount
{
  return self->_resultCount;
}

- (unsigned)resultPosition
{
  return self->_resultPosition;
}

- (double)score
{
  return self->_score;
}

- (NSCopying)item
{
  return self->_item;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPScoredItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PPScoredItem *)self isEqualToScoredItem:v4];
  }

  return v5;
}

- (BOOL)isEqualToScoredItem:(id)a3
{
  v6 = (PPScoredItem *)a3;
  v7 = v6;
  if (v6 == self)
  {
    BOOL v11 = 1;
    goto LABEL_20;
  }
  if (!v6)
  {
    BOOL v11 = 0;
    goto LABEL_20;
  }
  item = self->_item;
  v9 = item;
  if (!item)
  {
    v3 = [(PPScoredItem *)v6 item];
    if (!v3)
    {
      int v10 = 0;
      goto LABEL_12;
    }
    v9 = self->_item;
  }
  v4 = [(PPScoredItem *)v7 item];
  if (![(NSCopying *)v9 isEqual:v4])
  {
    BOOL v11 = 0;
    goto LABEL_17;
  }
  int v10 = 1;
LABEL_12:
  int resultPosition = self->_resultPosition;
  if (resultPosition != [(PPScoredItem *)v7 resultPosition]
    || (int resultCount = self->_resultCount, resultCount != [(PPScoredItem *)v7 resultCount]))
  {
    BOOL v11 = 0;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  double score = self->_score;
  [(PPScoredItem *)v7 score];
  BOOL v11 = vabdd_f64(score, v15) < 0.00000001;
  if (v10) {
LABEL_17:
  }

LABEL_18:
  if (!item) {

  }
LABEL_20:
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSCopying *)self->_item hash];
  uint64_t v4 = self->_resultPosition - v3 + 32 * v3;
  return self->_resultCount - v4 + 32 * v4;
}

- (void)encodeWithCoder:(id)a3
{
  item = self->_item;
  id v5 = a3;
  [v5 encodeObject:item forKey:@"item"];
  [v5 encodeDouble:@"score" forKey:self->_score];
  [v5 encodeInt32:self->_resultPosition forKey:@"rps"];
  [v5 encodeInt32:self->_resultCount forKey:@"rct"];
}

- (PPScoredItem)initWithCoder:(id)a3
{
  id v4 = a3;
  if (initWithCoder___pasOnceToken4 != -1) {
    dispatch_once(&initWithCoder___pasOnceToken4, &__block_literal_global_2798);
  }
  id v5 = [v4 decodeObjectOfClasses:initWithCoder___pasExprOnceResult forKey:@"item"];
  if (!v5
    || ([v4 decodeDoubleForKey:@"score"],
        double v7 = v6,
        unsigned int v8 = [v4 decodeInt32ForKey:@"rps"],
        HIWORD(v8))
    || (v9 = v8, unsigned int v10 = [v4 decodeInt32ForKey:@"rct"], HIWORD(v10)))
  {
    BOOL v11 = 0;
  }
  else
  {
    self = [(PPScoredItem *)self initWithItem:v5 score:v9 resultPosition:(unsigned __int16)v10 resultCount:v7];
    BOOL v11 = self;
  }

  return v11;
}

void __30__PPScoredItem_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = (void *)MEMORY[0x192F97350]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  id v5 = (void *)initWithCoder___pasExprOnceResult;
  initWithCoder___pasExprOnceResult = v4;
}

- (PPScoredItem)initWithItem:(id)a3 score:(double)a4
{
  return [(PPScoredItem *)self initWithItem:a3 score:0 resultPosition:0 resultCount:a4];
}

- (PPScoredItem)initWithItem:(id)a3 score:(double)a4 resultPosition:(unsigned __int16)a5 resultCount:(unsigned __int16)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPScoredItem;
  v12 = [(PPScoredItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    v13->_double score = a4;
    v13->_int resultPosition = a5;
    v13->_int resultCount = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end