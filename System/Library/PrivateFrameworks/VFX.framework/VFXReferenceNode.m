@interface VFXReferenceNode
+ (BOOL)supportsSecureCoding;
- (BOOL)_isAReference;
- (BOOL)_isNameUnique:(id)a3;
- (BOOL)isLoaded;
- (BOOL)isVirtualEnvironmentNode;
- (NSURL)referenceURL;
- (VFXNode)referencedNode;
- (VFXReferenceNode)initWithCoder:(id)a3;
- (VFXReferenceNode)initWithNode:(id)a3;
- (VFXReferenceNode)initWithURL:(id)a3;
- (id)_loadReferencedWorldWithURL:(id)a3;
- (id)_resolveURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)overrides;
- (int64_t)loadingPolicy;
- (void)_applyOverride:(id)a3 forKeyPath:(id)a4;
- (void)_applyOverrides;
- (void)_applyUnsharing:(id)a3 alreadyShared:(id)a4;
- (void)_diffNode:(id)a3 with:(id)a4 path:(id)a5;
- (void)_diffObject:(id)a3 with:(id)a4 path:(id)a5;
- (void)_loadWithNode:(id)a3 fromURL:(BOOL)a4;
- (void)_loadWithURL:(id)a3;
- (void)addOverride:(id)a3 forKeyPath:(id)a4;
- (void)collectOverrides;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)load;
- (void)removeAllOverrides;
- (void)removeForKeyPath:(id)a3;
- (void)setLoadingPolicy:(int64_t)a3;
- (void)setOverrides:(id)a3;
- (void)setReferenceURL:(id)a3;
- (void)setReferencedNode:(id)a3;
- (void)unload;
@end

@implementation VFXReferenceNode

- (VFXReferenceNode)initWithURL:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXReferenceNode;
  v4 = [(VFXNode *)&v9 init];
  v7 = v4;
  if (v4) {
    objc_msgSend_setReferenceURL_(v4, v5, (uint64_t)a3, v6);
  }
  return v7;
}

- (VFXReferenceNode)initWithNode:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXReferenceNode;
  v4 = [(VFXNode *)&v9 init];
  v7 = v4;
  if (v4) {
    objc_msgSend_setReferencedNode_(v4, v5, (uint64_t)a3, v6);
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXReferenceNode;
  [(VFXNode *)&v3 dealloc];
}

