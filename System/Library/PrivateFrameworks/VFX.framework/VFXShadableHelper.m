@interface VFXShadableHelper
+ (BOOL)supportsSecureCoding;
- (BOOL)isOpaque;
- (NSDictionary)shaderModifiers;
- (NSDictionary)shaderModifiersArguments;
- (NSNumber)minimumLanguageVersion;
- (VFXProgram)program;
- (VFXShadableHelper)initWithCoder:(id)a3;
- (VFXShadableHelper)initWithOwner:(id)a3;
- (__CFXFXRenderGraph)_renderGraph;
- (id)owner;
- (void)__CFObject;
- (void)_commonInit;
- (void)_customEncodingOfVFXShadableHelper:(id)a3;
- (void)_parseAndSetShaderModifier:(id)a3;
- (void)_programDidChange:(id)a3;
- (void)_setCFXProgram;
- (void)_startObservingProgram;
- (void)_stopObservingProgram;
- (void)copyModifiersFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)ownerWillDie;
- (void)setMinimumLanguageVersion:(id)a3;
- (void)setProgram:(id)a3;
- (void)setShaderModifiers:(id)a3;
@end

@implementation VFXShadableHelper

- (void)_commonInit
{
  self->_symbolToBinder = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_symbolToUnbinder = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_arguments = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
}

- (VFXShadableHelper)initWithOwner:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXShadableHelper;
  v4 = [(VFXShadableHelper *)&v10 init];
  v8 = v4;
  if (v4)
  {
    objc_msgSend__commonInit(v4, v5, v6, v7);
    v8->_owner = a3;
  }
  return v8;
}

- (void)ownerWillDie
{
  objc_msgSend__stopObservingProgram(self, a2, v2, v3);
  self->_owner = 0;
}

- (NSDictionary)shaderModifiersArguments
{
  return &self->_arguments->super;
}

- (void)dealloc
{
  if (self->_owner) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Must call -[VFXShadableHelper ownerWillDie] before releasing it !", v2, v3, v4, v5, v6, v7, (uint64_t)"_owner == nil");
  }

  v9.receiver = self;
  v9.super_class = (Class)VFXShadableHelper;
  [(VFXShadableHelper *)&v9 dealloc];
}

- (id)owner
{
  return self->_owner;
}

- (void)_startObservingProgram
{
  if (self->_program)
  {
    uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
    program = self->_program;
    objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)self, (uint64_t)sel__programDidChange_, @"VFXProgramDidChangeNotification", program);
  }
}

- (void)_stopObservingProgram
{
  if (self->_program)
  {
    uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
    program = self->_program;
    objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, @"VFXProgramDidChangeNotification", program);
  }
}

- (void)setProgram:(id)a3
{
  if (a3 && objc_msgSend_count(self->_shaderModifiers, a2, (uint64_t)a3, v3))
  {
    sub_1B63F2F54(16, @"Error: Cannot use a program because shader modifiers are set", (uint64_t)a3, v3, v6, v7, v8, v9, v17);
  }
  else if (self->_program != a3)
  {
    objc_msgSend__stopObservingProgram(self, a2, (uint64_t)a3, v3);

    self->_program = (VFXProgram *)a3;
    uint64_t v13 = objc_msgSend_worldRef(self->_owner, v10, v11, v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B63F1E14;
    v15[3] = &unk_1E61411E0;
    v15[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (VFXProgram)program
{
  uint64_t v2 = self->_program;

  return v2;
}

- (BOOL)isOpaque
{
  return objc_msgSend_isOpaque(self->_program, a2, v2, v3);
}

- (void)_parseAndSetShaderModifier:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  objc_msgSend_removeAllObjects(self->_arguments, a2, (uint64_t)a3, v3);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v6, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v7)
  {
    uint64_t v15 = v7;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(a3);
        }
        v18 = (void *)sub_1B6603C70(*(void *)(*((void *)&v49 + 1) + 8 * i), (uint64_t)v8, v9, v10, v11, v12, v13, v14);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = sub_1B63F2120;
        v48[3] = &unk_1E6141318;
        v48[4] = self;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v18, v19, (uint64_t)v48, v20);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v15);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v28 = objc_msgSend___CFObject(self->_owner, v21, v22, v23);
    uint64_t v32 = objc_msgSend_worldRef(self->_owner, v29, v30, v31);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1B63F21A4;
    v47[3] = &unk_1E61412A8;
    v47[4] = a3;
    v47[5] = v28;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v33, v32, (uint64_t)self, v47);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: ShaderModifiers - unkwnown supporting class '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)self->_owner);
  }
  uint64_t v37 = objc_msgSend_worldRef(self->_owner, v34, v35, v36);
  if (v37)
  {
    uint64_t v44 = v37;
    if (sub_1B64B2718(v37, 1, v38, v39, v40, v41, v42, v43))
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = sub_1B63F21B0;
      v46[3] = &unk_1E6140A18;
      v46[4] = v44;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v45, v44, (uint64_t)self, v46);
    }
  }
}

