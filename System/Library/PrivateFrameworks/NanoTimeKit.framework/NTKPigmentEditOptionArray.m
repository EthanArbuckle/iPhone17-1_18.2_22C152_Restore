@interface NTKPigmentEditOptionArray
+ (NTKPigmentEditOptionArray)arrayWithEquality:(unint64_t)a3;
+ (id)array;
- (BOOL)containsPigment:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NTKPigmentEditOptionArray)init;
- (NTKPigmentEditOptionArray)initWithEquality:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)pigmentAtIndex:(unint64_t)a3;
- (id)pigmentForPigment:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)equality;
- (unint64_t)indexOfPigment:(id)a3;
- (void)addPigment:(id)a3;
- (void)enumeratePigmentsUsingBlock:(id)a3;
- (void)enumeratePigmentsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)insertPigment:(id)a3 atIndex:(unint64_t)a4;
- (void)removePigment:(id)a3;
- (void)removePigmentAtIndex:(unint64_t)a3;
@end

@implementation NTKPigmentEditOptionArray

- (NTKPigmentEditOptionArray)init
{
  return [(NTKPigmentEditOptionArray *)self initWithEquality:0];
}

- (NTKPigmentEditOptionArray)initWithEquality:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPigmentEditOptionArray;
  v4 = [(NTKPigmentEditOptionArray *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_equality = a3;
    uint64_t v6 = objc_opt_new();
    backing = v5->_backing;
    v5->_backing = (NSMutableArray *)v6;
  }
  return v5;
}

+ (id)array
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (NTKPigmentEditOptionArray)arrayWithEquality:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEquality:a3];
  return (NTKPigmentEditOptionArray *)v3;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_backing count];
}

- (unint64_t)indexOfPigment:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  backing = self->_backing;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__NTKPigmentEditOptionArray_indexOfPigment___block_invoke;
  v9[3] = &unk_1E62C88A0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(NSMutableArray *)backing enumerateObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__NTKPigmentEditOptionArray_indexOfPigment___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v8 == 1)
  {
    id v12 = v7;
    int v10 = [*(id *)(a1 + 40) isEqual:v7];
    id v7 = v12;
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!v8)
  {
    id v11 = v7;
    char v9 = [*(id *)(a1 + 40) isEqualIgnoringFraction:v7];
    id v7 = v11;
    if (v9)
    {
LABEL_6:
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
LABEL_7:
}

- (id)pigmentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_backing objectAtIndex:a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_backing objectAtIndexedSubscript:a3];
}

- (id)pigmentForPigment:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKPigmentEditOptionArray *)self indexOfPigment:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(NTKPigmentEditOptionArray *)self pigmentAtIndex:v5];
  }
  id v7 = v6;

  return v7;
}

- (BOOL)containsPigment:(id)a3
{
  return [(NTKPigmentEditOptionArray *)self indexOfPigment:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumeratePigmentsUsingBlock:(id)a3
{
}

- (void)enumeratePigmentsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)addPigment:(id)a3
{
  id v6 = a3;
  unint64_t v4 = -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:");
  backing = self->_backing;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)backing addObject:v6];
  }
  else {
    [(NSMutableArray *)backing replaceObjectAtIndex:v4 withObject:v6];
  }
}

- (void)insertPigment:(id)a3 atIndex:(unint64_t)a4
{
  id v8 = a3;
  unint64_t v6 = -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:");
  backing = self->_backing;
  if (v6 == a4)
  {
    [(NSMutableArray *)backing replaceObjectAtIndex:a4 withObject:v8];
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](backing, "removeObjectAtIndex:");
    [(NSMutableArray *)self->_backing insertObject:v8 atIndex:a4];
  }
}

- (void)removePigment:(id)a3
{
  unint64_t v4 = [(NTKPigmentEditOptionArray *)self indexOfPigment:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    backing = self->_backing;
    [(NSMutableArray *)backing removeObjectAtIndex:v5];
  }
}

- (void)removePigmentAtIndex:(unint64_t)a3
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_backing countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[NTKPigmentEditOptionArray equality](self, "equality"), v5 == [v4 equality])
    && (unint64_t v6 = -[NTKPigmentEditOptionArray count](self, "count"), v6 == [v4 count]))
  {
    if ([(NTKPigmentEditOptionArray *)self count])
    {
      for (unint64_t i = 0; i < [(NTKPigmentEditOptionArray *)self count]; ++i)
      {
        id v8 = [(NTKPigmentEditOptionArray *)self pigmentAtIndex:i];
        char v9 = [v4 pigmentAtIndex:i];
        unint64_t equality = self->_equality;
        if (equality == 1)
        {
          if (![v8 isEqual:v9]) {
            goto LABEL_13;
          }
        }
        else if (!equality && ([v8 isEqualIgnoringFraction:v9] & 1) == 0)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
    }
    BOOL v11 = 1;
  }
  else
  {
LABEL_14:
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)equality
{
  return self->_equality;
}

- (void).cxx_destruct
{
}

@end