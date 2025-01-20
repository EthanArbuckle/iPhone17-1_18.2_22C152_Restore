@interface MSULogAnnotatedSum
+ (id)sum;
- (MSULogAnnotatedSum)init;
- (NSString)label;
- (id)description;
- (unint64_t)padding;
- (unint64_t)unit;
- (void)add:(int64_t)a3 annotation:(id)a4;
- (void)add:(int64_t)a3 annotationFormat:(id)a4;
- (void)dealloc;
- (void)format:(unint64_t)a3 label:(id)a4 padding:(unint64_t)a5;
@end

@implementation MSULogAnnotatedSum

+ (id)sum
{
  v2 = objc_alloc_init(MSULogAnnotatedSum);
  return v2;
}

- (MSULogAnnotatedSum)init
{
  v4.receiver = self;
  v4.super_class = (Class)MSULogAnnotatedSum;
  v2 = [(MSULogAnnotatedSum *)&v4 init];
  if (v2)
  {
    v2->addends = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->annotations = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->cachedDescription = 0;
    v2->_unit = 0x100000;
    v2->_label = (NSString *)@"MB";
    v2->_padding = 2;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSULogAnnotatedSum;
  [(MSULogAnnotatedSum *)&v3 dealloc];
}

- (void)format:(unint64_t)a3 label:(id)a4 padding:(unint64_t)a5
{
  objc_sync_enter(self);
  if (a3)
  {
    self->_unit = a3;
    self->_label = (NSString *)a4;
    self->_padding = a5;

    self->cachedDescription = 0;
  }
  objc_sync_exit(self);
}

- (void)add:(int64_t)a3 annotation:(id)a4
{
  objc_sync_enter(self);
  v7 = +[NSNumber numberWithLongLong:a3];
  if (v7)
  {
    [(NSMutableArray *)self->addends addObject:v7];
    if (a4) {
      CFStringRef v8 = (const __CFString *)a4;
    }
    else {
      CFStringRef v8 = &stru_10005C5C0;
    }
    [(NSMutableArray *)self->annotations addObject:v8];

    self->cachedDescription = 0;
  }
  objc_sync_exit(self);
}

- (void)add:(int64_t)a3 annotationFormat:(id)a4
{
  id v6 = [objc_alloc((Class)NSString) initWithFormat:a4 arguments:&v7];
  [(MSULogAnnotatedSum *)self add:a3 annotation:v6];
}

- (id)description
{
  objc_sync_enter(self);
  cachedDescription = self->cachedDescription;
  if (!cachedDescription)
  {
    v22 = +[NSMutableString stringWithString:@"\n"];
    v21 = (char *)[(NSMutableArray *)self->addends count];
    uint64_t v23 = [(MSULogAnnotatedSum *)self unit];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    addends = self->addends;
    id v5 = [(NSMutableArray *)addends countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v25;
      unint64_t v7 = 1;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(addends);
          }
          v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          NSUInteger v11 = -[NSString length](-[NSNumber stringValue](+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (uint64_t)[v9 longLongValue] / v23), "stringValue"), "length");
          if (v11 > v7) {
            unint64_t v7 = v11;
          }
        }
        id v5 = [(NSMutableArray *)addends countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v5);
    }
    else
    {
      unint64_t v7 = 1;
    }
    if (v21)
    {
      uint64_t v12 = 0;
      for (j = 0; j != v21; ++j)
      {
        uint64_t v14 = (uint64_t)objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->addends, "objectAtIndexedSubscript:", j), "longLongValue");
        id v15 = [(NSMutableArray *)self->annotations objectAtIndexedSubscript:j];
        id v16 = [(NSMutableString *)v22 length];
        [(NSMutableString *)v22 appendFormat:@"%*lld", (char *)[(MSULogAnnotatedSum *)self padding] + v7, v14 / v23];
        if ([(NSString *)[(MSULogAnnotatedSum *)self label] length]) {
          [(NSMutableString *)v22 appendFormat:@" %@", [(MSULogAnnotatedSum *)self label]];
        }
        if ([v15 length]) {
          [(NSMutableString *)v22 appendFormat:@" %@", v15];
        }
        [(NSMutableString *)v22 appendString:@"\n"];
        v12 += v14 / v23;
      }
      if ([(MSULogAnnotatedSum *)self padding]) {
        [(NSMutableString *)v22 replaceCharactersInRange:v16, 1, @"+" withString];
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    for (unint64_t k = 0; k < [(MSULogAnnotatedSum *)self padding] + v7; ++k)
      [(NSMutableString *)v22 appendString:@"-"];
    [(NSMutableString *)v22 appendString:@"\n"];
    [(NSMutableString *)v22 appendFormat:@"%*lld", (char *)[(MSULogAnnotatedSum *)self padding] + v7, v12];
    if ([(NSString *)[(MSULogAnnotatedSum *)self label] length]) {
      [(NSMutableString *)v22 appendFormat:@" %@", [(MSULogAnnotatedSum *)self label]];
    }
    if (v22) {
      self->cachedDescription = (NSString *)[objc_alloc((Class)NSString) initWithString:v22];
    }
    cachedDescription = self->cachedDescription;
  }
  if (cachedDescription) {
    CFStringRef v18 = (const __CFString *)cachedDescription;
  }
  else {
    CFStringRef v18 = @"<MSUAnnotatedSum>";
  }
  objc_sync_exit(self);
  return (id)v18;
}

- (unint64_t)unit
{
  return self->_unit;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)padding
{
  return self->_padding;
}

@end