- (NSDictionary)shaderModifiers
{
  uint64_t v2 = self->_shaderModifiers;

  return v2;
}

- (void)setShaderModifiers:(id)a3
{
  if (self->_program && objc_msgSend_count(a3, a2, (uint64_t)a3, v3))
  {
    sub_1B63F2F54(16, @"Error: Cannot use shader modifiers because a program is set", v6, v7, v8, v9, v10, v11, v38);
  }
  else
  {
    shaderModifiers = self->_shaderModifiers;
    if (shaderModifiers != a3)
    {

      if (objc_msgSend_count(a3, v13, v14, v15))
      {
        id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v21 = (NSDictionary *)objc_msgSend_initWithDictionary_copyItems_(v19, v20, (uint64_t)a3, 1);
      }
      else if (a3)
      {
        v21 = (NSDictionary *)MEMORY[0x1E4F1CC08];
      }
      else
      {
        v21 = 0;
      }
      self->_shaderModifiers = v21;
      objc_msgSend_owner(self, v16, v17, v18);
      uint64_t v22 = self->_shaderModifiers;
      uint64_t v23 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v27 = objc_msgSend_count(v22, v24, v25, v26);
      uint64_t v30 = objc_msgSend_arrayWithCapacity_(v23, v28, v27, v29);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = sub_1B63F2D00;
      v36[3] = &unk_1E6141318;
      v36[4] = v30;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v22, v31, (uint64_t)v36, v32);

      v33 = v30;
      self->_cfxShaderModifierCache = v33;
      objc_msgSend__parseAndSetShaderModifier_(self, v34, (uint64_t)v33, v35);
    }
  }
}

