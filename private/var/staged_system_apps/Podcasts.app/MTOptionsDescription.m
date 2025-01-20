@interface MTOptionsDescription
+ (id)optionsWithLongTitles:(id)a3 shortTitles:(id)a4 valueList:(id)a5;
+ (id)optionsWithLongTitles:(id)a3 shortTitles:(id)a4 valueList:(id)a5 footerTextCallback:(id)a6 headerTextCallback:(id)a7;
- (NSArray)longTitles;
- (NSArray)shortTitles;
- (NSOrderedSet)valueSet;
- (id)footerCallback;
- (id)headerCallback;
- (unint64_t)indexForValue:(unint64_t)a3;
- (unint64_t)valueForIndex:(unint64_t)a3;
- (void)setFooterCallback:(id)a3;
- (void)setHeaderCallback:(id)a3;
- (void)setLongTitles:(id)a3;
- (void)setShortTitles:(id)a3;
- (void)setValueSet:(id)a3;
@end

@implementation MTOptionsDescription

+ (id)optionsWithLongTitles:(id)a3 shortTitles:(id)a4 valueList:(id)a5 footerTextCallback:(id)a6 headerTextCallback:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(MTOptionsDescription);
  [(MTOptionsDescription *)v16 setShortTitles:v14];

  [(MTOptionsDescription *)v16 setLongTitles:v15];
  [(MTOptionsDescription *)v16 setValueSet:v13];

  [(MTOptionsDescription *)v16 setFooterCallback:v12];
  [(MTOptionsDescription *)v16 setHeaderCallback:v11];

  return v16;
}

+ (id)optionsWithLongTitles:(id)a3 shortTitles:(id)a4 valueList:(id)a5
{
  return [a1 optionsWithLongTitles:a3 shortTitles:a4 valueList:a5 footerTextCallback:0 headerTextCallback:0];
}

- (unint64_t)indexForValue:(unint64_t)a3
{
  valueSet = self->_valueSet;
  v4 = +[NSNumber numberWithUnsignedInteger:a3];
  NSUInteger v5 = [(NSOrderedSet *)valueSet indexOfObject:v4];

  return v5;
}

- (unint64_t)valueForIndex:(unint64_t)a3
{
  v3 = [(NSOrderedSet *)self->_valueSet objectAtIndex:a3];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (NSArray)longTitles
{
  return self->_longTitles;
}

- (void)setLongTitles:(id)a3
{
}

- (NSArray)shortTitles
{
  return self->_shortTitles;
}

- (void)setShortTitles:(id)a3
{
}

- (NSOrderedSet)valueSet
{
  return self->_valueSet;
}

- (void)setValueSet:(id)a3
{
}

- (id)footerCallback
{
  return self->_footerCallback;
}

- (void)setFooterCallback:(id)a3
{
}

- (id)headerCallback
{
  return self->_headerCallback;
}

- (void)setHeaderCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headerCallback, 0);
  objc_storeStrong(&self->_footerCallback, 0);
  objc_storeStrong((id *)&self->_valueSet, 0);
  objc_storeStrong((id *)&self->_shortTitles, 0);

  objc_storeStrong((id *)&self->_longTitles, 0);
}

@end