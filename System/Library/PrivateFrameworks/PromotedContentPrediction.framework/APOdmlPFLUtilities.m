@interface APOdmlPFLUtilities
+ (float)convertToFloat:(id)a3;
+ (id)convertToArray:(float *)a3 count:(unint64_t)a4;
+ (id)keyForTypes:(id)a3 placementType:(unint64_t)a4 assetManagerType:(unint64_t)a5;
+ (id)pluginStringForPlacementType:(unint64_t)a3;
@end

@implementation APOdmlPFLUtilities

+ (float)convertToFloat:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_count(v3, v4, v5);
  v9 = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  for (unint64_t i = 0; i < objc_msgSend_count(v3, v7, v8); ++i)
  {
    v12 = objc_msgSend_objectAtIndexedSubscript_(v3, v11, i);
    objc_msgSend_floatValue(v12, v13, v14);
    v9[i] = v15;
  }
  return v9;
}

+ (id)convertToArray:(float *)a3 count:(unint64_t)a4
{
  uint64_t v5 = a3;
  for (unint64_t i = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3);
  {
    *(float *)&double v9 = *v5;
    v10 = objc_msgSend_numberWithFloat_(NSNumber, v6, v7, v9);
    objc_msgSend_addObject_(i, v11, (uint64_t)v10);

    ++v5;
  }

  return i;
}

+ (id)keyForTypes:(id)a3 placementType:(unint64_t)a4 assetManagerType:(unint64_t)a5
{
  uint64_t v7 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], a2, (uint64_t)a3);
  objc_msgSend_appendString_(v7, v8, @"_");
  v10 = objc_msgSend_stringWithFormat_(NSString, v9, @"%lu", a4);
  objc_msgSend_appendString_(v7, v11, (uint64_t)v10);

  objc_msgSend_appendString_(v7, v12, @"_");
  uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v13, @"%lu", a5);
  objc_msgSend_appendString_(v7, v15, (uint64_t)v14);

  v18 = objc_msgSend_copy(v7, v16, v17);

  return v18;
}

+ (id)pluginStringForPlacementType:(unint64_t)a3
{
  id v3 = kAPOdmlDESPluginSLPPluginName;
  if (!a3) {
    id v3 = kAPOdmlDESPluginSRPPluginName;
  }
  return *v3;
}

@end