- (void)_diffObject:(id)a3 with:(id)a4 path:(id)a5
{
  id v72 = a5;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (qword_1E9DDAF20 != -1) {
    dispatch_once(&qword_1E9DDAF20, &unk_1F0FB5888);
  }
  v5 = (objc_class *)objc_opt_class();
  unsigned int outCount = 0;
  uint64_t v6 = class_copyPropertyList(v5, &outCount);
  v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v12 = v6[i];
      Attributes = property_getAttributes(v12);
      v16 = objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)Attributes, v15);
      v19 = objc_msgSend_componentsSeparatedByString_(v16, v17, @",", v18);
      v22 = objc_msgSend_objectAtIndex_(v19, v20, 0, v21);
      v25 = objc_msgSend_substringFromIndex_(v22, v23, 1, v24);
      v29 = (const char *)objc_msgSend_UTF8String(v25, v26, v27, v28);
      if (strcmp(v29, "{CATransform3D=dddddddddddddddd}"))
      {
        v32 = objc_msgSend_stringWithUTF8String_(NSString, v30, (uint64_t)Attributes, v31);
        objc_msgSend_rangeOfString_(v32, v33, @",R,", v34);
        if (v35 != 3)
        {
          v36 = NSString;
          Name = property_getName(v12);
          uint64_t v40 = objc_msgSend_stringWithUTF8String_(v36, v38, (uint64_t)Name, v39);
          objc_msgSend_addObject_(v10, v41, v40, v42);
        }
      }
    }
  }
  free(v6);
  objc_msgSend_willChangeValueForKey_(self, v43, @"overrides", v44);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v45, (uint64_t)&v76, (uint64_t)v81, 16);
  if (v48)
  {
    uint64_t v49 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v77 != v49) {
          objc_enumerationMutation(v10);
        }
        v51 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        if ((objc_msgSend_containsObject_((void *)qword_1E9DDAF18, v46, (uint64_t)v51, v47, v72) & 1) == 0
          && (objc_msgSend_hasPrefix_(v51, v46, @"_", v47) & 1) == 0
          && (objc_msgSend_hasPrefix_(v51, v46, @"world", v47) & 1) == 0)
        {
          v52 = objc_msgSend_valueForKey_(a3, v46, (uint64_t)v51, v47);
          v55 = objc_msgSend_valueForKey_(a4, v53, (uint64_t)v51, v54);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              PathComponent = objc_msgSend_lastPathComponent(v52, v56, v57, v58);
              uint64_t v63 = objc_msgSend_lastPathComponent(v55, v60, v61, v62);
              char isEqual = objc_msgSend_isEqual_(PathComponent, v64, v63, v65);
            }
            else
            {
              char isEqual = objc_msgSend_isEqual_(v52, v56, (uint64_t)v55, v58);
            }
            if ((isEqual & 1) == 0)
            {
              v67 = objc_msgSend_stringByAppendingString_(v72, v46, @".", v47);
              uint64_t v70 = objc_msgSend_stringByAppendingString_(v67, v68, (uint64_t)v51, v69);
              objc_msgSend_addOverride_forKeyPath_(self, v71, (uint64_t)v52, v70);
            }
          }
        }
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v46, (uint64_t)&v76, (uint64_t)v81, 16);
    }
    while (v48);
  }
  objc_msgSend_didChangeValueForKey_(self, v46, @"overrides", v47, v72);
}

