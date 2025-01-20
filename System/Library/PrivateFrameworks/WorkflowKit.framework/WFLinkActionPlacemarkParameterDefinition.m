@interface WFLinkActionPlacemarkParameterDefinition
- (Class)parameterClass;
- (WFLinkActionPlacemarkParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)addressForPlacemark:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)nameForPlacemark:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionPlacemarkParameterDefinition

- (id)addressForPlacemark:(id)a3
{
  id v3 = a3;
  v4 = [v3 formattedAddressLines];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [v3 formattedAddressLines];
    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v8 = (void *)getCNPostalAddressFormatterClass_softClass;
    uint64_t v16 = getCNPostalAddressFormatterClass_softClass;
    if (!getCNPostalAddressFormatterClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getCNPostalAddressFormatterClass_block_invoke;
      v12[3] = &unk_1E6558B78;
      v12[4] = &v13;
      __getCNPostalAddressFormatterClass_block_invoke((uint64_t)v12);
      v8 = (void *)v14[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v13, 8);
    v6 = [v3 postalAddress];
    uint64_t v7 = [v9 singleLineStringFromPostalAddress:v6 addCountryName:0];
  }
  v10 = (void *)v7;

  return v10;
}

- (id)nameForPlacemark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];

  if (v5) {
    [v4 name];
  }
  else {
  v6 = [(WFLinkActionPlacemarkParameterDefinition *)self addressForPlacemark:v4];
  }

  return v6;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F729B8];
  id v5 = a3;
  int64_t v6 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:v4 defaultValue:0];
  uint64_t v7 = [v5 value];

  if (v6 == 2)
  {
    uint64_t v8 = [v7 locality];
  }
  else
  {
    if (v6 == 1) {
      [(WFLinkActionPlacemarkParameterDefinition *)self addressForPlacemark:v7];
    }
    else {
    uint64_t v8 = [(WFLinkActionPlacemarkParameterDefinition *)self nameForPlacemark:v7];
    }
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 value];
  if (v4)
  {
    id v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      id v7 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;

      v10 = [[WFLocationValue alloc] initWithPlacemark:v9];
      v11 = [WFLocationParameterState alloc];

      v12 = [(WFLocationParameterState *)v11 initWithValue:v10];
      goto LABEL_11;
    }
    uint64_t v13 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [(WFLinkActionParameterDefinition *)self valueType];
      int v16 = 136315650;
      v17 = "-[WFLinkActionPlacemarkParameterDefinition parameterStateFromLinkValue:]";
      __int16 v18 = 2114;
      v19 = v4;
      __int16 v20 = 2114;
      v21 = v14;
        (uint8_t *)&v16,
        0x20u);
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = (void (**)(void, void, void))v14;
  if (v11)
  {
    id v16 = v11;
    objc_opt_class();
    int v17 = objc_opt_isKindOfClass() & 1;
    if (v17) {
      __int16 v18 = v16;
    }
    else {
      __int16 v18 = 0;
    }
    id v19 = v18;

    if (v17)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __156__WFLinkActionPlacemarkParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
      v24[3] = &unk_1E6554430;
      v24[4] = self;
      v25 = v15;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2050000000;
      __int16 v20 = (void *)getCLPlacemarkClass_softClass;
      uint64_t v29 = getCLPlacemarkClass_softClass;
      if (!getCLPlacemarkClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCLPlacemarkClass_block_invoke;
        v31 = &unk_1E6558B78;
        v32 = &v26;
        __getCLPlacemarkClass_block_invoke((uint64_t)buf);
        __int16 v20 = (void *)v27[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v26, 8);
      [v16 getObjectRepresentation:v24 forClass:v21];
    }
    else
    {
      uint64_t v22 = getWFActionsLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFLinkActionPlacemarkParameterDefinition getLinkValueFromProcessedParameterValue:paramete"
                             "rState:permissionRequestor:runningFromToolKit:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = objc_opt_class();
        id v23 = *(id *)&buf[14];
        _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Action expected WFContentCollection as processed parameter type for placemark, but got %@ instead", buf, 0x16u);
      }
      v15[2](v15, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }
}

void __156__WFLinkActionPlacemarkParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1E630]) initWithPlacemark:v8];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_alloc(MEMORY[0x1E4F72E10]);
    char v6 = [*(id *)(a1 + 32) valueType];
    id v7 = (void *)[v5 initWithValue:v3 valueType:v6];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v7, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 value];
  id v11 = [v10 placemark];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1E630]);
    id v13 = [v9 value];
    id v14 = [v13 placemark];
    uint64_t v15 = (void *)[v12 initWithPlacemark:v14];

    id v16 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)parameterDefinitionDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (-[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E4F729B8], 0) == 2)[v3 setValue:@"ThreeKilometers" forKey:@"CurrentLocationAccuracy"]; {
  v7.receiver = self;
  }
  v7.super_class = (Class)WFLinkActionPlacemarkParameterDefinition;
  uint64_t v4 = [(WFLinkActionParameterDefinition *)&v7 parameterDefinitionDictionary];
  id v5 = [v4 definitionByAddingEntriesInDictionary:v3];

  return v5;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionPlacemarkParameterDefinition)initWithParameterMetadata:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  id v6 = [v4 placemarkValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPlacemarkParameterDefinition;
  objc_super v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end