- (void)copyModifiersFrom:(id)a3
{
  uint64_t v5 = (void *)*((void *)a3 + 4);
  uint64_t v6 = (NSDictionary *)objc_msgSend_shaderModifiers(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = v6;
  if (v5)
  {
    if (self->_program && objc_msgSend_count(v6, v7, v8, v9))
    {
      sub_1B63F2F54(16, @"Error: Cannot use shader modifiers because a program is set", v11, v12, v13, v14, v15, v16, v27);
    }
    else
    {
      shaderModifiers = self->_shaderModifiers;
      if (shaderModifiers != v10)
      {

        if (objc_msgSend_count(v10, v18, v19, v20))
        {
          id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          uint64_t v23 = (NSDictionary *)objc_msgSend_initWithDictionary_copyItems_(v21, v22, (uint64_t)v10, 1);
        }
        else if (v10)
        {
          uint64_t v23 = (NSDictionary *)MEMORY[0x1E4F1CC08];
        }
        else
        {
          uint64_t v23 = 0;
        }
        self->_shaderModifiers = v23;

        self->_cfxShaderModifierCache = (NSArray *)v5;
        objc_msgSend__parseAndSetShaderModifier_(self, v24, (uint64_t)v5, v25);
      }
    }
  }
  else
  {
    objc_msgSend_setShaderModifiers_(self, v7, (uint64_t)v6, v9);
  }
}

- (void)setMinimumLanguageVersion:(id)a3
{
  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion != a3)
  {

    self->_minimumLanguageVersion = (NSNumber *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self->_owner, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B63F2548;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (NSNumber)minimumLanguageVersion
{
  return self->_minimumLanguageVersion;
}

- (void)_programDidChange:(id)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self->_owner, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B63F269C;
  v8[3] = &unk_1E6141230;
  v8[4] = a3;
  v8[5] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (__CFXFXRenderGraph)_renderGraph
{
  result = (__CFXFXRenderGraph *)objc_msgSend_materialRef(self->_owner, a2, v2, v3);
  if (result)
  {
    return (__CFXFXRenderGraph *)sub_1B64AFA68((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  }
  return result;
}

- (void)_setCFXProgram
{
  uint64_t IfNeeded = objc_msgSend_materialRefCreateIfNeeded(self->_owner, a2, v2, v3);
  if (!IfNeeded) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v6, v7, v8, v9, v10, v11, (uint64_t)"mat");
  }
  if (self->_program)
  {
    uint64_t v13 = (void *)sub_1B65151FC(1uLL);
    sub_1B64AFD18(IfNeeded, v13, v14, v15, v16, v17, v18, v19);
    int isOpaque = objc_msgSend_isOpaque(self, v20, v21, v22);
    sub_1B6515FF4((uint64_t)v13, isOpaque, v24, v25, v26, v27, v28, v29);
    CFRelease(v13);
    if (sub_1B6515384((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36) < 1)
    {
      v46 = (const void *)sub_1B65F6884();
      sub_1B65152BC(v13, v46, v67, v68, v69, v70, v71, v72, v117);
      CFRelease(v46);
    }
    else
    {
      v46 = (const void *)sub_1B6515448((uint64_t)v13, 0, v37, v38, v39, v40, v41, v42);
    }
    v73 = (const void *)objc_msgSend_vertexFunctionName(self->_program, v43, v44, v45);
    v77 = (const void *)objc_msgSend_fragmentFunctionName(self->_program, v74, v75, v76);
    v81 = (const void *)objc_msgSend_library(self->_program, v78, v79, v80);
    v82 = sub_1B6450820(v73, v77, v81);
    v86 = objc_msgSend__bufferBindings(self->_program, v83, v84, v85);
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = sub_1B63F2984;
    v118[3] = &unk_1E6141338;
    v118[4] = v82;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v86, v87, (uint64_t)v118, v88);
    sub_1B64510BC((uint64_t)v82, 1, v89, v90, v91, v92, v93, v94);
    sub_1B65F6C98((uint64_t)v46, 2, v95, v96, v97, v98, v99, v100);
    sub_1B65F6B7C((uint64_t)v46, v82, v101, v102, v103, v104, v105, v106);
    CFRelease(v82);
    sub_1B64AFC88(IfNeeded, v107, v108, v109, v110, v111, v112, v113);
    objc_msgSend__setCFXProgramDelegate(self, v114, v115, v116);
  }
  else
  {
    if (objc_msgSend__renderGraph(self, v5, v6, v7)) {
      sub_1B64AFD18(IfNeeded, 0, v47, v48, v49, v50, v51, v52);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v60 = objc_msgSend_geometryRef(self->_owner, v53, v54, v55);
      sub_1B63CE978(v60, 0, v61, v62, v63, v64, v65, v66);
    }
    sub_1B64AFC88(IfNeeded, (uint64_t)v53, v54, v55, v56, v57, v58, v59);
  }
}

- (void)__CFObject
{
  return objc_msgSend___CFObject(self->_owner, a2, v2, v3);
}

- (void)_customEncodingOfVFXShadableHelper:(id)a3
{
  id owner = self->_owner;
  if (owner) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)owner, @"owner");
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend__customEncodingOfVFXShadableHelper_(self, a2, (uint64_t)a3, v3);
  program = self->_program;
  if (program) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)program, @"program");
  }
  shaderModifiers = self->_shaderModifiers;
  if (shaderModifiers) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)shaderModifiers, @"shaderModifiers");
  }
  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion)
  {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)minimumLanguageVersion, @"minimumLanguageVersion");
  }
}

- (VFXShadableHelper)initWithCoder:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)VFXShadableHelper;
  uint64_t v4 = [(VFXShadableHelper *)&v41 init];
  uint64_t v8 = v4;
  if (v4)
  {
    objc_msgSend__commonInit(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_immediateMode(VFXTransaction, v9, v10, v11);
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
    uint64_t v15 = sub_1B64FAE78();
    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v16, v15, @"owner");
    v8->_id owner = (id)v17;
    if (v17)
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, @"program");
      objc_msgSend_setProgram_(v8, v23, v22, v24);
      uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
      v42[0] = objc_opt_class();
      v42[1] = objc_opt_class();
      uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v42, 2);
      uint64_t v30 = objc_msgSend_setWithArray_(v25, v28, v27, v29);
      uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v31, v30, @"shaderModifiers");
      objc_msgSend_setShaderModifiers_(v8, v33, v32, v34);
      uint64_t v35 = objc_opt_class();
      uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v36, v35, @"minimumLanguageVersion");
      objc_msgSend_setMinimumLanguageVersion_(v8, v38, v37, v39);
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v18, v12, v19);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end