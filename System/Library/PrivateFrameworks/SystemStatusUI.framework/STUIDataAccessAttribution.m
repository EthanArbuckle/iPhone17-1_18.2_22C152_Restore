@interface STUIDataAccessAttribution
- (BOOL)isEqual:(id)a3;
- (BOOL)isRecent;
- (NSDate)accessEndDate;
- (NSDate)accessStartDate;
- (NSString)description;
- (STActivityAttribution)audioRecordingActivityAttribution;
- (STAttributedEntity)attributedEntity;
- (STLocationStatusDomainLocationAttribution)locationAttribution;
- (STMediaStatusDomainCameraCaptureAttribution)cameraCaptureAttribution;
- (STMediaStatusDomainMicrophoneRecordingAttribution)microphoneRecordingAttribution;
- (STUIDataAccessAttribution)initWithAudioRecordingActivityAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6;
- (STUIDataAccessAttribution)initWithCameraCaptureAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6;
- (STUIDataAccessAttribution)initWithLocationAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6;
- (STUIDataAccessAttribution)initWithMicrophoneRecordingAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithDataAccessType:(void *)a3 microphoneRecordingAttribution:(void *)a4 cameraCaptureAttribution:(void *)a5 locationAttribution:(char)a6 recent:(void *)a7 startDate:(void *)a8 endDate:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)dataAccessType;
- (unint64_t)hash;
@end

@implementation STUIDataAccessAttribution

- (STActivityAttribution)audioRecordingActivityAttribution
{
  v2 = [(STUIDataAccessAttribution *)self microphoneRecordingAttribution];
  v3 = [v2 activityAttribution];

  return (STActivityAttribution *)v3;
}

- (STAttributedEntity)attributedEntity
{
  unint64_t v4 = [(STUIDataAccessAttribution *)self dataAccessType];
  if (v4 == 2)
  {
    v5 = [(STUIDataAccessAttribution *)self locationAttribution];
  }
  else if (v4 == 1)
  {
    v5 = [(STUIDataAccessAttribution *)self cameraCaptureAttribution];
  }
  else
  {
    if (v4) {
      goto LABEL_8;
    }
    v5 = [(STUIDataAccessAttribution *)self microphoneRecordingAttribution];
  }
  v6 = v5;
  v7 = [v5 activityAttribution];
  v2 = [v7 attributedEntity];

LABEL_8:
  return (STAttributedEntity *)v2;
}

- (BOOL)isRecent
{
  return self->_recent;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(STUIDataAccessAttribution *)self dataAccessType];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke;
  v38[3] = &unk_1E6AA3CD0;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v38];
  v9 = [(STUIDataAccessAttribution *)self microphoneRecordingAttribution];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_2;
  v36[3] = &unk_1E6AA3CF8;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendObject:v9 counterpart:v36];

  v12 = [(STUIDataAccessAttribution *)self cameraCaptureAttribution];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_3;
  v34[3] = &unk_1E6AA3CF8;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendObject:v12 counterpart:v34];

  v15 = [(STUIDataAccessAttribution *)self locationAttribution];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_4;
  v32[3] = &unk_1E6AA3CF8;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendObject:v15 counterpart:v32];

  v18 = [(STUIDataAccessAttribution *)self accessStartDate];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37__STUIDataAccessAttribution_isEqual___block_invoke_5;
  v30[3] = &unk_1E6AA3CF8;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendObject:v18 counterpart:v30];

  v21 = [(STUIDataAccessAttribution *)self accessEndDate];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __37__STUIDataAccessAttribution_isEqual___block_invoke_6;
  v28 = &unk_1E6AA3CF8;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendObject:v21 counterpart:&v25];

  LOBYTE(v21) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);
  return (char)v21;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STUIDataAccessAttribution dataAccessType](self, "dataAccessType"));
  v5 = [(STUIDataAccessAttribution *)self microphoneRecordingAttribution];
  id v6 = (id)[v3 appendObject:v5];

  id v7 = [(STUIDataAccessAttribution *)self cameraCaptureAttribution];
  id v8 = (id)[v3 appendObject:v7];

  v9 = [(STUIDataAccessAttribution *)self locationAttribution];
  id v10 = (id)[v3 appendObject:v9];

  id v11 = [(STUIDataAccessAttribution *)self accessStartDate];
  id v12 = (id)[v3 appendObject:v11];

  id v13 = [(STUIDataAccessAttribution *)self accessEndDate];
  id v14 = (id)[v3 appendObject:v13];

  unint64_t v15 = [v3 hash];
  return v15;
}

