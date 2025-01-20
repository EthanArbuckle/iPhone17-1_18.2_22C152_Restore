@interface PAEnrollmentNode
+ (id)nodeWithSection:(unint64_t)a3 andType:(unint64_t)a4 comparing:(unint64_t)a5 with:(unint64_t)a6;
+ (id)nodeWithSection:(unint64_t)a3 type:(unint64_t)a4 andConfiguration:(id)a5;
- (BOOL)hideVisualizer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (NSArray)options;
- (NSArray)stimuli;
- (NSString)heading;
- (NSString)instructions;
- (NSString)name;
- (NSString)tuningDescription;
- (PAConfiguration)configuration;
- (id)description;
- (id)key;
- (id)progressDescription;
- (unint64_t)index;
- (unint64_t)section;
- (unint64_t)totalSteps;
- (unint64_t)type;
- (void)setConfiguration:(id)a3;
- (void)setHeading:(id)a3;
- (void)setHideVisualizer:(BOOL)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setInstructions:(id)a3;
- (void)setName:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSection:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStimuli:(id)a3;
- (void)setTotalSteps:(unint64_t)a3;
- (void)setTuningDescription:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PAEnrollmentNode

+ (id)nodeWithSection:(unint64_t)a3 type:(unint64_t)a4 andConfiguration:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(PAEnrollmentNode);
  [(PAEnrollmentNode *)v8 setStimuli:MEMORY[0x263EFFA68]];
  [(PAEnrollmentNode *)v8 setHeading:&stru_26C1E7618];
  [(PAEnrollmentNode *)v8 setInstructions:&stru_26C1E7618];
  [(PAEnrollmentNode *)v8 setSection:a3];
  [(PAEnrollmentNode *)v8 setType:a4];
  [(PAEnrollmentNode *)v8 setTotalSteps:6];
  [(PAEnrollmentNode *)v8 setConfiguration:v7];

  [(PAEnrollmentNode *)v8 setTuningDescription:&stru_26C1E7618];
  return v8;
}

