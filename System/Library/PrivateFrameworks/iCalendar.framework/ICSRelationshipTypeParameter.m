@interface ICSRelationshipTypeParameter
+ (id)relationshipParameterFromCode:(unint64_t)a3;
+ (id)relationshipTypeParameterFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSRelationshipTypeParameter

+ (id)relationshipTypeParameterFromICSString:(id)a3
{
  unint64_t v3 = +[ICSComponent relationshipTypeFromString:a3];
  return +[ICSRelationshipTypeParameter relationshipParameterFromCode:v3];
}

+ (id)relationshipParameterFromCode:(unint64_t)a3
{
  unint64_t v3 = [(ICSPredefinedValue *)[ICSRelationshipTypeParameter alloc] initWithLong:a3];
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = +[ICSComponent stringFromRelationshipType:[(ICSPredefinedValue *)self longValue]];
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);
}

@end