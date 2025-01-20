@interface SRUIFMutableConversationItem
- (AceObject)aceObject;
- (BOOL)isImmersiveExperience;
- (BOOL)isSupplemental;
- (BOOL)isTransient;
- (BOOL)isVirgin;
- (NSString)aceCommandIdentifier;
- (NSString)description;
- (NSUUID)identifier;
- (NSUUID)revisionIdentifier;
- (SRUIFDataStore)associatedDataStore;
- (SRUIFDialogPhase)dialogPhase;
- (SRUIFMutableConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 associatedDataStore:(id)a14;
- (SRUIFMutableConversationItem)initWithIdentifier:(id)a3 type:(int64_t)a4 aceObject:(id)a5 dialogPhase:(id)a6 presentationState:(int64_t)a7 aceCommandIdentifier:(id)a8 virgin:(BOOL)a9 transient:(BOOL)a10 supplemental:(BOOL)a11 immersiveExperience:(BOOL)a12 associatedDataStore:(id)a13;
- (SRUIFMutableConversationItem)initWithPropertyListRepresentation:(id)a3;
- (SRUIFMutableConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 associatedDataStore:(id)a12;
- (id)_propertyListStringForPresentationState;
- (id)_propertyListStringForType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyListRepresentation;
- (int64_t)_presentationStateForPropertyListString:(id)a3;
- (int64_t)_typeForPropertyListString:(id)a3;
- (int64_t)presentationState;
- (int64_t)type;
- (void)_didMutate;
- (void)setAceCommandIdentifier:(id)a3;
- (void)setAceObject:(id)a3;
- (void)setDialogPhase:(id)a3;
- (void)setImmersiveExperience:(BOOL)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setSupplemental:(BOOL)a3;
- (void)setTransient:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setVirgin:(BOOL)a3;
@end

@implementation SRUIFMutableConversationItem

- (SRUIFMutableConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 associatedDataStore:(id)a14
{
  id v33 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a14;
  v34.receiver = self;
  v34.super_class = (Class)SRUIFMutableConversationItem;
  v24 = [(SRUIFMutableConversationItem *)&v34 init];
  if (v24)
  {
    uint64_t v25 = [v33 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSUUID *)v25;

    uint64_t v27 = [v19 copy];
    revisionIdentifier = v24->_revisionIdentifier;
    v24->_revisionIdentifier = (NSUUID *)v27;

    v24->_type = a5;
    objc_storeStrong((id *)&v24->_aceObject, a6);
    objc_storeStrong((id *)&v24->_dialogPhase, a7);
    v24->_presentationState = a8;
    uint64_t v29 = [v22 copy];
    aceCommandIdentifier = v24->_aceCommandIdentifier;
    v24->_aceCommandIdentifier = (NSString *)v29;

    v24->_virgin = a10;
    v24->_transient = a11;
    v24->_supplemental = a12;
    v24->_immersiveExperience = a13;
    objc_storeStrong((id *)&v24->_associatedDataStore, a14);
  }

  return v24;
}

- (SRUIFMutableConversationItem)initWithIdentifier:(id)a3 type:(int64_t)a4 aceObject:(id)a5 dialogPhase:(id)a6 presentationState:(int64_t)a7 aceCommandIdentifier:(id)a8 virgin:(BOOL)a9 transient:(BOOL)a10 supplemental:(BOOL)a11 immersiveExperience:(BOOL)a12 associatedDataStore:(id)a13
{
  v17 = (objc_class *)MEMORY[0x263F08C38];
  id v18 = a13;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = objc_alloc_init(v17);
  BYTE3(v26) = a12;
  BYTE2(v26) = a11;
  LOWORD(v26) = __PAIR16__(a10, a9);
  v24 = -[SRUIFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v22, v23, a4, v21, v20, a7, v19, v26, v18);

  return v24;
}

- (SRUIFMutableConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 associatedDataStore:(id)a12
{
  v17 = (objc_class *)MEMORY[0x263F08C38];
  id v18 = a12;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_alloc_init(v17);
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  id v23 = -[SRUIFMutableConversationItem initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](self, "initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v22, a3, v21, v20, a6, v19, v25, v18);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v19 = [SRUIFConversationItem alloc];
  id v18 = [(SRUIFMutableConversationItem *)self identifier];
  v4 = [(SRUIFMutableConversationItem *)self revisionIdentifier];
  int64_t v17 = [(SRUIFMutableConversationItem *)self type];
  v5 = [(SRUIFMutableConversationItem *)self aceObject];
  v6 = [(SRUIFMutableConversationItem *)self dialogPhase];
  int64_t v7 = [(SRUIFMutableConversationItem *)self presentationState];
  v8 = [(SRUIFMutableConversationItem *)self aceCommandIdentifier];
  BOOL v9 = [(SRUIFMutableConversationItem *)self isVirgin];
  BOOL v10 = [(SRUIFMutableConversationItem *)self isTransient];
  BOOL v11 = [(SRUIFMutableConversationItem *)self isSupplemental];
  BOOL v12 = [(SRUIFMutableConversationItem *)self isImmersiveExperience];
  v13 = [(SRUIFMutableConversationItem *)self associatedDataStore];
  BYTE3(v16) = v12;
  BYTE2(v16) = v11;
  BYTE1(v16) = v10;
  LOBYTE(v16) = v9;
  v14 = -[SRUIFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](v19, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v18, v4, v17, v5, v6, v7, v8, v16, v13);

  return v14;
}

- (NSString)description
{
  unint64_t v3 = [(SRUIFMutableConversationItem *)self type];
  if (v3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264786528[v3];
  }
  unint64_t v5 = [(SRUIFMutableConversationItem *)self presentationState];
  if (v5 > 3) {
    v6 = 0;
  }
  else {
    v6 = off_264786558[v5];
  }
  int64_t v7 = [(SRUIFMutableConversationItem *)self aceObject];
  uint64_t v8 = objc_msgSend(v7, "af_dialogIdentifier");

  v36 = (void *)v8;
  if (v8)
  {
    [NSString stringWithFormat:@", dialogIdentifier=%@", v8];
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &stru_26D9AE000;
  }
  BOOL v9 = [(SRUIFMutableConversationItem *)self aceObject];
  BOOL v10 = +[SRUIFUtilities shouldRedactSpeakableTextForAceObject:v9];

  if (v10)
  {
    BOOL v11 = @"<private>";
    BOOL v12 = @"<private>";
LABEL_13:
    [NSString stringWithFormat:@", dialogText=\"%@\"", v11];
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v13 = [(SRUIFMutableConversationItem *)self aceObject];
  objc_msgSend(v13, "af_text");
  BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v14 = [(SRUIFMutableConversationItem *)self aceObject];
  objc_msgSend(v14, "af_speakableText");
  BOOL v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v11) {
    goto LABEL_13;
  }
  v15 = &stru_26D9AE000;
LABEL_15:
  objc_super v34 = v6;
  v35 = v4;
  id v33 = v11;
  if (v12)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%@, speakableText=\"%@\"", v15, v12];

    uint64_t v27 = (void *)v16;
  }
  else
  {
    uint64_t v27 = v15;
  }
  v30 = NSString;
  v32 = [(SRUIFMutableConversationItem *)self identifier];
  uint64_t v29 = [v32 UUIDString];
  v31 = [(SRUIFMutableConversationItem *)self revisionIdentifier];
  int64_t v17 = [v31 UUIDString];
  id v18 = [(SRUIFMutableConversationItem *)self aceObject];
  uint64_t v19 = objc_opt_class();
  id v20 = [(SRUIFMutableConversationItem *)self dialogPhase];
  id v21 = [(SRUIFMutableConversationItem *)self aceCommandIdentifier];
  if ([(SRUIFMutableConversationItem *)self isTransient]) {
    id v22 = @"YES";
  }
  else {
    id v22 = @"NO";
  }
  if ([(SRUIFMutableConversationItem *)self isSupplemental]) {
    id v23 = @"YES";
  }
  else {
    id v23 = @"NO";
  }
  if ([(SRUIFMutableConversationItem *)self isImmersiveExperience]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  objc_msgSend(v30, "stringWithFormat:", @"<ConversationItem %p; %@ (revision %@): type=%@, aceObject=%@, dialogPhase=%@, presentationState=%@, aceCommandIdentifier=%@%@%@, transient=%@, supplemental=%@, immersiveExperience=%@>",
    self,
    v29,
    v17,
    v35,
    v19,
    v20,
    v34,
    v21,
    v28,
    v27,
    v22,
    v23,
  uint64_t v25 = v24);

  return (NSString *)v25;
}

- (void)_didMutate
{
  self->_revisionIdentifier = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
  MEMORY[0x270F9A758]();
}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->_aceObject, a3);
  [(SRUIFMutableConversationItem *)self _didMutate];
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
  [(SRUIFMutableConversationItem *)self _didMutate];
}

- (id)_propertyListStringForType
{
  int64_t v2 = [(SRUIFMutableConversationItem *)self type];
  if ((unint64_t)(v2 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_264786578[v2 - 1];
  }
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RecognizedSpeech"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"View"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"PartialSpeechResult"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Help"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"AcousticID Spinner"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_propertyListStringForPresentationState
{
  int64_t v2 = [(SRUIFMutableConversationItem *)self presentationState];
  if ((unint64_t)(v2 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_2647865A0[v2 - 1];
  }
}

- (int64_t)_presentationStateForPropertyListString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Committed"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Provisional"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cancelled"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)propertyListRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26D9B5FF8 forKey:@"Version"];
  int64_t v4 = [(SRUIFMutableConversationItem *)self identifier];
  unint64_t v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"Identifier"];

  v6 = [(SRUIFMutableConversationItem *)self revisionIdentifier];
  int64_t v7 = [v6 UUIDString];
  [v3 setObject:v7 forKey:@"RevisionIdentifier"];

  uint64_t v8 = [(SRUIFMutableConversationItem *)self _propertyListStringForType];
  [v3 setObject:v8 forKey:@"Type"];

  BOOL v9 = [(SRUIFMutableConversationItem *)self aceObject];
  BOOL v10 = [v9 dictionary];
  [v3 setObject:v10 forKey:@"AceObject"];

  BOOL v11 = [(SRUIFMutableConversationItem *)self dialogPhase];
  BOOL v12 = [v11 aceDialogPhaseValue];

  if (v12) {
    [v3 setObject:v12 forKey:@"AceDialogPhase"];
  }
  v13 = [(SRUIFMutableConversationItem *)self _propertyListStringForPresentationState];
  [v3 setObject:v13 forKey:@"PresentationState"];

  v14 = [(SRUIFMutableConversationItem *)self aceCommandIdentifier];
  if (v14) {
    [v3 setObject:v14 forKey:@"AceCommandIdentifier"];
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[SRUIFMutableConversationItem isTransient](self, "isTransient"));
  [v3 setObject:v15 forKey:@"Transient"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[SRUIFMutableConversationItem isSupplemental](self, "isSupplemental"));
  [v3 setObject:v16 forKey:@"Supplemental"];

  int64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[SRUIFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience"));
  [v3 setObject:v17 forKey:@"ImmersiveExperience"];

  id v18 = [(SRUIFMutableConversationItem *)self associatedDataStore];
  uint64_t v19 = [v18 propertyListRepresentation];

  [v3 setObject:v19 forKey:@"AssociatedDataStore"];
  return v3;
}

- (SRUIFMutableConversationItem)initWithPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(SRUIFDictionarySchema);
  v6 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v6 forKey:@"Version"];

  int64_t v7 = +[SRUIFCoercion stringToUUIDCoercion];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v7 forKey:@"Identifier"];

  uint64_t v8 = +[SRUIFCoercion stringToUUIDCoercion];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v8 forKey:@"RevisionIdentifier"];

  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke;
  v62[3] = &unk_264786508;
  BOOL v9 = self;
  v63 = v9;
  BOOL v10 = +[SRUIFCoercion coercionWithBlock:v62];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v10 forKey:@"Type"];

  BOOL v11 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v11 forKey:@"AceObject"];

  BOOL v12 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v12 forKey:@"AceDialogPhase"];

  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2;
  v60[3] = &unk_264786508;
  v13 = v9;
  v61 = v13;
  v14 = +[SRUIFCoercion coercionWithBlock:v60];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v14 forKey:@"PresentationState"];

  v15 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v15 forKey:@"AceCommandIdentifier"];

  uint64_t v16 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v16 forKey:@"Transient"];

  int64_t v17 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v17 forKey:@"Supplemental"];

  id v18 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v18 forKey:@"ImmersiveExperience"];

  id v59 = 0;
  uint64_t v19 = [(SRUIFDictionarySchema *)v5 coerceObject:v4 error:&v59];
  id v20 = v59;
  if (!v19)
  {
    uint64_t v29 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(SRUIFMutableConversationItem *)(uint64_t)v20 initWithPropertyListRepresentation:v29];
    }
    goto LABEL_11;
  }
  id v21 = [v19 objectForKey:@"Version"];
  uint64_t v22 = [v21 integerValue];

  if (v22 != 1)
  {
    v30 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFMutableConversationItem initWithPropertyListRepresentation:](v22, v30);
    }
