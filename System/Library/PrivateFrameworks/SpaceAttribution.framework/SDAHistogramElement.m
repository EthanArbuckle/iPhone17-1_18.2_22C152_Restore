@interface SDAHistogramElement
+ (id)newElement;
+ (id)newWithAge:(unint64_t)a3 andSize:(unint64_t)a4;
- (NSMutableArray)ageGroupCount;
- (NSMutableArray)sizeGroupCount;
- (NSMutableArray)sizeOfAgeGroupCount;
- (void)adjAge:(unint64_t)a3 andSize:(unint64_t)a4;
- (void)setAgeGroupCount:(id)a3;
- (void)setSizeGroupCount:(id)a3;
- (void)setSizeOfAgeGroupCount:(id)a3;
@end

@implementation SDAHistogramElement

+ (id)newElement
{
  if (qword_10005AAE8 != -1) {
    dispatch_once(&qword_10005AAE8, &stru_10004CF98);
  }
  v2 = objc_opt_new();
  int v3 = 8;
  v4 = +[NSMutableArray arrayWithCapacity:8];
  [v2 setAgeGroupCount:v4];

  v5 = +[NSMutableArray arrayWithCapacity:8];
  [v2 setSizeGroupCount:v5];

  v6 = +[NSMutableArray arrayWithCapacity:8];
  [v2 setSizeOfAgeGroupCount:v6];

  do
  {
    v7 = [v2 ageGroupCount];
    [v7 addObject:&off_10004FE38];

    v8 = [v2 sizeGroupCount];
    [v8 addObject:&off_10004FE38];

    v9 = [v2 sizeOfAgeGroupCount];
    [v9 addObject:&off_10004FE38];

    --v3;
  }
  while (v3);
  return v2;
}

+ (id)newWithAge:(unint64_t)a3 andSize:(unint64_t)a4
{
  id v6 = +[SDAHistogramElement newElement];
  [v6 adjAge:a3 andSize:a4];
  return v6;
}

- (void)adjAge:(unint64_t)a3 andSize:(unint64_t)a4
{
  unint64_t v6 = a3 / 0x3B9ACA00;
  uint64_t v7 = 7;
  do
  {
    v8 = [(id)qword_10005AAF8 objectAtIndexedSubscript:v7];
    id v9 = [v8 unsignedLongLongValue];

    if (v6 >= (unint64_t)v9) {
      break;
    }
    --v7;
  }
  while (v7);
  v10 = [(NSMutableArray *)self->_ageGroupCount objectAtIndexedSubscript:v7];
  v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v10 unsignedLongLongValue] + 1);
  [(NSMutableArray *)self->_ageGroupCount setObject:v11 atIndexedSubscript:v7];

  v12 = [(NSMutableArray *)self->_sizeOfAgeGroupCount objectAtIndexedSubscript:v7];
  v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v12 unsignedLongLongValue] + a4);
  [(NSMutableArray *)self->_sizeOfAgeGroupCount setObject:v13 atIndexedSubscript:v7];

  uint64_t v14 = 7;
  do
  {
    v15 = [(id)qword_10005AAF0 objectAtIndexedSubscript:v14];
    id v16 = [v15 unsignedLongLongValue];

    if ((unint64_t)v16 <= a4) {
      break;
    }
    --v14;
  }
  while (v14);
  id v18 = [(NSMutableArray *)self->_sizeGroupCount objectAtIndexedSubscript:v14];
  v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v18 unsignedLongLongValue] + 1);
  [(NSMutableArray *)self->_sizeGroupCount setObject:v17 atIndexedSubscript:v14];
}

- (NSMutableArray)ageGroupCount
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAgeGroupCount:(id)a3
{
}

- (NSMutableArray)sizeGroupCount
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSizeGroupCount:(id)a3
{
}

- (NSMutableArray)sizeOfAgeGroupCount
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSizeOfAgeGroupCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeOfAgeGroupCount, 0);
  objc_storeStrong((id *)&self->_sizeGroupCount, 0);
  objc_storeStrong((id *)&self->_ageGroupCount, 0);
}

@end