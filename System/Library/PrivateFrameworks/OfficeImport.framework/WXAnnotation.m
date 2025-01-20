@interface WXAnnotation
+ (id)annotationTypeEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 type:(int)a5 state:(id)a6;
@end

@implementation WXAnnotation

+ (id)annotationTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_29, 0, &dword_238A75000);
  }
  if (+[WXAnnotation annotationTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXAnnotation annotationTypeEnumMap]::onceToken, &__block_literal_global_79);
  }
  v2 = (void *)+[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeEnumMap;
  return v2;
}

void __37__WXAnnotation_annotationTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeEnumMap;
  +[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeEnumMap = (uint64_t)v0;
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 type:(int)a5 state:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  if ([v10 hasAnnotations])
  {
    v11 = [v10 WXMainNamespace];
    v12 = CXRequiredLongAttribute(a3, v11, (xmlChar *)"id");

    v13 = [v10 annotationWithId:v12];
    v14 = (_xmlNode *)[v10 xmlAnnotationWithID:v12];
    if (v14)
    {
      v15 = [v9 addAnnotation:v7];
      v16 = v15;
      if (v7 == 2 && v13)
      {
        v17 = [v15 paragraph];
        [v17 removeRun:v16];
      }
      else if (v13)
      {
        [v13 setOtherEndOfRangedAnnotation:v15];
        [v16 setOtherEndOfRangedAnnotation:v13];
        [v16 useDataFromOtherEnd];
      }
      else
      {
        [v10 addAnnotationId:v12 annotation:v15];
        v18 = wmxmlGetAuthorProperty(v14);
        [v16 setOwner:v18];

        v19 = wmxmlGetDateProperty(v14);
        [v16 setDate:v19];

        v20 = [v10 drawingState];
        v40 = [v20 packagePart];

        v21 = [v10 drawingState];
        v22 = [v10 annotationPart];
        [v21 setPackagePart:v22];

        unsigned int v39 = [v10 isNewSectionRequested];
        [v10 setNewSectionRequested:0];
        id v41 = [[WXReadState alloc] initNoStacksWith:v10];
        v23 = [v16 text];
        +[WXText readFrom:v14 baseStyle:0 to:v23 state:v41];

        if ([v10 hasAnnotationsExtended])
        {
          [v16 paragraphIds];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v50;
LABEL_11:
            uint64_t v26 = 0;
            while (1)
            {
              if (*(void *)v50 != v25) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v49 + 1) + 8 * v26);
              if (!+[OCXSTValidator isValidValue:v27 simpleType:10])break; {
              objc_msgSend(v10, "addAnnotationParaId:annotation:", objc_msgSend(v27, "unsignedIntValue"), v16);
              }
              if (v24 == ++v26)
              {
                uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
                if (v24) {
                  goto LABEL_11;
                }
                goto LABEL_17;
              }
            }
          }
          else
          {
LABEL_17:

            v28 = [v10 drawingState];
            v29 = [v10 annotationExtendedPart];
            [v28 setPackagePart:v29];

            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v42 = obj;
            uint64_t v30 = [v42 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v46;
              while (2)
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v46 != v31) {
                    objc_enumerationMutation(v42);
                  }
                  v33 = (_xmlNode *)objc_msgSend(v10, "xmlAnnotationExtendedWithParaId:", objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "unsignedIntValue"));
                  v34 = v33;
                  if (v33)
                  {
                    objc_msgSend(v16, "setIsResolved:", CXDefaultBoolAttribute(v33, (CXNamespace *)WXWord2012Namespace, (xmlChar *)"done", 0));
                    unsigned int v44 = 0;
                    if (CXOptionalUnsignedAttributeFromHex8X(v34, (CXNamespace *)WXWord2012Namespace, (xmlChar *)"paraIdParent", &v44))
                    {
                      v35 = [NSNumber numberWithUnsignedInt:v44];
                      BOOL v36 = +[OCXSTValidator isValidValue:v35 simpleType:10];

                      if (v36)
                      {
                        v37 = [v10 annotationWithParaId:v44];
                        [v16 setParent:v37];

                        goto LABEL_29;
                      }
                    }
                  }
                }
                uint64_t v30 = [v42 countByEnumeratingWithState:&v45 objects:v53 count:16];
                if (v30) {
                  continue;
                }
                break;
              }
            }
          }
LABEL_29:
        }
        v38 = [v10 drawingState];
        [v38 setPackagePart:v40];

        [v10 setNewSectionRequested:v39];
      }
    }
  }
}

@end