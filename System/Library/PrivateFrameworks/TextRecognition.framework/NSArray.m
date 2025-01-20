@interface NSArray
@end

@implementation NSArray

BOOL __38__NSArray_FormField___fieldsOfSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_1F3946040] & 1) == 0)
  {

    id v4 = 0;
    goto LABEL_5;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  BOOL v5 = [v4 fieldSource] == *(void *)(a1 + 32);
LABEL_6:

  return v5;
}

BOOL __36__NSArray_FormField___fieldsOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_1F3946040] & 1) == 0)
  {

    id v4 = 0;
    goto LABEL_5;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  BOOL v5 = [v4 fieldType] == *(void *)(a1 + 32);
LABEL_6:

  return v5;
}

BOOL __38__NSArray_FormField___nonFieldRegions__block_invoke(uint64_t a1, void *a2)
{
  v2 = CRCastAsClass<CROutputRegion>(a2);
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 type] != 0x2000;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end