- (BOOL)_isNameUnique:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B648318C;
  v6[3] = &unk_1E6142760;
  v6[4] = a3;
  v6[5] = &v7;
  objc_msgSend_enumerateHierarchyUsingBlock_(self, a2, (uint64_t)v6, v3);
  BOOL v4 = *((_DWORD *)v8 + 6) == 1;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_diffNode:(id)a3 with:(id)a4 path:(id)a5
{
  if (objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4))
  {
    v12 = objc_msgSend_name(a3, v9, v10, v11);
    if ((objc_msgSend_containsString_(v12, v13, @".", v14) & 1) == 0)
    {
      uint64_t v17 = objc_msgSend_name(a3, v9, v15, v16);
      if (objc_msgSend__isNameUnique_(self, v18, v17, v19))
      {
        uint64_t v22 = objc_msgSend_name(a3, v9, v20, v21);
        a5 = (id)objc_msgSend_stringByAppendingString_(@"/", v23, v22, v24);
      }
    }
  }
  id v182 = a4;
  objc_msgSend__diffObject_with_path_(self, v9, (uint64_t)a3, (uint64_t)a4, a5);
  id v181 = a3;
  if (objc_msgSend_model(a3, v25, v26, v27) && objc_msgSend_model(a4, v28, v29, v30))
  {
    uint64_t v31 = objc_msgSend_model(a3, v28, v29, v30);
    uint64_t v35 = objc_msgSend_model(v182, v32, v33, v34);
    v38 = objc_msgSend_stringByAppendingString_(a5, v36, @".", v37);
    uint64_t v41 = objc_msgSend_stringByAppendingString_(v38, v39, @"geometry", v40);
    objc_msgSend__diffObject_with_path_(self, v42, v31, v35, v41);
    v46 = objc_msgSend_model(a3, v43, v44, v45);
    v50 = objc_msgSend_materials(v46, v47, v48, v49);
    uint64_t v54 = objc_msgSend_count(v50, v51, v52, v53);
    uint64_t v58 = objc_msgSend_model(v182, v55, v56, v57);
    uint64_t v62 = objc_msgSend_materials(v58, v59, v60, v61);
    if (v54 == objc_msgSend_count(v62, v63, v64, v65))
    {
      v73 = objc_msgSend_model(a3, v66, v67, v68);
      v186 = objc_msgSend_materials(v73, v74, v75, v76);
      v80 = objc_msgSend_model(v182, v77, v78, v79);
      v185 = objc_msgSend_materials(v80, v81, v82, v83);
      if (v54)
      {
        uint64_t v84 = 0;
        uint64_t v183 = v54;
        id v184 = a5;
        do
        {
          v85 = objc_msgSend_objectAtIndexedSubscript_(v186, v28, v84, v30);
          v88 = objc_msgSend_objectAtIndexedSubscript_(v185, v86, v84, v87);
          uint64_t v91 = objc_msgSend_stringWithFormat_(NSString, v89, @"geometry.materials[%d]", v90);
          v94 = objc_msgSend_stringByAppendingString_(a5, v92, @".", v93);
          v97 = objc_msgSend_stringByAppendingString_(v94, v95, v91, v96);
          objc_msgSend__diffObject_with_path_(self, v98, (uint64_t)v85, (uint64_t)v88, v97);
          v102 = objc_msgSend_properties(v85, v99, v100, v101);
          v106 = objc_msgSend_properties(v88, v103, v104, v105);
          uint64_t v110 = objc_msgSend_count(v102, v107, v108, v109);
          uint64_t v187 = v84;
          if (objc_msgSend_count(v106, v111, v112, v113) == v110)
          {
            if (v110)
            {
              for (uint64_t i = 0; i != v110; ++i)
              {
                uint64_t v119 = objc_msgSend_objectAtIndexedSubscript_(v102, v28, i, v30);
                uint64_t v122 = objc_msgSend_objectAtIndexedSubscript_(v106, v120, i, v121);
                v125 = objc_msgSend_objectAtIndexedSubscript_(v102, v123, i, v124);
                v129 = self;
                uint64_t v130 = objc_msgSend_materialPropertyName(v125, v126, v127, v128);
                v133 = objc_msgSend_stringByAppendingString_(v97, v131, @".", v132);
                uint64_t v134 = v130;
                self = v129;
                uint64_t v137 = objc_msgSend_stringByAppendingString_(v133, v135, v134, v136);
                objc_msgSend__diffObject_with_path_(v129, v138, v119, v122, v137);
              }
            }
          }
          else
          {
            sub_1B63F2F54(16, @"Error: inconsistency - material has custom properties - can't diff reference node", v29, v30, v114, v115, v116, v117, v84);
          }
          uint64_t v84 = v187 + 1;
          a5 = v184;
        }
        while (v187 + 1 != v183);
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Error: inconsistency - material count doesn't match - can't diff reference node", v67, v68, v69, v70, v71, v72, v180);
    }
  }
  v139 = objc_msgSend_childNodes(v181, v28, v29, v30);
  uint64_t v143 = objc_msgSend_count(v139, v140, v141, v142);
  v147 = objc_msgSend_childNodes(v182, v144, v145, v146);
  if (v143 == objc_msgSend_count(v147, v148, v149, v150))
  {
    if (v143)
    {
      for (uint64_t j = 0; j != v143; ++j)
      {
        uint64_t v159 = objc_msgSend_stringWithFormat_(NSString, v151, @"[%d]", v153, j);
        v162 = objc_msgSend_stringByAppendingString_(a5, v160, @".", v161);
        a5 = (id)objc_msgSend_stringByAppendingString_(v162, v163, v159, v164);
        v168 = objc_msgSend_childNodes(v181, v165, v166, v167);
        uint64_t v171 = objc_msgSend_objectAtIndexedSubscript_(v168, v169, j, v170);
        v175 = objc_msgSend_childNodes(v182, v172, v173, v174);
        uint64_t v178 = objc_msgSend_objectAtIndexedSubscript_(v175, v176, j, v177);
        objc_msgSend__diffNode_with_path_(self, v179, v171, v178, a5);
      }
    }
  }
  else
  {
    sub_1B63F2F54(16, @"Error: inconsistency - hierarchy doesn't match - can't diff reference node", v152, v153, v154, v155, v156, v157, v189);
  }
}

