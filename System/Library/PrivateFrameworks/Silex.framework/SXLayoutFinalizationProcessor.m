@interface SXLayoutFinalizationProcessor
- (SXLayoutFinalizationProcessor)initWithUnitConverterFactory:(id)a3;
- (SXUnitConverterFactory)unitConverterFactory;
- (void)finalizeLayoutBlueprint:(id)a3 origin:(CGPoint)a4 absoluteOrigin:(CGPoint)a5;
- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5;
@end

@implementation SXLayoutFinalizationProcessor

- (SXLayoutFinalizationProcessor)initWithUnitConverterFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLayoutFinalizationProcessor;
  v6 = [(SXLayoutFinalizationProcessor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_unitConverterFactory, a3);
  }

  return v7;
}

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
}

- (void)finalizeLayoutBlueprint:(id)a3 origin:(CGPoint)a4 absoluteOrigin:(CGPoint)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = [v6 componentIdentifiers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v82 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = [v6 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v81 + 1) + 8 * i)];
        unitConverterFactordouble y = self->_unitConverterFactory;
        [v11 frame];
        double Width = CGRectGetWidth(v87);
        [v6 blueprintSize];
        double v15 = v14;
        v16 = [v6 layoutOptions];
        v17 = [(SXUnitConverterFactory *)unitConverterFactory createUnitConverterWithComponentWidth:v16 parentWidth:Width layoutOptions:v15];

        v18 = [v11 componentSizer];
        [v18 layoutMarginsWithUnitConverter:v17];
        double v20 = v19;
        double v75 = v19;
        double v76 = v21;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;

        v27 = [v11 componentSizer];
        [v27 contentInsetsWithUnitConverter:v17];
        double v29 = v28;
        double v71 = v30;
        double v72 = v28;
        double v31 = v30;
        double v33 = v32;
        double v73 = v34;
        double v74 = v32;
        double v35 = v34;

        v36 = [v11 componentSizer];
        [v36 bordersInsetsWithUnitConverter:v17];
        double v77 = v37;
        double v78 = v38;
        double v79 = v39;
        double v80 = v40;

        double v41 = v29 - v20;
        double v42 = v31 - v22;
        double v70 = v33 - v24;
        double v43 = v24;
        double v67 = v24;
        double v68 = v26;
        double v69 = v35 - v26;
        double v44 = v26;
        [v11 frame];
        CGRect v89 = CGRectOffset(v88, a5.x, a5.y);
        double y = v89.origin.y;
        double x = v89.origin.x;
        double height = v89.size.height;
        double v64 = v89.size.width;
        [v11 frame];
        CGRect v91 = CGRectOffset(v90, a4.x, a4.y);
        double v61 = v91.origin.y;
        double v62 = v91.origin.x;
        double v45 = v91.size.width;
        double v46 = v91.size.height;
        CGFloat v47 = v91.size.width - (v76 + v44) - (-v80 - v79);
        CGFloat v48 = v91.size.height - (v75 + v43) - (-v78 - v77);
        objc_msgSend(v11, "setAbsoluteFrame:", x, y, v64, height);
        objc_msgSend(v11, "setComponentViewFrame:", v62, v61, v45, v46);
        objc_msgSend(v11, "setContentViewFrame:", v79 + 0.0, v77 + 0.0, v47 - (v79 + v80), v48 - (v77 + v78));
        objc_msgSend(v11, "setContentFrame:", v42 + 0.0, v41 + 0.0, v47 - (v79 + v80) - (v42 + v69), v48 - (v77 + v78) - (v41 + v70));
        objc_msgSend(v11, "setLayoutMargins:", v75, v76, v67, v68);
        objc_msgSend(v11, "setContentInsets:", v72, v71, v74, v73);
        objc_msgSend(v11, "setBackgroundViewFrame:", v76 + 0.0 - v79, v75 + 0.0 - v77, v47, v48);
        objc_msgSend(v11, "setBorderInsets:", v77, v79, v78, v80);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 frame];
          double v50 = v71 + a5.x + v49;
          [v11 frame];
          double v52 = v72 + a5.y + v51;
          v53 = [v11 layoutBlueprint];
          -[SXLayoutFinalizationProcessor finalizeLayoutBlueprint:origin:absoluteOrigin:](self, "finalizeLayoutBlueprint:origin:absoluteOrigin:", v53, v42, v41, v50, v52);
        }
        v54 = (void *)MEMORY[0x263EFF9A0];
        v55 = [v11 componentSizer];
        v56 = [v55 infoForRendering];
        v57 = [v54 dictionaryWithDictionary:v56];

        [v57 setObject:v17 forKey:@"unitConverter"];
        [v11 storeInformationForRenderingPhase:v57];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
    }
    while (v8);
  }
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
}

@end