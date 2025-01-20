@interface KTSTHFailure
+ (id)fetchRequest;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (unint64_t)getUnsigned:(SEL)a3;
@end

@implementation KTSTHFailure

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTSTHFailure"];
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1002131E4(self, a3);
}

@end