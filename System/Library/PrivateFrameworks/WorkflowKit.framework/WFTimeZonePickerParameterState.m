@interface WFTimeZonePickerParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
@end

@implementation WFTimeZonePickerParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  v8 = +[MTLJSONAdapter modelOfClass:objc_opt_class() fromJSONDictionary:v7 error:0];

  return v8;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  if (a3)
  {
    v4 = +[MTLJSONAdapter JSONDictionaryFromModel:a3 error:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end