- (void)collectOverrides
{
  objc_msgSend_removeAllOverrides(self, a2, v2, v3);
  if (self->_referenceURL)
  {
    uint64_t v8 = objc_msgSend__resolveURL(self, v5, v6, v7);
    ReferencedWorldWithURL = objc_msgSend__loadReferencedWorldWithURL_(self, v9, v8, v10);
    referenceNode = objc_msgSend_rootNode(ReferencedWorldWithURL, v12, v13, v14);
    Object = self;
  }
  else
  {
    referenceNode = self->_referenceNode;
    uint64_t v21 = objc_msgSend_childNodes(self, v5, v6, v7);
    Object = objc_msgSend_firstObject(v21, v22, v23, v24);
  }
  uint64_t v20 = objc_msgSend_childNodes(referenceNode, v15, v16, v17);
  uint64_t v28 = objc_msgSend_count(v20, v25, v26, v27);
  v32 = objc_msgSend_childNodes(Object, v29, v30, v31);
  if (v28 == objc_msgSend_count(v32, v33, v34, v35))
  {
    objc_msgSend__diffNode_with_path_(self, v36, (uint64_t)Object, (uint64_t)referenceNode, &stru_1F0FCDBB0);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: inconsistency - hierarchy changed - can't diff reference node", v37, v38, v39, v40, v41, v42, v44);
  }
}

- (void)addOverride:(id)a3 forKeyPath:(id)a4
{
  objc_msgSend_willChangeValueForKey_(self, a2, @"overrides", (uint64_t)a4);
  overrides = self->_overrides;
  if (!overrides)
  {
    overrides = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_overrides = overrides;
  }
  objc_msgSend_setObject_forKey_(overrides, v7, (uint64_t)a3, (uint64_t)a4);

  objc_msgSend_didChangeValueForKey_(self, v9, @"overrides", v10);
}

- (void)removeForKeyPath:(id)a3
{
  objc_msgSend_willChangeValueForKey_(self, a2, @"overrides", v3);
  objc_msgSend_removeObjectForKey_(self->_overrides, v6, (uint64_t)a3, v7);
  if (!objc_msgSend_count(self->_overrides, v8, v9, v10))
  {

    self->_overrides = 0;
  }

  objc_msgSend_didChangeValueForKey_(self, v11, @"overrides", v12);
}

- (void)removeAllOverrides
{
  objc_msgSend_willChangeValueForKey_(self, a2, @"overrides", v2);
  objc_msgSend_removeAllObjects(self->_overrides, v4, v5, v6);

  objc_msgSend_didChangeValueForKey_(self, v7, @"overrides", v8);
}

- (id)overrides
{
  if (self->_overrides) {
    return self->_overrides;
  }
  else {
    return (id)MEMORY[0x1E4F1CC08];
  }
}

- (void)setOverrides:(id)a3
{
  objc_msgSend_willChangeValueForKey_(self, a2, @"overrides", v3);

  self->_overrides = (NSMutableDictionary *)objc_msgSend_mutableCopy(a3, v6, v7, v8);

  objc_msgSend_didChangeValueForKey_(self, v9, @"overrides", v10);
}

- (void)_applyOverride:(id)a3 forKeyPath:(id)a4
{
}

