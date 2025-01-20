@interface PFXUtilities
+ (BOOL)elementDenotesList:(const char *)a3;
+ (BOOL)elementDenotesListItem:(const char *)a3;
+ (BOOL)elementHasTextAlign:(const char *)a3;
+ (BOOL)elementIsTableRelated:(const char *)a3;
+ (BOOL)hasEntry:(id)a3 inArchive:(id)a4;
+ (id)createPIRegularExpressionForAttribute:(id)a3 searchOptions:(unint64_t)a4;
+ (id)valueForRegExpression:(id)a3 inProcessingInstruction:(id)a4 searchOptions:(unint64_t)a5 attributeName:(id)a6;
+ (id)valueOfHrefAttributeInProcessingInstruction:(id)a3;
+ (id)valueOfMediaAttributeInProcessingInstruction:(id)a3;
+ (id)valueOfTypeAttributeInProcessingInstruction:(id)a3;
@end

@implementation PFXUtilities

+ (BOOL)elementHasTextAlign:(const char *)a3
{
  id v3 = +[PFXElementInfo elementInfoForElement:a3];
  if (v3)
  {
    LOBYTE(v3) = [v3 hasTextAlign];
  }
  return (char)v3;
}

+ (BOOL)elementIsTableRelated:(const char *)a3
{
  id v3 = +[PFXElementInfo elementInfoForElement:a3];
  if (v3)
  {
    LOBYTE(v3) = [v3 isTableRelated];
  }
  return (char)v3;
}

+ (BOOL)elementDenotesList:(const char *)a3
{
  id v3 = +[PFXElementInfo elementInfoForElement:a3];
  if (v3)
  {
    LOBYTE(v3) = [v3 denotesList];
  }
  return (char)v3;
}

+ (BOOL)elementDenotesListItem:(const char *)a3
{
  id v3 = +[PFXElementInfo elementInfoForElement:a3];
  if (v3)
  {
    LOBYTE(v3) = [v3 denotesListItem];
  }
  return (char)v3;
}

+ (BOOL)hasEntry:(id)a3 inArchive:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return [a4 entryWithName] != 0;
    }
  }
  return result;
}

+ (id)valueForRegExpression:(id)a3 inProcessingInstruction:(id)a4 searchOptions:(unint64_t)a5 attributeName:(id)a6
{
  id v8 = [a3 matchesInString:a4 options:a5 range:0, [a4 length]];
  if (!v8) {
    return 0;
  }
  v9 = v8;
  if (![v8 count]) {
    return 0;
  }
  id v10 = objc_msgSend(objc_msgSend(v9, "lastObject"), "range");
  id v12 = [[a4 substringWithRange:v10, v11] substringFromIndex:[a6 length] + 2];
  v13 = (char *)[v12 length] - 1;

  return [v12 substringToIndex:v13];
}

+ (id)createPIRegularExpressionForAttribute:(id)a3 searchOptions:(unint64_t)a4
{
  id v6 = 0;
  id v4 = [objc_alloc((Class)NSRegularExpression) initWithPattern:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@=[\"'][A-Za-z0-9 .\\-/\\(\\):]+[\"']", a3), a4, &v6 options error];
  if (v6) {

  }
  return v4;
}

+ (id)valueOfHrefAttributeInProcessingInstruction:(id)a3
{
  if (!qword_573410)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!qword_573410) {
      qword_573410 = (uint64_t)[a1 createPIRegularExpressionForAttribute:@"href" searchOptions:0];
    }
    objc_sync_exit(v4);
  }

  return [a1 valueForRegExpression:inProcessingInstruction:searchOptions:attributeName:];
}

+ (id)valueOfMediaAttributeInProcessingInstruction:(id)a3
{
  if (!qword_573418)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!qword_573418) {
      qword_573418 = (uint64_t)[a1 createPIRegularExpressionForAttribute:@"media" searchOptions:0];
    }
    objc_sync_exit(v4);
  }

  return [a1 valueForRegExpression:inProcessingInstruction:searchOptions:attributeName:];
}

+ (id)valueOfTypeAttributeInProcessingInstruction:(id)a3
{
  if (!qword_573420)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!qword_573420) {
      qword_573420 = (uint64_t)[a1 createPIRegularExpressionForAttribute:@"type" searchOptions:0];
    }
    objc_sync_exit(v4);
  }

  return [a1 valueForRegExpression:inProcessingInstruction:searchOptions:attributeName:];
}

@end