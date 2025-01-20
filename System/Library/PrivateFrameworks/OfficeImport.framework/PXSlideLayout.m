@interface PXSlideLayout
+ (id)stringForSlideLayoutType:(int)a3;
+ (void)initialize;
+ (void)readFromPackagePart:(id)a3 toSlideLayout:(id)a4 presentationState:(id)a5;
@end

@implementation PXSlideLayout

+ (void)initialize
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_52, 0, &dword_238A75000);
  }
  if (!slideLayoutTypeEnumMap)
  {
    v2 = [[TCEnumerationMap alloc] initWithStructs:&+[PXSlideLayout initialize]::slideLayoutTypeEnumStructs count:36 caseSensitive:1];
    v3 = (void *)slideLayoutTypeEnumMap;
    slideLayoutTypeEnumMap = (uint64_t)v2;
  }
}

+ (void)readFromPackagePart:(id)a3 toSlideLayout:(id)a4 presentationState:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (_xmlDoc *)[v15 xmlDocument];
  if (!v9) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v10 = OCXGetRootElement(v9);
  if (!v10) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v11 = CXDefaultStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  if (v11)
  {
    unsigned int v12 = [(id)slideLayoutTypeEnumMap valueForString:v11];
    if (v12 == -130883970) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    [v7 setSlideLayoutType:v13];
  }
  objc_msgSend(v7, "setShowMasterPlaceholderAnimations:", CXDefaultBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMasterPhAnim", 1));
  objc_msgSend(v7, "setShowMasterShapes:", CXDefaultBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMasterSp", 1));
  +[PXSlideChild readFromPackagePart:v15 toSlideChild:v7 presentationState:v8];
  v14 = [v15 location];
  [v8 setModelObject:v7 forLocation:v14];
}

+ (id)stringForSlideLayoutType:(int)a3
{
  return (id)[(id)slideLayoutTypeEnumMap stringForValue:*(void *)&a3];
}

@end