- (void)_applyUnsharing:(id)a3 alreadyShared:(id)a4
{
  if ((objc_msgSend_containsObject_(a4, a2, (uint64_t)a3, (uint64_t)a4) & 1) == 0)
  {
    objc_msgSend_addObject_(a4, v7, (uint64_t)a3, v8);
    uint64_t v10 = objc_msgSend_rangeOfString_options_(a3, v9, @".", 4);
    if (v13 == 1)
    {
      uint64_t v14 = v10;
      uint64_t v15 = v10 + 1;
      if (v10 + 1 < (unint64_t)objc_msgSend_length(a3, (const char *)1, v11, v12))
      {
        uint64_t v18 = objc_msgSend_substringToIndex_(a3, v16, v14, v17);
        uint64_t v21 = objc_msgSend_substringFromIndex_(a3, v19, v15, v20);
        uint64_t v24 = objc_msgSend_valueForKeyPath_(self, v22, v18, v23);
        if (v24)
        {
          v25 = (void *)v24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend_isEqualToString_(v21, v26, @"geometry", v27))
          {
            uint64_t v31 = objc_msgSend_model(v25, v28, v29, v30);
            uint64_t v35 = objc_msgSend_copy(v31, v32, v33, v34);
            objc_msgSend_setModel_(v25, v36, (uint64_t)v35, v37);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ((objc_msgSend_containsObject_(a4, v38, v18, v39) & 1) == 0)
            {
              objc_msgSend__applyUnsharing_alreadyShared_(self, v40, v18, (uint64_t)a4);
              v25 = objc_msgSend_valueForKeyPath_(self, v42, v18, v43);
            }
            if (objc_msgSend_isEqualToString_(v21, v40, @"firstMaterial", v41))
            {
              unint64_t v47 = 0;
LABEL_13:
              uint64_t v48 = objc_msgSend_materials(v25, v44, v45, v46);
              if (v47 >= objc_msgSend_count(v48, v49, v50, v51))
              {
                v73 = objc_msgSend_materials(v25, v52, v53, v54);
                objc_msgSend_count(v73, v74, v75, v76);
                sub_1B63F2F54(16, @"Error: failed to evaluate key path %@ - material index %d out of bounds (%d)", v77, v78, v79, v80, v81, v82, (uint64_t)a3);
              }
              else
              {
                v55 = objc_msgSend_materials(v25, v52, v53, v54);
                uint64_t v58 = objc_msgSend_objectAtIndexedSubscript_(v55, v56, v47, v57);
                id v106 = (id)objc_msgSend_copy(v58, v59, v60, v61);
                objc_msgSend_replaceMaterialAtIndex_withMaterial_(v25, v62, v47, (uint64_t)v106);
              }
              return;
            }
            if (!objc_msgSend_isEqualToString_(v21, v44, @"materials", v46))
            {
              uint64_t v83 = objc_msgSend_rangeOfString_(v21, v63, @"[", v65);
              if (v90 != 1)
              {
                sub_1B63F2F54(16, @"Error: failed to parse key path %@ - missing '['", v84, v85, v86, v87, v88, v89, (uint64_t)a3);
                return;
              }
              uint64_t v91 = objc_msgSend_substringFromIndex_(v21, (const char *)1, v83 + 1, v85);
              uint64_t v94 = objc_msgSend_rangeOfString_(v91, v92, @"]", v93);
              if (v101 != 1)
              {
                sub_1B63F2F54(16, @"Error: failed to parse key path %@ - missing ']'", v95, v96, v97, v98, v99, v100, (uint64_t)a3);
                return;
              }
              v102 = objc_msgSend_substringToIndex_(v91, (const char *)1, v94, v96);
              unint64_t v47 = objc_msgSend_integerValue(v102, v103, v104, v105);
              goto LABEL_13;
            }
            v66 = objc_msgSend_materials(v25, v63, v64, v65);
            id v71 = (id)objc_msgSend_copy(v66, v67, v68, v69);
            objc_msgSend_setMaterials_(v25, v70, (uint64_t)v71, v72);
          }
        }
      }
    }
  }
}