LABEL_11:
    v31 = 0;
    goto LABEL_19;
  }
  uint64_t v58 = (uint64_t)v4;
  uint64_t v57 = [v19 objectForKey:@"Identifier"];
  id v23 = [v19 objectForKey:@"RevisionIdentifier"];
  if (!v23) {
    id v23 = objc_alloc_init(MEMORY[0x263F08C38]);
  }
  id v56 = v23;
  v24 = [v19 objectForKey:@"Type"];
  uint64_t v51 = [v24 integerValue];

  uint64_t v25 = (void *)MEMORY[0x263F64700];
  uint64_t v26 = [v19 objectForKey:@"AceObject"];
  uint64_t v27 = [v25 aceObjectWithDictionary:v26];

  uint64_t v28 = [v19 objectForKey:@"AceDialogPhase"];
  v55 = (void *)v27;
  v52 = (void *)v28;
  if (v28) {
    +[SRUIFDialogPhase dialogPhaseForAceDialogPhase:v28];
  }
  else {
  uint64_t v54 = +[SRUIFDialogPhase userRequestDialogPhase];
  }
  v32 = [v19 objectForKey:@"PresentationState"];
  uint64_t v50 = [v32 integerValue];

  id v33 = [v19 objectForKey:@"AceCommandIdentifier"];
  objc_super v34 = [v19 objectForKey:@"Transient"];
  char v35 = [v34 BOOLValue];

  v36 = [v19 objectForKey:@"Supplemental"];
  char v37 = [v36 BOOLValue];

  v38 = [v19 objectForKey:@"ImmersiveExperience"];
  char v39 = [v38 BOOLValue];

  v40 = [SRUIFDataStore alloc];
  v41 = [v19 objectForKey:@"AssociatedDataStore"];
  v42 = [(SRUIFDataStore *)v40 initWithPropertyListRepresentation:v41];

  id v53 = v20;
  if (v42)
  {
    BYTE3(v49) = v39;
    BYTE2(v49) = v37;
    BYTE1(v49) = v35;
    LOBYTE(v49) = 0;
    v44 = v56;
    v43 = (void *)v57;
    v45 = (void *)v54;
    v46 = v55;
    v13 = -[SRUIFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](v13, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v57, v56, v51, v55, v54, v50, v33, v49, v42);
    v31 = v13;
  }
  else
  {
    v47 = *MEMORY[0x263F28348];
    v44 = v56;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFMutableConversationItem initWithPropertyListRepresentation:](v58, v47);
    }
    v31 = 0;
    v43 = (void *)v57;
    v45 = (void *)v54;
    v46 = v55;
  }

  id v4 = (id)v58;
  id v20 = v53;