+ (id)nodeWithSection:(unint64_t)a3 andType:(unint64_t)a4 comparing:(unint64_t)a5 with:(unint64_t)a6
{
  v10 = +[PAConfiguration configurationFromType:a5];
  v11 = +[PAEnrollmentNode nodeWithSection:a3 type:a4 andConfiguration:v10];

  if (a5 != a6)
  {
    v12 = [MEMORY[0x263EFF980] array];
    v13 = +[PAConfiguration configurationFromType:a5];
    v14 = +[PAEnrollmentNode nodeWithSection:a3 type:a5 andConfiguration:v13];
    [v12 hcSafeAddObject:v14];

    v15 = +[PAConfiguration configurationFromType:a6];
    v16 = +[PAEnrollmentNode nodeWithSection:a3 type:a6 andConfiguration:v15];
    [v12 hcSafeAddObject:v16];

    [v11 setOptions:v12];
  }
  v17 = paLocString(@"PersonalAudioOptionA");
  v18 = paLocString(@"PersonalAudioOptionB");
  if (a3 == 2)
  {
    v19 = @"PersonalAudioOptionNo";
    v20 = @"PersonalAudioOptionYes";
  }
  else
  {
    if (a3 != 6) {
      goto LABEL_8;
    }
    v19 = @"PersonalAudioStandard";
    v20 = @"PersonalAudioCustom";
  }
  uint64_t v21 = paLocString(v20);

  uint64_t v22 = paLocString(v19);

  v18 = (void *)v22;
  v17 = (void *)v21;
LABEL_8:
  v23 = [v11 options];
  v24 = [v23 firstObject];

  v25 = [v11 options];
  v26 = [v25 lastObject];

  if ([v11 section] != 2) {
    [v24 setSelected:1];
  }
  [v24 setName:v17];
  [v26 setName:v18];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(PAEnrollmentNode *)self section];
    if (v6 != [v5 section]) {
      goto LABEL_18;
    }
    unint64_t v7 = [(PAEnrollmentNode *)self type];
    if (v7 != [v5 type]) {
      goto LABEL_18;
    }
    unint64_t v8 = [(PAEnrollmentNode *)self index];
    if (v8 != [v5 index]) {
      goto LABEL_18;
    }
    unint64_t v9 = [(PAEnrollmentNode *)self totalSteps];
    if (v9 != [v5 totalSteps]) {
      goto LABEL_18;
    }
    v10 = [(PAEnrollmentNode *)self heading];
    v11 = [v5 heading];
    v12 = v11;
    if ((v10 == 0) == (v11 != 0))
    {
      v14 = [(PAEnrollmentNode *)self heading];
      v15 = [v5 heading];
      int v16 = [v14 isEqualToString:v15];

      if (!v16) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v17 = [(PAEnrollmentNode *)self instructions];
    v18 = [v5 instructions];
    v19 = v18;
    if ((v17 == 0) == (v18 != 0))
    {
      v20 = [(PAEnrollmentNode *)self instructions];
      uint64_t v21 = [v5 instructions];
      int v22 = [v20 isEqualToString:v21];

      if (!v22) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v23 = [(PAEnrollmentNode *)self configuration];
    v24 = [v5 configuration];
    v25 = v24;
    if ((v23 == 0) == (v24 != 0))
    {
      v26 = [(PAEnrollmentNode *)self configuration];
      v27 = [v5 configuration];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v29 = [(PAEnrollmentNode *)self options];
    uint64_t v30 = [v29 count];
    v31 = [v5 options];
    uint64_t v32 = [v31 count];

    if (v30 == v32)
    {
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 1;
      v33 = [(PAEnrollmentNode *)self options];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __28__PAEnrollmentNode_isEqual___block_invoke;
      v35[3] = &unk_2641032B0;
      id v36 = v5;
      v37 = &v38;
      [v33 enumerateObjectsUsingBlock:v35];

      BOOL v13 = *((unsigned char *)v39 + 24) != 0;
      _Block_object_dispose(&v38, 8);
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:
    BOOL v13 = 0;
    goto LABEL_19;
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

void __28__PAEnrollmentNode_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  unint64_t v9 = [v7 options];
  v10 = [v9 objectAtIndex:a3];
  char v11 = [v8 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (NSArray)stimuli
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t section = self->_section;
  if (section == 6 || section == 4)
  {
    id v4 = +[PAStimulus musicStimulus];
    id v8 = v4;
    id v5 = &v8;
  }
  else
  {
    if (section != 2)
    {
      unint64_t v6 = 0;
      goto LABEL_13;
    }
    if (self->_index == 2)
    {
      id v4 = +[PAStimulus louderSinStimulus];
      v10 = v4;
      id v5 = &v10;
    }
    else
    {
      id v4 = +[PAStimulus sinStimulus];
      unint64_t v9 = v4;
      id v5 = &v9;
    }
  }
  unint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v5, 1, v8, v9, v10, v11);

LABEL_13:
  return (NSArray *)v6;
}

- (NSString)instructions
{
  v2 = &stru_26C1E7618;
  unint64_t v3 = self->_section - 1;
  id v5 = @"PersonalAudioSpeechIntoInstructions";
  switch(v3)
  {
    case 0uLL:
      goto LABEL_11;
    case 2uLL:
      unint64_t v6 = self->_type - 3;
      if (v6 < 7)
      {
        unint64_t v7 = off_2641032D0;
        goto LABEL_6;
      }
      id v5 = @"PersonalAudioMediaIntro";
      goto LABEL_11;
    case 3uLL:
      unint64_t v6 = self->_index - 3;
      if (v6 >= 3)
      {
        v2 = &stru_26C1E7618;
      }
      else
      {
        unint64_t v7 = off_264103308;
LABEL_6:
        id v5 = v7[v6];
LABEL_11:
        paLocString(v5);
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
LABEL_12:
      return (NSString *)v2;
    case 4uLL:
      id v5 = @"PersonalAudioSetupTransparencyInstructions";
      goto LABEL_11;
    case 6uLL:
      id v5 = @"PersonalAudioCompleteInstructionsOff";
      goto LABEL_11;
    case 7uLL:
      id v5 = @"PersonalAudioCompleteInstructionsOffConfirmation";
      goto LABEL_11;
    default:
      goto LABEL_12;
  }
}

- (NSString)heading
{
  if ([(PAEnrollmentNode *)self section] == 1)
  {
    unint64_t v3 = @"PersonalAudioSpeechIntoTitle";
LABEL_13:
    id v5 = paLocString(v3);
    goto LABEL_14;
  }
  if ([(PAEnrollmentNode *)self section] == 3)
  {
    unint64_t v3 = @"PersonalAudioMusicHeading";
    goto LABEL_13;
  }
  if ([(PAEnrollmentNode *)self section] == 5)
  {
    unint64_t v3 = @"PersonalAudioSetupTransparencyTitle";
    goto LABEL_13;
  }
  if ([(PAEnrollmentNode *)self section] == 8)
  {
    unint64_t v3 = @"PersonalAudioCompleteTitleOffConfirmation";
    goto LABEL_13;
  }
  unint64_t v4 = [(PAEnrollmentNode *)self index];
  id v5 = 0;
  switch(v4)
  {
    case 1uLL:
      unint64_t v3 = @"PersonalAudioSpeechTitle";
      goto LABEL_13;
    case 2uLL:
      unint64_t v3 = @"PersonalAudioSpeechTitle2";
      goto LABEL_13;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      unint64_t v3 = @"PersonalAudioMediaTitle";
      goto LABEL_13;
    case 7uLL:
      id v5 = paLocString(@"PersonalAudioSetupComplete");
      unint64_t v7 = +[PASettings sharedInstance];
      id v8 = [v7 personalMediaConfiguration];

      if (!v8)
      {
        uint64_t v9 = paLocString(@"PersonalAudioSetupCompleteOff");

        id v5 = (void *)v9;
      }
      break;
    default:
      break;
  }
LABEL_14:
  return (NSString *)v5;
}

- (NSString)tuningDescription
{
  unint64_t v3 = [(PAEnrollmentNode *)self configuration];
  uint64_t v4 = [v3 level];

  id v5 = [(PAEnrollmentNode *)self configuration];
  uint64_t v6 = [v5 shape];

  switch(v6)
  {
    case 3:
      uint64_t v7 = v4 - 1;
      if ((unint64_t)(v4 - 1) < 3)
      {
        id v8 = off_264103350;
        goto LABEL_10;
      }
LABEL_11:
      v10 = 0;
      goto LABEL_16;
    case 2:
      uint64_t v7 = v4 - 1;
      if ((unint64_t)(v4 - 1) < 3)
      {
        id v8 = off_264103338;
        goto LABEL_10;
      }
      goto LABEL_11;
    case 1:
      uint64_t v7 = v4 - 1;
      if ((unint64_t)(v4 - 1) < 3)
      {
        id v8 = off_264103320;
LABEL_10:
        uint64_t v9 = v8[v7];
LABEL_15:
        v10 = paLocString(v9);
        goto LABEL_16;
      }
      goto LABEL_11;
  }
  v10 = 0;
  if (v6 == 12 && v4 == 12)
  {
    uint64_t v9 = @"PersonalAudioResultAudiogram";
    goto LABEL_15;
  }
LABEL_16:
  return (NSString *)v10;
}

- (id)key
{
  unint64_t v3 = [(PAEnrollmentNode *)self options];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(PAEnrollmentNode *)self section];
  uint64_t v6 = v5;
  if (v4 == 2)
  {
    uint64_t v7 = [(PAEnrollmentNode *)self options];
    id v8 = [v7 firstObject];
    uint64_t v9 = [v8 type];
    v10 = [(PAEnrollmentNode *)self options];
    uint64_t v11 = [v10 lastObject];
    v12 = paKeyFromNodeParameters(v6, v9, [v11 type]);
  }
  else
  {
    v12 = paKeyFromNodeParameters(v5, 0, 0);
  }
  return v12;
}

- (id)progressDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = paLocString(@"PersonalAudioStepTemplate");
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAEnrollmentNode index](self, "index"));
  uint64_t v6 = [v5 localizedFormat];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAEnrollmentNode totalSteps](self, "totalSteps"));
  id v8 = [v7 localizedFormat];
  uint64_t v9 = objc_msgSend(v3, "stringWithFormat:", v4, v6, v8);

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PAEnrollmentNode;
  uint64_t v4 = [(PAEnrollmentNode *)&v12 description];
  unint64_t v5 = [(PAEnrollmentNode *)self section];
  unint64_t v6 = [(PAEnrollmentNode *)self type];
  uint64_t v7 = [(PAEnrollmentNode *)self configuration];
  uint64_t v8 = [v7 level];
  uint64_t v9 = [(PAEnrollmentNode *)self configuration];
  v10 = [v3 stringWithFormat:@"%@ - %lu, %lu [%lu, %lu]", v4, v5, v6, v8, objc_msgSend(v9, "shape")];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)totalSteps
{
  return self->_totalSteps;
}

- (void)setTotalSteps:(unint64_t)a3
{
  self->_totalSteps = a3;
}

- (unint64_t)section
{
  return self->_section;
}

- (void)setSection:(unint64_t)a3
{
  self->_unint64_t section = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)hideVisualizer
{
  return self->_hideVisualizer;
}

- (void)setHideVisualizer:(BOOL)a3
{
  self->_hideVisualizer = a3;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void)setStimuli:(id)a3
{
}

- (void)setHeading:(id)a3
{
}

- (void)setInstructions:(id)a3
{
}

- (PAConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setTuningDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningDescription, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_stimuli, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end