- (void)_applyOverrides
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  overrides = self->_overrides;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B6483CA8;
  v11[3] = &unk_1E6142788;
  v11[4] = self;
  v11[5] = v3;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(overrides, v5, (uint64_t)v11, v6);
  uint64_t v7 = self->_overrides;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6483CB8;
  v10[3] = &unk_1E6141318;
  v10[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v8, (uint64_t)v10, v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VFXReferenceNode;
  BOOL v4 = [(VFXNode *)&v15 copyWithZone:a3];
  objc_msgSend_setReferenceURL_(v4, v5, (uint64_t)self->_referenceURL, v6);
  objc_msgSend_setReferencedNode_(v4, v7, (uint64_t)self->_referenceNode, v8);
  objc_msgSend_setLoadingPolicy_(v4, v9, self->_loadingPolicy, v10);
  v4[37] = objc_msgSend_mutableCopy(self->_overrides, v11, v12, v13);
  return v4;
}

- (BOOL)_isAReference
{
  return 1;
}

- (NSURL)referenceURL
{
  return self->_referenceURL;
}

- (void)setReferenceURL:(id)a3
{
  referenceURL = self->_referenceURL;
  if (referenceURL != a3)
  {

    self->_referenceURL = (NSURL *)objc_msgSend_copy(a3, v6, v7, v8);
  }
}

- (BOOL)isVirtualEnvironmentNode
{
  BOOL v4 = objc_msgSend_scheme(self->_referenceURL, a2, v2, v3);

  return objc_msgSend_isEqualToString_(v4, v5, @"env", v6);
}

- (VFXNode)referencedNode
{
  return self->_referenceNode;
}

- (void)setReferencedNode:(id)a3
{
  referenceNode = self->_referenceNode;
  if (referenceNode != a3)
  {

    self->_referenceNode = (VFXNode *)a3;
  }
}

- (id)_resolveURL
{
  referenceURL = self->_referenceURL;
  if (!referenceURL) {
    return 0;
  }
  if (objc_msgSend_scheme(self->_referenceURL, a2, v2, v3)
    && !objc_msgSend_isFileURL(referenceURL, v6, v7, v8))
  {
    return referenceURL;
  }
  uint64_t v9 = objc_msgSend_relativePath(referenceURL, v6, v7, v8);
  if (objc_msgSend_isAbsolutePath(v9, v10, v11, v12)) {
    return referenceURL;
  }
  sourceDocumentURL = self->_sourceDocumentURL;
  if (!sourceDocumentURL) {
    return referenceURL;
  }
  PathComponent = objc_msgSend_URLByDeletingLastPathComponent(sourceDocumentURL, v13, v14, v15);
  CFURLRef v20 = (const __CFURL *)objc_msgSend_URLByAppendingPathComponent_(PathComponent, v18, (uint64_t)v9, v19);
  if (!sub_1B65D7E88(v20)) {
    return referenceURL;
  }
  return v20;
}

- (void)unload
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend_childNodes(self, a2, v2, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_removeFromParentNode(*(void **)(*((void *)&v14 + 1) + 8 * v13++), v8, v9, v10);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v11);
  }
  self->_loaded = 0;
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (id)_loadReferencedWorldWithURL:(id)a3
{
  if (a3)
  {
    return (id)objc_msgSend_worldWithURL_options_error_(VFXWorld, a2, (uint64_t)a3, 0, 0);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: failed to locate world reference %@", 0, v3, v4, v5, v6, v7, (uint64_t)self);
    return 0;
  }
}

- (void)load
{
  if (!self->_loaded)
  {
    uint64_t v5 = objc_msgSend__resolveURL(self, a2, v2, v3);
    if (v5)
    {
      MEMORY[0x1F4181798](self, sel__loadWithURL_, v5, v6);
    }
    else
    {
      referenceNode = self->_referenceNode;
      if (referenceNode)
      {
        MEMORY[0x1F4181798](self, sel__loadWithNode_fromURL_, referenceNode, 0);
      }
    }
  }
}