LABEL_19:

  return v31;
}

id __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  int64_t v7 = [v6 coerceObject:v5 error:a3];

  if (v7)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_typeForPropertyListString:", v7));
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  int64_t v7 = [v6 coerceObject:v5 error:a3];

  if (v7)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_presentationStateForPropertyListString:", v7));
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (SRUIFDialogPhase)dialogPhase
{
  return self->_dialogPhase;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (void)setAceCommandIdentifier:(id)a3
{
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (void)setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (void)setSupplemental:(BOOL)a3
{
  self->_supplemental = a3;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (void)setImmersiveExperience:(BOOL)a3
{
  self->_immersiveExperience = a3;
}

- (SRUIFDataStore)associatedDataStore
{
  return self->_associatedDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDataStore, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPropertyListRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[SRUIFMutableConversationItem initWithPropertyListRepresentation:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s returning nil; passed invalid property list (%{public}@): %@",
    (uint8_t *)&v3,
    0x20u);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[SRUIFMutableConversationItem initWithPropertyListRepresentation:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s returning nil; unable co create associated data store from property list %@",
    (uint8_t *)&v2,
    0x16u);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[SRUIFMutableConversationItem initWithPropertyListRepresentation:]";
  __int16 v4 = 2050;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s unable to deserialize property list with version %{public}ld; returning nil",
    (uint8_t *)&v2,
    0x16u);
}

@end