- (unint64_t)dataAccessType
{
  return self->_dataAccessType;
}

- (NSDate)accessStartDate
{
  return self->_accessStartDate;
}

- (STMediaStatusDomainCameraCaptureAttribution)cameraCaptureAttribution
{
  return self->_cameraCaptureAttribution;
}

- (STLocationStatusDomainLocationAttribution)locationAttribution
{
  return self->_locationAttribution;
}

- (NSDate)accessEndDate
{
  return self->_accessEndDate;
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)microphoneRecordingAttribution
{
  return self->_microphoneRecordingAttribution;
}

- (id)initWithDataAccessType:(void *)a3 microphoneRecordingAttribution:(void *)a4 cameraCaptureAttribution:(void *)a5 locationAttribution:(char)a6 recent:(void *)a7 startDate:(void *)a8 endDate:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  if (a1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)STUIDataAccessAttribution;
    id v20 = objc_msgSendSuper2(&v32, sel_init);
    a1 = v20;
    if (v20)
    {
      v20[2] = a2;
      uint64_t v21 = [v15 copy];
      id v22 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v21;

      uint64_t v23 = [v16 copy];
      v24 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v23;

      uint64_t v25 = [v17 copy];
      uint64_t v26 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v25;

      *((unsigned char *)a1 + 8) = a6;
      uint64_t v27 = [v18 copy];
      v28 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v27;

      uint64_t v29 = [v19 copy];
      v30 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v29;
    }
  }

  return a1;
}

- (STUIDataAccessAttribution)initWithLocationAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  return (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 2, 0, 0, a3, a4, a5, a6);
}

- (STUIDataAccessAttribution)initWithCameraCaptureAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  return (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 1, 0, a3, 0, a4, a5, a6);
}

- (STUIDataAccessAttribution)initWithMicrophoneRecordingAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  return (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 0, a3, 0, 0, a4, a5, a6);
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataAccessType];
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraCaptureAttribution];
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) microphoneRecordingAttribution];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessEndDate, 0);
  objc_storeStrong((id *)&self->_accessStartDate, 0);
  objc_storeStrong((id *)&self->_locationAttribution, 0);
  objc_storeStrong((id *)&self->_cameraCaptureAttribution, 0);
  objc_storeStrong((id *)&self->_microphoneRecordingAttribution, 0);
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessStartDate];
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) locationAttribution];
}

- (STUIDataAccessAttribution)initWithAudioRecordingActivityAttribution:(id)a3 recent:(BOOL)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4FA93E0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = (void *)[[v10 alloc] initWithActivityAttribution:v13];

  id v15 = (STUIDataAccessAttribution *)-[STUIDataAccessAttribution initWithDataAccessType:microphoneRecordingAttribution:cameraCaptureAttribution:locationAttribution:recent:startDate:endDate:](self, 0, v14, 0, 0, a4, v12, v11);
  return v15;
}

uint64_t __37__STUIDataAccessAttribution_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessEndDate];
}

- (NSString)description
{
  return (NSString *)[(STUIDataAccessAttribution *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIDataAccessAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIDataAccessAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(STUIDataAccessAttribution *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__STUIDataAccessAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AA39F0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __67__STUIDataAccessAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) dataAccessType];
  if (v2 > 2) {
    v3 = @"invalid";
  }
  else {
    v3 = off_1E6AA3D18[v2];
  }
  [*(id *)(a1 + 40) appendString:v3 withName:@"type"];
  if ([*(id *)(a1 + 32) isRecent]) {
    id v4 = @"recent";
  }
  else {
    id v4 = @"active";
  }
  [*(id *)(a1 + 40) appendString:v4 withName:@"state"];
  v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) accessStartDate];
  id v7 = (id)[v5 appendObject:v6 withName:@"startDate"];

  id v8 = *(void **)(a1 + 40);
  v9 = [*(id *)(a1 + 32) accessEndDate];
  id v10 = (id)[v8 appendObject:v9 withName:@"endDate" skipIfNil:1];

  if (v2 == 2)
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) locationAttribution];
  }
  else if (v2 == 1)
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) cameraCaptureAttribution];
  }
  else
  {
    if (v2) {
      return;
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) microphoneRecordingAttribution];
  }
  id v14 = (id)v12;
  id v13 = (id)objc_msgSend(v11, "appendObject:withName:");
}

@end