- (void)_loadWithNode:(id)a3 fromURL:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  self->_loaded = 1;
  uint64_t v7 = objc_msgSend_clone(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_enumerateHierarchyUsingBlock_(v7, v8, (uint64_t)&unk_1F0FB70A8, v9);
  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v13 = objc_msgSend_childNodes(v7, v10, v11, v12, 0);
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v25;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend_addChildNode_(self, v16, *(void *)(*((void *)&v24 + 1) + 8 * v20++), v17);
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v18);
    }
    objc_msgSend__copyAnimationsFrom_(self, v16, (uint64_t)a3, v17);
  }
  else
  {
    objc_msgSend_addChildNode_(self, v10, (uint64_t)v7, v12);
  }
  objc_msgSend__applyOverrides(self, v21, v22, v23);
}

- (void)_loadWithURL:(id)a3
{
  if (a3)
  {
    id v12 = (id)objc_msgSend_valueForKey_(VFXTransaction, a2, @"VFXReferenceLoadingStack", v3);
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_msgSend_setValue_forKey_(VFXTransaction, v13, (uint64_t)v12, @"VFXReferenceLoadingStack");
    }
    if (objc_msgSend_containsObject_(v12, v10, (uint64_t)a3, v11))
    {
      sub_1B63F2F54(16, @"Error: failed to resolve referenced world (%@) cycle detected", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
    }
    else
    {
      objc_msgSend_addObject_(v12, v14, (uint64_t)a3, v16);
      ReferencedWorldWithURL = objc_msgSend__loadReferencedWorldWithURL_(self, v21, (uint64_t)a3, v22);
      objc_msgSend_removeObject_(v12, v24, (uint64_t)a3, v25);
      if (ReferencedWorldWithURL)
      {
        uint64_t v29 = objc_msgSend_rootNode(ReferencedWorldWithURL, v26, v27, v28);
        MEMORY[0x1F4181798](self, sel__loadWithNode_fromURL_, v29, 1);
      }
    }
  }
  else
  {
    sub_1B63F2F54(16, @"Error: failed to locate world reference %@", 0, v3, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  referenceURL = self->_referenceURL;
  if (!referenceURL) {
    referenceURL = self->_referenceNode;
  }
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p source=%@>", v7, v5, self, referenceURL);
}

- (void)encodeWithCoder:(id)a3
{
  referenceURL = self->_referenceURL;
  if (referenceURL) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)referenceURL, @"referenceURL");
  }
  referenceNode = self->_referenceNode;
  if (referenceNode) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)referenceNode, @"referenceNode");
  }
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_loadingPolicy, @"loadingPolicy");
  overrides = self->_overrides;
  if (overrides) {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)overrides, @"overrides");
  }
  v9.receiver = self;
  v9.super_class = (Class)VFXReferenceNode;
  [(VFXNode *)&v9 encodeWithCoder:a3];
}

- (VFXReferenceNode)initWithCoder:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)VFXReferenceNode;
  uint64_t v4 = -[VFXNode initWithCoder:](&v37, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v38, 2);
    uint64_t v10 = objc_msgSend_setWithArray_(v5, v8, v7, v9);
    uint64_t v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, @"referenceURL");
    objc_msgSend_setReferenceURL_(v4, v13, v12, v14);
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"referenceNode");
    objc_msgSend_setReferencedNode_(v4, v18, v17, v19);
    uint64_t v22 = objc_msgSend_decodeIntegerForKey_(a3, v20, @"loadingPolicy", v21);
    objc_msgSend_setLoadingPolicy_(v4, v23, v22, v24);
    uint64_t v25 = sub_1B64FAE78();
    uint64_t v27 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v26, v25, @"overrides");
    objc_msgSend_setOverrides_(v4, v28, v27, v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_sourceDocumentURL = (NSURL *)(id)objc_msgSend_documentURL(a3, v30, v31, v32);
    }
    if ((objc_msgSend_containsValueForKey_(a3, v30, @"childNodes", v32) & 1) == 0 && !v4->_loadingPolicy) {
      objc_msgSend_load(v4, v33, v34, v35);
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)loadingPolicy
{
  return self->_loadingPolicy;
}

- (void)setLoadingPolicy:(int64_t)a3
{
  self->_loadingPolicy = a3;
}

@end