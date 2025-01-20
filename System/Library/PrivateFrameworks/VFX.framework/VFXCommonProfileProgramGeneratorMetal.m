@interface VFXCommonProfileProgramGeneratorMetal
- (__CFXFXProgram)_newProgramWithHashCode:(__CFXProgramHashCode *)a3 engineContext:(__CFXEngineContext *)a4 introspectionDataPtr:(void *)a5;
- (id)initAllowingHotReload:(BOOL)a3;
- (id)splitInputOutputStructsIfNeededForSourceCode:(id)a3 generatedFromReplacementStrings:(id)a4 perPixelLighting:(BOOL)a5 clipDistanceCount:(unint64_t)a6;
- (int)profile;
- (void)_loadSourceCode;
- (void)collectShaderForProgram:(__CFXFXProgram *)a3 hashCode:(id)a4 newVertexFunctionName:(id)a5 newFragmentFunctionName:(id)a6 sourceCodeBlock:(id)a7 additionalFileBlock:(id)a8;
- (void)dealloc;
- (void)emptyShaderCache;
@end

@implementation VFXCommonProfileProgramGeneratorMetal

- (int)profile
{
  return 0;
}

- (void)_loadSourceCode
{
  v210[3] = *MEMORY[0x1E4F143B8];
  originalLightingSourceCode = (NSString *)sub_1B6602C1C(@"CFX-Lighting.metal");
  self->_originalLightingSourceCode = originalLightingSourceCode;
  if (!originalLightingSourceCode)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v5, v6, v7, v8, v9, v10, (uint64_t)"_originalLightingSourceCode");
    originalLightingSourceCode = self->_originalLightingSourceCode;
  }
  v11 = (void *)MEMORY[0x1E4F29238];
  uint64_t v12 = objc_msgSend_rangeOfString_(originalLightingSourceCode, v4, @"__SurfaceExtraDecl__", v6);
  uint64_t v14 = objc_msgSend_valueWithRange_(v11, v13, v12, (uint64_t)v13);
  v15 = (void *)MEMORY[0x1E4F29238];
  uint64_t v18 = objc_msgSend_rangeOfString_(self->_originalLightingSourceCode, v16, @"__LightModifierExtraDecl__", v17);
  uint64_t v20 = objc_msgSend_valueWithRange_(v15, v19, v18, (uint64_t)v19);
  v21 = (void *)MEMORY[0x1E4F29238];
  uint64_t v24 = objc_msgSend_rangeOfString_(self->_originalLightingSourceCode, v22, @"__DoLightModifier__", v23);
  v210[0] = v14;
  v210[1] = v20;
  v210[2] = objc_msgSend_valueWithRange_(v21, v25, v24, (uint64_t)v25);
  v27 = (NSArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v210, 3);
  self->_lightingInjectionPointRanges = v27;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v203, (uint64_t)v209, 16);
  if (v29)
  {
    uint64_t v33 = v29;
    uint64_t v34 = *(void *)v204;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v204 != v34) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend_rangeValue(*(void **)(*((void *)&v203 + 1) + 8 * i), v30, v31, v32);
        if (!v30) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. range not found", v31, v32, v36, v37, v38, v39, (uint64_t)"range.rangeValue.length > 0");
        }
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v203, (uint64_t)v209, 16);
    }
    while (v33);
  }
  v40 = (NSString *)sub_1B6602C1C(@"CFX-CommonProfile.metal");
  self->_originalSourceCode = v40;
  v41 = (void *)MEMORY[0x1E4F29238];
  uint64_t v44 = objc_msgSend_rangeOfString_(v40, v42, @"#import \"vfx_metal\"", v43);
  uint64_t v198 = objc_msgSend_valueWithRange_(v41, v45, v44, (uint64_t)v45);
  v46 = (void *)MEMORY[0x1E4F29238];
  uint64_t v49 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v47, @"#import \"vfx_util.h\"", v48);
  uint64_t v197 = objc_msgSend_valueWithRange_(v46, v50, v49, (uint64_t)v50);
  v51 = (void *)MEMORY[0x1E4F29238];
  uint64_t v54 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v52, @"#import \"CFX-PBR.metal\"", v53);
  uint64_t v196 = objc_msgSend_valueWithRange_(v51, v55, v54, (uint64_t)v55);
  v56 = (void *)MEMORY[0x1E4F29238];
  uint64_t v59 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v57, @"#import \"vfx_tessellation.h\"", v58);
  uint64_t v195 = objc_msgSend_valueWithRange_(v56, v60, v59, (uint64_t)v60);
  v61 = (void *)MEMORY[0x1E4F29238];
  uint64_t v64 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v62, @"__TexcoordDecl__", v63);
  uint64_t v194 = objc_msgSend_valueWithRange_(v61, v65, v64, (uint64_t)v65);
  v66 = (void *)MEMORY[0x1E4F29238];
  uint64_t v69 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v67, @"__ExtraVaryingsDecl__", v68);
  uint64_t v193 = objc_msgSend_valueWithRange_(v66, v70, v69, (uint64_t)v70);
  v71 = (void *)MEMORY[0x1E4F29238];
  uint64_t v74 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v72, @"__ShaderModifiersDecl__", v73);
  uint64_t v192 = objc_msgSend_valueWithRange_(v71, v75, v74, (uint64_t)v75);
  v76 = (void *)MEMORY[0x1E4F29238];
  uint64_t v79 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v77, @"#import \"CFX-Lighting.metal\"", v78);
  uint64_t v191 = objc_msgSend_valueWithRange_(v76, v80, v79, (uint64_t)v80);
  v81 = (void *)MEMORY[0x1E4F29238];
  uint64_t v84 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v82, @"__OpenSubdivDeclPerGeometry__", v83);
  uint64_t v190 = objc_msgSend_valueWithRange_(v81, v85, v84, (uint64_t)v85);
  v86 = (void *)MEMORY[0x1E4F29238];
  uint64_t v89 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v87, @"__OpenSubdivDeclPerPatchType__", v88);
  uint64_t v189 = objc_msgSend_valueWithRange_(v86, v90, v89, (uint64_t)v90);
  v91 = (void *)MEMORY[0x1E4F29238];
  uint64_t v94 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v92, @"__OpenSubdivDeclShared__", v93);
  uint64_t v188 = objc_msgSend_valueWithRange_(v91, v95, v94, (uint64_t)v95);
  v96 = (void *)MEMORY[0x1E4F29238];
  uint64_t v99 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v97, @"__VertexExtraArguments__", v98);
  uint64_t v187 = objc_msgSend_valueWithRange_(v96, v100, v99, (uint64_t)v100);
  v101 = (void *)MEMORY[0x1E4F29238];
  uint64_t v104 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v102, @"__VertexDoVertexOnlyTexcoord__", v103);
  uint64_t v186 = objc_msgSend_valueWithRange_(v101, v105, v104, (uint64_t)v105);
  v106 = (void *)MEMORY[0x1E4F29238];
  uint64_t v109 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v107, @"__DoGeometryModifier__", v108);
  uint64_t v185 = objc_msgSend_valueWithRange_(v106, v110, v109, (uint64_t)v110);
  v111 = (void *)MEMORY[0x1E4F29238];
  uint64_t v114 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v112, @"__VertexDoLighting__", v113);
  uint64_t v184 = objc_msgSend_valueWithRange_(v111, v115, v114, (uint64_t)v115);
  v116 = (void *)MEMORY[0x1E4F29238];
  uint64_t v119 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v117, @"__VertexDoTexcoord__", v118);
  uint64_t v183 = objc_msgSend_valueWithRange_(v116, v120, v119, (uint64_t)v120);
  v121 = (void *)MEMORY[0x1E4F29238];
  uint64_t v124 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v122, @"__FragmentExtraArguments__", v123);
  uint64_t v126 = objc_msgSend_valueWithRange_(v121, v125, v124, (uint64_t)v125);
  v127 = (void *)MEMORY[0x1E4F29238];
  uint64_t v130 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v128, @"__FragmentDoTexcoord__", v129);
  uint64_t v132 = objc_msgSend_valueWithRange_(v127, v131, v130, (uint64_t)v131);
  v133 = (void *)MEMORY[0x1E4F29238];
  uint64_t v136 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v134, @"__DoSurfaceModifier__", v135);
  uint64_t v138 = objc_msgSend_valueWithRange_(v133, v137, v136, (uint64_t)v137);
  v139 = (void *)MEMORY[0x1E4F29238];
  uint64_t v142 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v140, @"__LightModifierCopyDecl__", v141);
  uint64_t v144 = objc_msgSend_valueWithRange_(v139, v143, v142, (uint64_t)v143);
  v145 = (void *)MEMORY[0x1E4F29238];
  uint64_t v148 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v146, @"__FragmentDoLighting__", v147);
  uint64_t v150 = objc_msgSend_valueWithRange_(v145, v149, v148, (uint64_t)v149);
  v151 = (void *)MEMORY[0x1E4F29238];
  uint64_t v154 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v152, @"__DoFragmentModifier__", v153);
  uint64_t v156 = objc_msgSend_valueWithRange_(v151, v155, v154, (uint64_t)v155);
  uint64_t v159 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v157, @"} commonprofile_io;", v158);
  v161 = &v160[v159];
  NSUInteger v162 = objc_msgSend_rangeOfString_options_range_(self->_originalSourceCode, v160, @"typedef struct {", 4, 0, &v160[v159]);
  self->_commonProfileIORange.location = v162;
  self->_commonProfileIORange.length = (NSUInteger)&v161[-v162];
  v208[0] = v198;
  v208[1] = v197;
  v208[2] = v196;
  v208[3] = v195;
  v208[4] = v194;
  v208[5] = v193;
  v208[6] = v192;
  v208[7] = v191;
  v208[8] = v190;
  v208[9] = v189;
  v208[10] = v188;
  v208[11] = v187;
  v208[12] = v186;
  v208[13] = v185;
  v208[14] = v184;
  v208[15] = v183;
  v208[16] = v126;
  v208[17] = v132;
  v208[18] = v138;
  v208[19] = v144;
  v208[20] = v150;
  v208[21] = v156;
  v164 = (NSArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v163, (uint64_t)v208, 22);
  self->_injectionPointRanges = v164;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v165, (uint64_t)&v199, (uint64_t)v207, 16);
  if (v166)
  {
    uint64_t v174 = v166;
    uint64_t v175 = *(void *)v200;
    do
    {
      for (uint64_t j = 0; j != v174; ++j)
      {
        if (*(void *)v200 != v175) {
          objc_enumerationMutation(v164);
        }
        objc_msgSend_rangeValue(*(void **)(*((void *)&v199 + 1) + 8 * j), v167, v168, v169);
        if (!v167) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. range not found", v168, v169, v177, v178, v179, v180, (uint64_t)"range.rangeValue.length > 0");
        }
      }
      uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v167, (uint64_t)&v199, (uint64_t)v207, 16);
    }
    while (v174);
  }
  if (!self->_originalSourceCode) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v168, v169, v170, v171, v172, v173, (uint64_t)"_originalSourceCode");
  }
  v181 = self->_lightingInjectionPointRanges;
  v182 = self->_injectionPointRanges;
}

- (void)emptyShaderCache
{
  objc_msgSend__loadSourceCode(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)VFXCommonProfileProgramGeneratorMetal;
  [(VFXCommonProfileProgramGenerator *)&v6 emptyShaderCache];
}

- (id)initAllowingHotReload:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXCommonProfileProgramGeneratorMetal;
  uint64_t v4 = [(VFXCommonProfileProgramGenerator *)&v10 init];
  uint64_t v8 = v4;
  if (v4)
  {
    v4->_allowHotReload = a3;
    objc_msgSend__loadSourceCode(v4, v5, v6, v7);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXCommonProfileProgramGeneratorMetal;
  [(VFXCommonProfileProgramGenerator *)&v3 dealloc];
}

- (__CFXFXProgram)_newProgramWithHashCode:(__CFXProgramHashCode *)a3 engineContext:(__CFXEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  uint64_t v5 = a3;
  uint64_t v661 = *MEMORY[0x1E4F143B8];
  long long v638 = 0u;
  long long v639 = 0u;
  long long v636 = 0u;
  long long v637 = 0u;
  long long v634 = 0u;
  long long v635 = 0u;
  long long v632 = 0u;
  long long v633 = 0u;
  long long v630 = 0u;
  long long v631 = 0u;
  long long v628 = 0u;
  long long v629 = 0u;
  long long v626 = 0u;
  long long v627 = 0u;
  v624 = a3;
  uint64_t v6 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 0, (uint64_t)a4, a5);
  v625 = v6;
  uint64_t v9 = 0;
  if (sub_1B64F53A4())
  {
    uint64_t v9 = objc_msgSend_setWithCapacity_(MEMORY[0x1E4F1CA80], v7, 0, v8);
    *(void *)&long long v626 = v9;
  }
  *(void *)&long long v630 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v7, 0, v8);
  *(void *)&long long v627 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v10, 0, v11);
  *((void *)&v627 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v12, 0, v13);
  *((void *)&v630 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v14, 0, v15);
  *(void *)&long long v631 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v16, 0, v17);
  *((void *)&v631 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v18, 0, v19);
  *(void *)&long long v632 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v20, 0, v21);
  *((void *)&v632 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v22, 0, v23);
  *((void *)&v633 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v24, 0, v25);
  *(void *)&long long v634 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v26, 0, v27);
  *(void *)&long long v635 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v28, 0, v29);
  *((void *)&v635 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v30, 0, v31);
  *(void *)&long long v636 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v32, 0, v33);
  *((void *)&v636 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v34, 0, v35);
  *(void *)&long long v637 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v36, 0, v37);
  __int16 v618 = sub_1B659D954((uint64_t)v5);
  int v38 = sub_1B659D860((uint64_t)v5, 6u);
  int v605 = sub_1B659D860((uint64_t)v5, 3u);
  char v608 = sub_1B659D8E8((uint64_t)v5);
  int v39 = sub_1B659D900((uint64_t)v5);
  int v619 = sub_1B659D8A4((uint64_t)v5);
  __int16 v40 = sub_1B659D84C((uint64_t)v5);
  char v41 = v40;
  __int16 v42 = v40;
  unsigned int v615 = sub_1B659D830((uint64_t)v5);
  int v616 = (v615 & 4) != 0 && sub_1B6447A04((uint64_t)a4, 16);
  __int16 v43 = sub_1B659D854((uint64_t)v5, 1u);
  BYTE11(v637) = v38 | ((v42 & 0x10) >> 4);
  int v44 = sub_1B659D964((uint64_t)v5);
  uint64_t v45 = sub_1B659D95C((uint64_t)v5);
  if (v44)
  {
    uint64_t v48 = v45;
    if (!objc_msgSend_objectForKeyedSubscript_(v6, v46, @"USE_POSITION", v47)) {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v49, (uint64_t)&unk_1F103BAF8, @"USE_POSITION");
    }
    uint64_t v51 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v49, v48, v50);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v52, v51, @"USE_MULTIPLE_RENDERING");
    int v53 = sub_1B659D970((uint64_t)v5);
    if (v53 == 2)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v46, (uint64_t)&stru_1F0FCDBB0, @"USE_VERTEX_AMPLIFICATION");
    }
    else if (v53 == 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v46, (uint64_t)&stru_1F0FCDBB0, @"USE_INSTANCING");
    }
    if (v44 == 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v46, (uint64_t)&stru_1F0FCDBB0, @"USE_LAYERED_RENDERING");
    }
    else if (v44 == 2)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v46, (uint64_t)&stru_1F0FCDBB0, @"USE_MULTIPLE_VIEWPORTS_RENDERING");
    }
  }
  if (v9)
  {
    objc_msgSend_addObject_(v9, v46, @"USE_MULTIPLE_RENDERING", v47);
    objc_msgSend_addObject_(v9, v54, @"USE_VERTEX_AMPLIFICATION", v55);
    objc_msgSend_addObject_(v9, v56, @"USE_INSTANCING", v57);
    objc_msgSend_addObject_(v9, v58, @"USE_LAYERED_RENDERING", v59);
    objc_msgSend_addObject_(v9, v60, @"USE_MULTIPLE_VIEWPORTS_RENDERING", v61);
  }
  if (sub_1B659D930((uint64_t)v5)) {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v62, (uint64_t)&stru_1F0FCDBB0, @"USE_IBL_TRANSFORM");
  }
  unint64_t v63 = sub_1B64D9870();
  unsigned int v64 = sub_1B659DC08((uint64_t)v5);
  if (v63 <= v64) {
    unint64_t v65 = v64;
  }
  else {
    unint64_t v65 = v63;
  }
  int v609 = v39;
  int v606 = v38;
  __int16 v607 = v43;
  if (v44 == 2)
  {
    if (v65 <= 0x20001) {
      unint64_t v65 = 131073;
    }
    __int16 v67 = v618;
  }
  else
  {
    BOOL v66 = v44 == 1;
    __int16 v67 = v618;
    if (v66 && v65 <= 0x20001) {
      unint64_t v65 = 131073;
    }
  }
  unint64_t v611 = v65;
  int v610 = sub_1B6446D6C((uint64_t)a4);
  memset(v660, 0, sizeof(v660));
  uint64_t v68 = sub_1B659DB7C((uint64_t)v5, 0, (uint64_t)v660, 32);
  memset(v659, 0, sizeof(v659));
  uint64_t v69 = sub_1B659DB7C((uint64_t)v624, 1u, (uint64_t)v659, 32);
  memset(v658, 0, sizeof(v658));
  uint64_t v70 = sub_1B659DB7C((uint64_t)v624, 2u, (uint64_t)v658, 32);
  *((void *)&v634 + 1) = 0;
  uint64_t v77 = sub_1B659DB7C((uint64_t)v624, 3u, (uint64_t)&v634 + 8, 1);
  if (v77 >= 2)
  {
    sub_1B63F2F54(16, @"Error: cannot handle more than one lighting modifier", v71, v72, v73, v74, v75, v76, v594);
    uint64_t v77 = 1;
  }
  if (v68 >= 2)
  {
    sub_1B63F2F54(16, @"Error: cannot handle more than one lighting modifier", v71, v72, v73, v74, v75, v76, v594);
    uint64_t v68 = 1;
  }
  if (v69 >= 2)
  {
    sub_1B63F2F54(16, @"Error: cannot handle more than one lighting modifier", v71, v72, v73, v74, v75, v76, v594);
    uint64_t v69 = 1;
  }
  uint64_t v623 = (uint64_t)v5;
  if (v70 >= 2)
  {
    sub_1B63F2F54(16, @"Error: cannot handle more than one lighting modifier", v71, v72, v73, v74, v75, v76, v594);
    uint64_t v70 = 1;
  }
  sub_1B644CA88(v625, (uint64_t)v660, v68, v72, v73, v74, v75, v76);
  sub_1B644CA88(v625, (uint64_t)v659, v69, v78, v79, v80, v81, v82);
  sub_1B644CA88(v625, (uint64_t)v658, v70, v83, v84, v85, v86, v87);
  sub_1B644CA88(v625, (uint64_t)&v634 + 8, v77, v88, v89, v90, v91, v92);
  sub_1B6405AF4((uint64_t)&v624, (uint64_t)v660, v68, v93, v94, v95, v96, v97);
  sub_1B6405AF4((uint64_t)&v624, (uint64_t)v659, v69, v98, v99, v100, v101, v102);
  sub_1B6405AF4((uint64_t)&v624, (uint64_t)v658, v70, v103, v104, v105, v106, v107);
  sub_1B6405AF4((uint64_t)&v624, (uint64_t)&v634 + 8, v77, v108, v109, v110, v111, v112);
  id v113 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sub_1B6405A5C((uint64_t)v113, (const char *)v660, v68, v114, v115, v116, v117, v118);
  sub_1B6405A5C((uint64_t)v113, (const char *)v659, v69, v119, v120, v121, v122, v123);
  sub_1B6405A5C((uint64_t)v113, (const char *)v658, v70, v124, v125, v126, v127, v128);
  sub_1B6405A5C((uint64_t)v113, (const char *)&v634 + 8, v77, v129, v130, v131, v132, v133);
  v642[0] = MEMORY[0x1E4F143A8];
  v642[1] = 3221225472;
  v642[2] = sub_1B64092A4;
  v642[3] = &unk_1E6141600;
  v642[4] = &v624;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v113, v134, (uint64_t)v642, v135);

  sub_1B644CB08((uint64_t *)v658, v70, v136, v137, v138, v139, v140, v141);
  sub_1B644CB08((uint64_t *)v659, v69, v142, v143, v144, v145, v146, v147);
  sub_1B644CB08((uint64_t *)v660, v68, v148, v149, v150, v151, v152, v153);
  sub_1B644CB08((uint64_t *)&v634 + 1, v77, v154, v155, v156, v157, v158, v159);
  if (v68)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v160, (uint64_t)&stru_1F0FCDBB0, @"USE_GEOMETRY_MODIFIER");
    sub_1B64092D8((uint64_t)&v624, 0, (uint64_t *)v660, v162, v163, v164, v165, v166);
  }
  if (v69)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v160, (uint64_t)&stru_1F0FCDBB0, @"USE_SURFACE_MODIFIER");
    sub_1B64092D8((uint64_t)&v624, 1, (uint64_t *)v659, v167, v168, v169, v170, v171);
  }
  if (v70)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v160, (uint64_t)&stru_1F0FCDBB0, @"USE_FRAGMENT_MODIFIER");
    sub_1B64092D8((uint64_t)&v624, 2, (uint64_t *)v658, v172, v173, v174, v175, v176);
  }
  __int16 v177 = v42;
  if (v77)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v160, (uint64_t)&stru_1F0FCDBB0, @"USE_LIGHT_MODIFIER");
    sub_1B64092D8((uint64_t)&v624, 3, (uint64_t *)&v634 + 1, v178, v179, v180, v181, v182);
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v160, @"USE_GEOMETRY_MODIFIER", v161);
    objc_msgSend_addObject_((void *)v626, v183, @"USE_SURFACE_MODIFIER", v184);
    objc_msgSend_addObject_((void *)v626, v185, @"USE_FRAGMENT_MODIFIER", v186);
    objc_msgSend_addObject_((void *)v626, v187, @"USE_LIGHT_MODIFIER", v188);
    v641[0] = MEMORY[0x1E4F143A8];
    v641[1] = 3221225472;
    v641[2] = sub_1B64093FC;
    v641[3] = &unk_1E6141620;
    v641[4] = &v624;
    sub_1B6603DA0((uint64_t)v641);
    CFDictionaryRef v189 = (const __CFDictionary *)sub_1B662DD38();
    v640[0] = MEMORY[0x1E4F143A8];
    v640[1] = 3221225472;
    v640[2] = sub_1B640940C;
    v640[3] = &unk_1E6141640;
    v640[4] = &v624;
    sub_1B63CCA7C(v189, (uint64_t)v640);
  }
  if (objc_msgSend_objectForKeyedSubscript_(v625, v160, @"USE_MODIFIER_FRAMEBUFFER_COLOR0", v161))
  {
    if (sub_1B6447A04((uint64_t)a4, 2048)) {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v192, (uint64_t)&unk_1F103BB10, @"CFX_SUPPORTS_PROGRAMMABLE_BLENDING");
    }
    else {
      sub_1B63F2F54(16, @"Error: Invalid shader modifier: programmable blending is not supported by this device", v193, v194, v195, v196, v197, v198, v594);
    }
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v190, @"USE_MODIFIER_FRAMEBUFFER_COLOR0", v191);
    objc_msgSend_addObject_((void *)v626, v199, @"CFX_SUPPORTS_PROGRAMMABLE_BLENDING", v200);
  }
  int v201 = v41 & 0xF;
  if (objc_msgSend_objectForKeyedSubscript_(v625, v190, @"USE_CLIP_DISTANCE3", v191))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v202, @"4", @"USE_CLIP_DISTANCE_COUNT");
    uint64_t v206 = 4;
LABEL_65:
    uint64_t v614 = v206;
    goto LABEL_66;
  }
  if (objc_msgSend_objectForKeyedSubscript_(v625, v202, @"USE_CLIP_DISTANCE2", v203))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v207, @"3", @"USE_CLIP_DISTANCE_COUNT");
    uint64_t v206 = 3;
    goto LABEL_65;
  }
  if (objc_msgSend_objectForKeyedSubscript_(v625, v207, @"USE_CLIP_DISTANCE1", v208))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v209, @"2", @"USE_CLIP_DISTANCE_COUNT");
    uint64_t v206 = 2;
    goto LABEL_65;
  }
  if (objc_msgSend_objectForKeyedSubscript_(v625, v209, @"USE_CLIP_DISTANCE0", v210))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v204, @"1", @"USE_CLIP_DISTANCE_COUNT");
    uint64_t v206 = 1;
    goto LABEL_65;
  }
  uint64_t v614 = 0;
LABEL_66:
  if (v201 == 3)
  {
    int v211 = 0;
    int v212 = 1;
    BYTE11(v637) = 1;
  }
  else
  {
    int v211 = 0;
    if ((v177 & 0xD) != 0) {
      int v212 = v619;
    }
    else {
      int v212 = 0;
    }
    if (v201 == 1 && v212)
    {
      int v211 = sub_1B659D870((uint64_t)v5, 2u);
      int v212 = 1;
    }
  }
  if (objc_msgSend_objectForKeyedSubscript_(v625, v204, @"USE_SPECULAR", v205)) {
    int v214 = 1;
  }
  else {
    int v214 = v211;
  }
  if (v214 == 1)
  {
    if (BYTE11(v637)) {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v213, (uint64_t)&unk_1F103BB10, @"USE_VIEW");
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v213, (uint64_t)&unk_1F103BAF8, @"USE_VIEW");
    }
    if (BYTE11(v637)) {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v215, (uint64_t)&unk_1F103BB10, @"USE_SHININESS");
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v215, (uint64_t)&unk_1F103BAF8, @"USE_SHININESS");
    }
  }
  BYTE10(v637) = 0;
  WORD4(v637) = 0;
  HIDWORD(v637) = 0;
  BYTE8(v639) = 1;
  int v222 = sub_1B659D8B0((uint64_t)v5);
  v223 = @"USE_CONSTANT";
  if (!v201 || v201 == 2) {
    goto LABEL_88;
  }
  if (v201 == 4)
  {
    v223 = @"USE_SHADOWONLY";
LABEL_88:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v216, (uint64_t)&stru_1F0FCDBB0, (uint64_t)v223);
  }
  unsigned int v612 = v201;
  int v613 = v212;
  if (!v212) {
    goto LABEL_183;
  }
  if (*((void *)&v634 + 1))
  {
    uint64_t v224 = sub_1B6603BD8(*((uint64_t *)&v634 + 1), (uint64_t)v216, v217, (uint64_t)v223, v218, v219, v220, v221);
    if (v224) {
      objc_msgSend_appendString_((void *)v634, v216, v224, v225);
    }
  }
  if (v201 == 3)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v216, (uint64_t)&stru_1F0FCDBB0, @"USE_PBR");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v226, (uint64_t)&unk_1F103BB10, @"USE_VIEW");
  }
  unsigned int v227 = sub_1B659D8E0((uint64_t)v5);
  unsigned int v228 = sub_1B659D838((uint64_t)v5);
  if (!v228) {
    goto LABEL_173;
  }
  int v602 = v222;
  int v603 = v214;
  __int16 v604 = v177;
  uint64_t v230 = 0;
  uint64_t v231 = v228;
  unsigned int v620 = v227;
  do
  {
    if ((v227 >> v230))
    {
      unsigned int v232 = sub_1B659D840((uint64_t)v624, (unsigned __int16)v230);
      unint64_t v233 = v232;
      BOOL v234 = (v232 & 6) == 2 && (v232 >> 3) & 1;
      uint64_t v235 = (v232 >> 15) & 7;
      BOOL v236 = v235 > 1 && (v232 >> 19) & 1;
      int v237 = v232 & 7;
      if ((v232 & 7) != 0)
      {
        unsigned int v238 = v232;
        sub_1B659D84C((uint64_t)v624);
        if (v234)
        {
          if (BYTE11(v637)) {
            uint64_t v241 = 184;
          }
          else {
            uint64_t v241 = 176;
          }
          objc_msgSend_appendFormat_(*(__CFXProgramHashCode **)((char *)&v624 + v241), v239, @", texture2d<half> u_goboTexture%d\n", v240, v230);
          uint64_t v594 = v230;
          objc_msgSend_appendFormat_(*(__CFXProgramHashCode **)((char *)&v624 + v241), v242, @", sampler u_goboTexture%dSampler\n", v243);
        }
        uint64_t v244 = (v233 >> 7) & 7;
        if (v237 == 2)
        {
          char v245 = (v233 & 0x10) != 0 || v234;
        }
        else
        {
          if (v237 == 5)
          {
            if (v244 == 4) {
              objc_msgSend_appendFormat_(*((void **)&v636 + 1), v239, @", device packed_float2* u_areaPolygonPositions%d\n", v240, v230);
            }
          }
          else if (v237 == 6)
          {
            objc_msgSend_appendFormat_(*((void **)&v636 + 1), v239, @", texture2d<half> u_iesTexture%d\n", v240, v230);
          }
          char v245 = 1;
        }
        uint64_t v246 = (v238 >> 10) & 0x1F;
        BYTE8(v637) |= v245;
        BYTE9(v637) |= (v233 & 0x10) >> 4;
        int v247 = HIDWORD(v637);
        if (HIDWORD(v637) <= v246) {
          int v247 = v246;
        }
        HIDWORD(v637) = v247;
        if (sub_1B659D964((uint64_t)v624))
        {
          int v250 = sub_1B659D970((uint64_t)v624);
          if (v250 == 1)
          {
            if (BYTE11(v637)) {
              uint64_t v258 = objc_msgSend_stringWithFormat_(NSString, v251, @"USE_MULTIPLE_RENDERING * %d + in.sliceIndex", v253, v230);
            }
            else {
              uint64_t v258 = objc_msgSend_stringWithFormat_(NSString, v251, @"USE_MULTIPLE_RENDERING * %d + out.sliceIndex", v253, v230);
            }
          }
          else if (v250 == 2)
          {
            uint64_t v258 = objc_msgSend_stringWithFormat_(NSString, v251, @"USE_MULTIPLE_RENDERING * %d + amplificationID", v253, v230);
          }
          else
          {
            sub_1B63F2F54(16, @"Unreachable code: Multiple rendering is lacking a multiple output vertex streams generator", v252, v253, v254, v255, v256, v257, v594);
            uint64_t v258 = 0;
          }
        }
        else
        {
          uint64_t v258 = objc_msgSend_stringWithFormat_(NSString, v248, @"%d", v249, v230);
        }
        switch(v237)
        {
          case 1:
            if ((v233 & 0x10) != 0 && BYTE8(v639)) {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_omni(vfx_lights[%@], %s, u_shadowKernel, %d);\n",
            }
                v261,
                v258,
                "u_shadowTexture",
                v246,
                v597,
                v600,
                v601);
            else {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_omni(vfx_lights[%@]);\n",
            }
                v261,
                v258,
                v595,
                v596,
                v597,
                v600,
                v601);
            goto LABEL_158;
          case 2:
            if (v234)
            {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_directional(vfx_lights[%@], u_goboTexture%d, u_goboTexture%dSampler);\n",
                v261,
                v258,
                v230,
                v230,
                v597,
                v600,
                v601);
LABEL_158:
              unsigned int v227 = v620;
              break;
            }
            if ((v233 & 0x10) == 0)
            {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_directional(vfx_lights[%@]);\n",
                v261,
                v258,
                v595,
                v596,
                v597,
                v600,
                v601);
              goto LABEL_158;
            }
            if (v235 >= 2)
            {
              v266 = "true";
              if ((v233 & 0x40000) != 0) {
                v267 = "true";
              }
              else {
                v267 = "false";
              }
              if (!v236) {
                v266 = "false";
              }
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_directional(vfx_lights[%@], %s, %d, %s, u_shadowKernel, %d, %s);\n",
                v261,
                v258,
                "u_shadowTexture",
                v235,
                v267,
                v246,
                v266);
              goto LABEL_158;
            }
            unsigned int v227 = v620;
            if (v246 < 2)
            {
              v595 = "u_shadowTexture";
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_directional(vfx_lights[%@], %s);\n",
                v261,
                v258);
            }
            else
            {
              v595 = "u_shadowTexture";
              uint64_t v596 = v246;
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_directional(vfx_lights[%@], %s, u_shadowKernel, %d);\n",
                v261,
                v258);
            }
            break;
          case 3:
            if (v234)
            {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_spot(vfx_lights[%@], u_goboTexture%d, u_goboTexture%dSampler);\n",
                v261,
                v258,
                v230,
                v230,
                v597,
                v600,
                v601);
            }
            else if ((v233 & 0x10) != 0)
            {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_spot(vfx_lights[%@], %s, u_shadowKernel, %d);\n",
                v261,
                v258,
                "u_shadowTexture",
                v246,
                v597,
                v600,
                v601);
            }
            else
            {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_spot(vfx_lights[%@]);\n",
                v261,
                v258,
                v595,
                v596,
                v597,
                v600,
                v601);
            }
            goto LABEL_158;
          case 5:
            unsigned int v227 = v620;
            switch((int)v244)
            {
              case 0:
                objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_area_line(vfx_lights[%@], u_areaLightBakedDataTexture);\n",
                  v261,
                  v258);
                break;
              case 1:
                objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_area_rectangle(vfx_lights[%@], u_areaLightBakedDataTexture);\n",
                  v261,
                  v258);
                break;
              case 2:
                objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_area_ellipse(vfx_lights[%@], u_areaLightBakedDataTexture);\n",
                  v261,
                  v258);
                break;
              case 3:
                objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_area_ellipsoid(vfx_lights[%@], u_areaLightBakedDataTexture);\n",
                  v261,
                  v258);
                break;
              case 4:
                v595 = (const char *)v230;
                objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_area_polygon(vfx_lights[%@], u_areaLightBakedDataTexture, u_areaPolygonPositions%d);\n",
                  v261,
                  v258);
                break;
              default:
                goto LABEL_159;
            }
            break;
          case 6:
            if ((v233 & 0x10) != 0) {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_ies(vfx_lights[%@], u_iesTexture%d, %s, u_shadowKernel, %d);\n",
            }
                v261,
                v258,
                v230,
                "u_shadowTexture",
                v246,
                v600,
                v601);
            else {
              objc_msgSend_appendFormat_(*((void **)&v633 + 1), v259, @"\t_lightingContribution.add_ies(vfx_lights[%@], u_iesTexture%d);\n",
            }
                v261,
                v258,
                v230,
                v596,
                v597,
                v600,
                v601);
            goto LABEL_158;
          default:
            sub_1B63F2F54(17, @"Assertion '%s' failed. Infinite lights can only be dir or unranged omni", v260, v261, v262, v263, v264, v265, (uint64_t)"0");
            goto LABEL_158;
        }
      }
    }
LABEL_159:
    ++v230;
  }
  while (v231 != v230);
  uint64_t v268 = 0;
  __int16 v67 = v618;
  __int16 v177 = v604;
  int v222 = v602;
  int v214 = v603;
  while ((sub_1B659D840((uint64_t)v624, (unsigned __int16)v268) & 0x10) == 0)
  {
    if (v231 == ++v268) {
      goto LABEL_173;
    }
  }
  objc_msgSend_appendFormat_(*((void **)&v636 + 1), v229, @", depth2d<float> u_shadowTexture\n", v269);
LABEL_173:
  objc_msgSend_setObject_forKeyedSubscript_(v625, v229, @"1", @"CFX_USE_ATLAS_FOR_SHADOW_MAP");
  objc_msgSend_setObject_forKeyedSubscript_(v625, v270, @"uchar", @"CFXLightIndexType");
  objc_msgSend_setObject_forKeyedSubscript_(v625, v271, (uint64_t)&stru_1F0FCDBB0, @"CFX_USE_TEXTURE_FOR_LIGHT_INDICES");
  uint64_t v5 = (__CFXProgramHashCode *)v623;
  int v201 = v612;
  int v212 = v613;
  if (sub_1B659D8C8(v623))
  {
    if (sub_1B6447A04((uint64_t)a4, 256)) {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v273, (uint64_t)&stru_1F0FCDBB0, @"CFX_SUPPORT_CUBE_ARRAY");
    }
    objc_msgSend_setObject_forKeyedSubscript_(v625, v273, (uint64_t)&stru_1F0FCDBB0, @"CFX_USE_REFLECTION_PROBES");
  }
  if (*((void *)&v634 + 1))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v272, @"VFXShadingModelCustom", @"LIGHTING_MODEL");
  }
  else
  {
    v274 = sub_1B647559C(v612);
    objc_msgSend_setObject_forKeyedSubscript_(v625, v275, (uint64_t)v274, @"LIGHTING_MODEL");
  }
  if ((sub_1B659D8BC(v623) & 1) != 0 || sub_1B659D8C8(v623))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v216, (uint64_t)&stru_1F0FCDBB0, @"USE_CLUSTERED_LIGHTING");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v276, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
  }
LABEL_183:
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v216, @"USE_PBR", (uint64_t)v223);
    objc_msgSend_addObject_((void *)v626, v277, @"USE_SHADOWONLY", v278);
    objc_msgSend_addObject_((void *)v626, v279, @"CFX_USE_TEXTURE_FOR_LIGHT_INDICES", v280);
    objc_msgSend_addObject_((void *)v626, v281, @"CFX_SUPPORT_CUBE_ARRAY", v282);
    objc_msgSend_addObject_((void *)v626, v283, @"CFX_USE_REFLECTION_PROBES", v284);
    objc_msgSend_addObject_((void *)v626, v285, @"LIGHTING_MODEL", v286);
    objc_msgSend_addObject_((void *)v626, v287, @"USE_CLUSTERED_LIGHTING", v288);
  }
  if (v201 == 2 && (v177 & 0x280) != 0) {
    BYTE11(v637) = 1;
  }
  if (sub_1B659D924((uint64_t)v5))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v289, (uint64_t)&stru_1F0FCDBB0, @"USE_FOG");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v290, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
  }
  if ((v212 & ((v67 & 8) >> 3)) == 1)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v289, (uint64_t)&stru_1F0FCDBB0, @"USE_SSAO");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v291, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
  }
  if (sub_1B659D870((uint64_t)v5, 0x12u)
    && sub_1B659D870((uint64_t)v5, 0x13u)
    && sub_1B659D870((uint64_t)v5, 3u))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v292, (uint64_t)&stru_1F0FCDBB0, @"USE_FRESNEL");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v294, (uint64_t)&unk_1F103BB10, @"USE_VIEW");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v295, (uint64_t)&unk_1F103BB10, @"USE_NORMAL");
  }
  if ((v212 & ((v177 & 0x40) != 0)) == 1) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v292, (uint64_t)&stru_1F0FCDBB0, @"AVOID_OVERLIGHTING");
  }
  if (v222) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v292, (uint64_t)&stru_1F0FCDBB0, @"USE_AMBIENT_LIGHTING");
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v292, @"USE_FOG", v293);
    objc_msgSend_addObject_((void *)v626, v296, @"USE_SSAO", v297);
    objc_msgSend_addObject_((void *)v626, v298, @"USE_FRESNEL", v299);
    objc_msgSend_addObject_((void *)v626, v300, @"AVOID_OVERLIGHTING", v301);
    objc_msgSend_addObject_((void *)v626, v302, @"USE_AMBIENT_LIGHTING", v303);
  }
  if (v212)
  {
    uint64_t v304 = sub_1B659D8D4((uint64_t)v5);
    if (v304)
    {
      uint64_t v307 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v305, v304, v306);
      objc_msgSend_setObject_forKeyedSubscript_(v625, v308, v307, @"USE_PROBES_LIGHTING");
    }
    objc_msgSend_setObject_forKeyedSubscript_(v625, v305, (uint64_t)&stru_1F0FCDBB0, @"USE_LIGHTING");
    if (BYTE11(v637))
    {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v309, (uint64_t)&stru_1F0FCDBB0, @"USE_PER_PIXEL_LIGHTING");
      objc_msgSend_setObject_forKeyedSubscript_(v625, v310, (uint64_t)&unk_1F103BB10, @"USE_NORMAL");
      if (((BYTE8(v637) == 0) & ~v214) == 0) {
        objc_msgSend_setObject_forKeyedSubscript_(v625, v292, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
      }
      if (BYTE10(v637)) {
        objc_msgSend_setObject_forKeyedSubscript_(v625, v292, (uint64_t)&unk_1F103BB10, @"USE_MODULATE");
      }
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v309, (uint64_t)&stru_1F0FCDBB0, @"USE_PER_VERTEX_LIGHTING");
      if (!objc_msgSend_objectForKeyedSubscript_(v625, v311, @"USE_NORMAL", v312)) {
        objc_msgSend_setObject_forKeyedSubscript_(v625, v313, (uint64_t)&unk_1F103BAF8, @"USE_NORMAL");
      }
      if (!objc_msgSend_objectForKeyedSubscript_(v625, v313, @"USE_VIEW", v314)) {
        objc_msgSend_setObject_forKeyedSubscript_(v625, v315, (uint64_t)&unk_1F103BAF8, @"USE_VIEW");
      }
      if (!objc_msgSend_objectForKeyedSubscript_(v625, v315, @"USE_POSITION", v316)) {
        objc_msgSend_setObject_forKeyedSubscript_(v625, v292, (uint64_t)&unk_1F103BAF8, @"USE_POSITION");
      }
    }
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v292, @"USE_PROBES_LIGHTING", v293);
    objc_msgSend_addObject_((void *)v626, v317, @"USE_LIGHTING", v318);
    objc_msgSend_addObject_((void *)v626, v319, @"USE_PER_PIXEL_LIGHTING", v320);
    objc_msgSend_addObject_((void *)v626, v321, @"USE_PER_VERTEX_LIGHTING", v322);
  }
  if (sub_1B659D918((uint64_t)v5)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v323, (uint64_t)&stru_1F0FCDBB0, @"HAS_NORMAL");
  }
  if ((v615 & 2) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v323, (uint64_t)&stru_1F0FCDBB0, @"HAS_VERTEX_COLOR");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v324, (uint64_t)&stru_1F0FCDBB0, @"USE_VERTEX_COLOR");
  }
  if (sub_1B659D93C((uint64_t)v5)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v325, (uint64_t)&stru_1F0FCDBB0, @"USE_INSTANCING");
  }
  if (sub_1B659D948((uint64_t)v5))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v328, (uint64_t)&stru_1F0FCDBB0, @"USE_POINT_RENDERING");
    if ((v67 & 0x20) != 0) {
      goto LABEL_226;
    }
LABEL_230:
    if ((v67 & 4) == 0) {
      goto LABEL_231;
    }
LABEL_227:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"USE_LASTFRAMETRANSFORM");
    if ((v67 & 0x800) == 0) {
      goto LABEL_233;
    }
LABEL_232:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"USE_MOTIONBLUR");
    goto LABEL_233;
  }
  if ((v67 & 0x20) == 0) {
    goto LABEL_230;
  }
LABEL_226:
  objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"DISABLE_SPECULAR");
  if ((v67 & 4) != 0) {
    goto LABEL_227;
  }
LABEL_231:
  if ((v67 & 0x800) != 0) {
    goto LABEL_232;
  }
LABEL_233:
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v326, @"HAS_NORMAL", v327);
    objc_msgSend_addObject_((void *)v626, v329, @"HAS_VERTEX_COLOR", v330);
    objc_msgSend_addObject_((void *)v626, v331, @"USE_VERTEX_COLOR", v332);
    objc_msgSend_addObject_((void *)v626, v333, @"USE_INSTANCING", v334);
    objc_msgSend_addObject_((void *)v626, v335, @"USE_POINT_RENDERING", v336);
    objc_msgSend_addObject_((void *)v626, v337, @"DISABLE_LINEAR_RENDERING", v338);
    objc_msgSend_addObject_((void *)v626, v339, @"DISABLE_SPECULAR", v340);
    objc_msgSend_addObject_((void *)v626, v341, @"USE_SKINNING", v342);
    objc_msgSend_addObject_((void *)v626, v343, @"USE_MOTIONBLUR", v344);
    objc_msgSend_addObject_((void *)v626, v345, @"USE_LASTFRAMETRANSFORM", v346);
  }
  if ((v67 & 0x40) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"USE_COLOR1_OUTPUT");
    if (v67) {
      goto LABEL_251;
    }
LABEL_237:
    if ((v67 & 2) == 0) {
      goto LABEL_238;
    }
LABEL_252:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"USE_REFLECTANCE_ROUGHNESS_OUTPUT");
    if ((v67 & 0x80) != 0) {
      goto LABEL_253;
    }
LABEL_239:
    if ((v67 & 0x10) == 0) {
      goto LABEL_240;
    }
LABEL_254:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"USE_OUTLINE");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v366, (uint64_t)&stru_1F0FCDBB0, @"USE_MODELTRANSFORM");
    if ((v67 & 0x200) != 0)
    {
LABEL_241:
      objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&unk_1F103BB10, @"USE_NORMAL");
      objc_msgSend_setObject_forKeyedSubscript_(v625, v347, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
      objc_msgSend_setObject_forKeyedSubscript_(v625, v348, (uint64_t)&stru_1F0FCDBB0, @"USE_MODELTRANSFORM");
      objc_msgSend_setObject_forKeyedSubscript_(v625, v349, (uint64_t)&stru_1F0FCDBB0, @"USE_GBUFFER_OUTPUT");
      objc_msgSend_setObject_forKeyedSubscript_(v625, v350, (uint64_t)&stru_1F0FCDBB0, @"USE_LASTFRAMETRANSFORM");
    }
  }
  else
  {
    if ((v67 & 1) == 0) {
      goto LABEL_237;
    }
LABEL_251:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&unk_1F103BB10, @"USE_NORMAL");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v365, (uint64_t)&stru_1F0FCDBB0, @"USE_NORMALS_OUTPUT");
    if ((v67 & 2) != 0) {
      goto LABEL_252;
    }
LABEL_238:
    if ((v67 & 0x80) == 0) {
      goto LABEL_239;
    }
LABEL_253:
    objc_msgSend_setObject_forKeyedSubscript_(v625, v326, (uint64_t)&stru_1F0FCDBB0, @"USE_RADIANCE_OUTPUT");
    if ((v67 & 0x10) != 0) {
      goto LABEL_254;
    }
LABEL_240:
    if ((v67 & 0x200) != 0) {
      goto LABEL_241;
    }
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v326, @"USE_COLOR1_OUTPUT", v327);
    objc_msgSend_addObject_((void *)v626, v351, @"USE_NORMALS_OUTPUT", v352);
    objc_msgSend_addObject_((void *)v626, v353, @"USE_REFLECTANCE_ROUGHNESS_OUTPUT", v354);
    objc_msgSend_addObject_((void *)v626, v355, @"USE_RADIANCE_OUTPUT", v356);
    objc_msgSend_addObject_((void *)v626, v357, @"USE_OUTLINE", v358);
    objc_msgSend_addObject_((void *)v626, v359, @"USE_GBUFFER_OUTPUT", v360);
  }
  if (sub_1B659D860((uint64_t)v5, 7u))
  {
    sub_1B6408490((uint64_t)&v624, 7u, 7, 1);
    objc_msgSend_setObject_forKeyedSubscript_(v625, v361, (uint64_t)&stru_1F0FCDBB0, @"USE_AMBIENTOCCLUSION_MAP");
  }
  sub_1B6408490((uint64_t)&v624, 1u, 1, 1);
  sub_1B6408490((uint64_t)&v624, 2u, 2, v214 | v605);
  sub_1B6408490((uint64_t)&v624, 8u, 8, 1);
  sub_1B6408490((uint64_t)&v624, 0, 0, 1);
  sub_1B6408490((uint64_t)&v624, 5u, 5, 1);
  sub_1B6408490((uint64_t)&v624, 6u, 6, v606);
  if (BYTE8(v626))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v362, (uint64_t)&unk_1F103BB10, @"USE_TANGENT");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v363, (uint64_t)&unk_1F103BB10, @"USE_BITANGENT");
  }
  sub_1B6408490((uint64_t)&v624, 9u, 9, v201 == 3);
  sub_1B6408490((uint64_t)&v624, 0xAu, 10, v201 == 3);
  if (v201 == 3) {
    int v364 = sub_1B659D870((uint64_t)v5, 0xBu);
  }
  else {
    int v364 = 0;
  }
  sub_1B6408490((uint64_t)&v624, 0xBu, 11, v364);
  sub_1B6408490((uint64_t)&v624, 0xCu, 12, v364);
  sub_1B6408490((uint64_t)&v624, 0xDu, 13, v364);
  if (BYTE8(v626))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v367, (uint64_t)&unk_1F103BB10, @"USE_TANGENT");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v368, (uint64_t)&unk_1F103BB10, @"USE_BITANGENT");
  }
  if (v201 == 3) {
    int v369 = sub_1B659D870((uint64_t)v5, 0xEu);
  }
  else {
    int v369 = 0;
  }
  sub_1B6408490((uint64_t)&v624, 0xEu, 14, v369);
  sub_1B6408490((uint64_t)&v624, 0xFu, 15, v369);
  sub_1B6408490((uint64_t)&v624, 3u, 3, 1);
  if (BYTE8(v626))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v370, (uint64_t)&unk_1F103BB10, @"USE_VIEW");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v371, (uint64_t)&unk_1F103BB10, @"USE_NORMAL");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v372, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
  }
  int v373 = sub_1B659D870((uint64_t)v5, 4u);
  sub_1B6408490((uint64_t)&v624, 4u, 4, v373);
  if (v201 == 3) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v374, (uint64_t)&stru_1F0FCDBB0, @"USE_PBR_TRANSPARENCY");
  }
  if ((v177 & 0x7800) == 0x1000 || (v177 & 0x20) != 0) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v374, (uint64_t)&stru_1F0FCDBB0, @"USE_DOUBLE_SIDED");
  }
  if ((v608 & 1) == 0) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v374, (uint64_t)&stru_1F0FCDBB0, @"USE_NODE_OPACITY");
  }
  if ((v607 & 0x200) != 0) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v374, (uint64_t)&stru_1F0FCDBB0, @"DIFFUSE_PREMULTIPLIED");
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v374, @"LOCK_AMBIENT_WITH_DIFFUSE", v375);
    objc_msgSend_addObject_((void *)v626, v376, @"USE_DOUBLE_SIDED", v377);
    objc_msgSend_addObject_((void *)v626, v378, @"USE_TRANSPARENT", v379);
    objc_msgSend_addObject_((void *)v626, v380, @"USE_PBR_TRANSPARENCY", v381);
    objc_msgSend_addObject_((void *)v626, v382, @"USE_PBR_LAMBERTIAN_REFLECTION", v383);
    objc_msgSend_addObject_((void *)v626, v384, @"USE_NODE_OPACITY", v385);
    objc_msgSend_addObject_((void *)v626, v386, @"DIFFUSE_PREMULTIPLIED", v387);
  }
  uint64_t v388 = sub_1B659DA6C((uint64_t)v5);
  if (v388 >= 1)
  {
    uint64_t v396 = v388;
    for (uint64_t i = 0; i != v396; ++i)
    {
      v398 = sub_1B659D9E8((uint64_t)v5, i, v390, v391, v392, v393, v394, v395);
      uint64_t v405 = sub_1B659DA2C((uint64_t)v5, i, v399, v400, v401, v402, v403, v404);
      if (v405 != -1)
      {
        uint64_t v406 = v405;
        objc_msgSend_appendFormat_((void *)v630, v389, @"    float2 %@Texcoord;\n", v391, v398);
        objc_msgSend_appendFormat_(*((void **)&v632 + 1), v407, @"    _surface.%@Texcoord = in.texcoord%d;\n",
          v408,
          v398,
          v406);
      }
    }
  }
  if (v609) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v389, (uint64_t)&unk_1F103BB10, @"USE_ALPHA_CUTOFF");
  }
  if ((void)v626) {
    objc_msgSend_addObject_((void *)v626, v389, @"USE_ALPHA_CUTOFF", v391);
  }
  uint64_t v409 = sub_1B659D97C((uint64_t)v624);
  if (v409)
  {
    uint64_t v417 = v409;
    if (v409 < 1)
    {
      uint64_t v419 = 0;
    }
    else
    {
      uint64_t v418 = 0;
      uint64_t v419 = 0;
      do
      {
        __int16 v420 = sub_1B659D990((uint64_t)v624, v418, v411, v412, v413, v414, v415, v416);
        objc_msgSend_appendFormat_(*((void **)&v630 + 1), v421, @"float2 texcoord%d;\n", v422, v418);
        if (HIBYTE(v420) == 255)
        {
          unsigned int v425 = v420;
          objc_msgSend_appendFormat_(*((void **)&v631 + 1), v423, @"out.texcoord%d = _geometry.texcoords[%d].xy;\n",
            v424,
            v418,
            v420,
            v596);
        }
        else
        {
          uint64_t v426 = v633;
          LODWORD(v633) = v633 + 1;
          unsigned int v425 = v420;
          objc_msgSend_appendFormat_(*((void **)&v631 + 1), v423, @"out.texcoord%d = (vfx_commonprofile.textureTransforms[%d] * float4(_geometry.texcoords[%d], 0., 1.)).xy;\n",
            v424,
            v418,
            v426,
            v420);
        }
        if (v425 <= 7) {
          objc_msgSend_setObject_forKeyedSubscript_(v625, v410, (uint64_t)&stru_1F0FCDBB0, (uint64_t)off_1E6141680[v425]);
        }
        if (v419 <= v425 + 1) {
          uint64_t v419 = v425 + 1;
        }
        ++v418;
      }
      while (v417 != v418);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v625, v410, (uint64_t)&stru_1F0FCDBB0, @"USE_TEXCOORD");
    int v201 = v612;
    int v212 = v613;
  }
  else
  {
    uint64_t v419 = 0;
  }
  if (v633)
  {
    uint64_t v427 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v410, v633, v412);
    objc_msgSend_setObject_forKeyedSubscript_(v625, v428, v427, @"TEXTURE_TRANSFORM_COUNT");
  }
  uint64_t v429 = objc_msgSend_numberWithLong_(NSNumber, v410, v419, v412);
  objc_msgSend_setObject_forKeyedSubscript_(v625, v430, v429, @"kVFXTexcoordCount");
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v431, @"USE_TEXCOORD", v432);
    objc_msgSend_addObject_((void *)v626, v433, @"TEXTURE_TRANSFORM_COUNT", v434);
    for (uint64_t j = 0; j != 8; ++j)
      objc_msgSend_addObject_((void *)v626, v435, (uint64_t)off_1E6141680[j], v436);
  }
  int v438 = sub_1B659D860(v623, 0x10u);
  sub_1B6408490((uint64_t)&v624, 0x10u, 16, v438);
  if (v438)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v439, (uint64_t)&unk_1F103BB10, @"USE_NORMAL");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v441, (uint64_t)&unk_1F103BB10, @"USE_TANGENT");
    objc_msgSend_setObject_forKeyedSubscript_(v625, v442, (uint64_t)&unk_1F103BB10, @"USE_BITANGENT");
  }
  v443 = objc_msgSend_objectForKeyedSubscript_(v625, v439, @"USE_VIEW", v440);
  if (objc_msgSend_intValue(v443, v444, v445, v446) == 2) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v447, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
  }
  if (objc_msgSend_objectForKeyedSubscript_(v625, v447, @"USE_NORMAL", v448)
    && !objc_msgSend_objectForKeyedSubscript_(v625, v449, @"HAS_NORMAL", v450))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v449, (uint64_t)&unk_1F103BB10, @"USE_POSITION");
  }
  v453 = @"USE_MODELVIEWTRANSFORM";
  if (!objc_msgSend_objectForKeyedSubscript_(v625, v449, @"USE_POSITION", v450)
    && !objc_msgSend_objectForKeyedSubscript_(v625, v451, @"USE_INSTANCING", v452))
  {
    v453 = @"USE_MODELVIEWPROJECTIONTRANSFORM";
  }
  objc_msgSend_setObject_forKeyedSubscript_(v625, v451, (uint64_t)&stru_1F0FCDBB0, (uint64_t)v453);
  if (objc_msgSend_objectForKeyedSubscript_(v625, v454, @"USE_NORMAL", v455)
    || objc_msgSend_objectForKeyedSubscript_(v625, v456, @"USE_TANGENT", v457)
    || objc_msgSend_objectForKeyedSubscript_(v625, v456, @"USE_BITANGENT", v458))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v456, (uint64_t)&stru_1F0FCDBB0, @"USE_MODELVIEWTRANSFORM");
  }
  if (objc_msgSend_length((void *)v627, v456, v459, v460)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v461, (uint64_t)&stru_1F0FCDBB0, @"USE_SHADER_MODIFIERS");
  }
  if (objc_msgSend_length((void *)v630, v461, v462, v463)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v464, (uint64_t)&stru_1F0FCDBB0, @"USE_SURFACE_EXTRA_DECL");
  }
  if (objc_msgSend_length((void *)v637, v464, v465, v466)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v467, (uint64_t)&stru_1F0FCDBB0, @"USE_EXTRA_VARYINGS");
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v467, @"USE_SHADER_MODIFIERS", v468);
    objc_msgSend_addObject_((void *)v626, v469, @"USE_SURFACE_EXTRA_DECL", v470);
    objc_msgSend_addObject_((void *)v626, v471, @"USE_EXTRA_VARYINGS", v472);
  }
  v473 = sub_1B6602C1C(@"vfx_metal");
  v474 = sub_1B6602C1C(@"vfx_util.h");
  if (v201 == 3) {
    v475 = (__CFString *)sub_1B6602C1C(@"CFX-PBR.metal");
  }
  else {
    v475 = &stru_1F0FCDBB0;
  }
  sub_1B6405C3C((void **)&v624, v616, v623);
  if (objc_msgSend_objectForKeyedSubscript_(v625, v476, @"HAS_NORMAL", v477)
    || objc_msgSend_objectForKeyedSubscript_(v625, v478, @"USE_OPENSUBDIV", v479))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v478, @"1", @"HAS_OR_GENERATES_NORMAL");
  }
  v482 = &stru_1F0FCDBB0;
  if (v616)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v478, (uint64_t)&stru_1F0FCDBB0, @"USE_TESSELLATION");
    v482 = (__CFString *)sub_1B6602C1C(@"vfx_tessellation.h");
    int v483 = (v615 >> 3) & 3;
    if (v483 == 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v478, (uint64_t)&stru_1F0FCDBB0, @"TESSELLATION_SMOOTHING_MODE_PN_TRIANGLE");
    }
    else if (v483 == 2)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v625, v478, (uint64_t)&stru_1F0FCDBB0, @"TESSELLATION_SMOOTHING_MODE_PHONG");
    }
  }
  if ((void)v626)
  {
    sub_1B65A2AA4((void *)v626, v478, v480, v481);
    objc_msgSend_addObject_((void *)v626, v484, @"HAS_OR_GENERATES_NORMAL", v485);
    objc_msgSend_addObject_((void *)v626, v486, @"USE_TESSELLATION", v487);
  }
  v657[0] = v630;
  v657[1] = v635;
  if (*((void *)&v629 + 1)) {
    v488 = (__CFString *)*((void *)&v629 + 1);
  }
  else {
    v488 = &stru_1F0FCDBB0;
  }
  v657[2] = v488;
  uint64_t v489 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v478, (uint64_t)v657, 3);
  uint64_t v491 = objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(self->_originalLightingSourceCode, v490, (uint64_t)self->_lightingInjectionPointRanges, v489);
  v643[0] = v473;
  v493 = self;
  v643[1] = v474;
  v643[2] = v475;
  v643[3] = v482;
  v643[4] = *((void *)&v630 + 1);
  v643[5] = v637;
  v643[6] = v627;
  v643[7] = v491;
  long long v644 = v638;
  uint64_t v645 = v639;
  uint64_t v646 = v636;
  if ((void)v628) {
    v494 = (__CFString *)v628;
  }
  else {
    v494 = &stru_1F0FCDBB0;
  }
  uint64_t v647 = v632;
  v648 = v494;
  if (BYTE11(v637)) {
    int v495 = v212 ^ 1;
  }
  else {
    int v495 = 1;
  }
  v496 = (__CFString *)*((void *)&v633 + 1);
  if ((v212 & (BYTE11(v637) == 0)) != 0) {
    v497 = (__CFString *)*((void *)&v633 + 1);
  }
  else {
    v497 = &stru_1F0FCDBB0;
  }
  v649 = v497;
  uint64_t v650 = *((void *)&v631 + 1);
  uint64_t v651 = *((void *)&v636 + 1);
  uint64_t v652 = *((void *)&v632 + 1);
  v498 = (__CFString *)*((void *)&v628 + 1);
  if (!*((void *)&v628 + 1)) {
    v498 = &stru_1F0FCDBB0;
  }
  v653 = v498;
  uint64_t v654 = *((void *)&v635 + 1);
  if (v495) {
    v496 = &stru_1F0FCDBB0;
  }
  if ((void)v629) {
    v499 = (__CFString *)v629;
  }
  else {
    v499 = &stru_1F0FCDBB0;
  }
  v655 = v496;
  v656 = v499;
  v500 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v492, (uint64_t)v643, 22);
  uint64_t v502 = objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(self->_originalSourceCode, v501, (uint64_t)self->_injectionPointRanges, (uint64_t)v500);
  uint64_t v504 = objc_msgSend_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount_(self, v503, v502, (uint64_t)v500, BYTE11(v637), v614);
  if (sub_1B64F53A4())
  {
    uint64_t v621 = v504;
    v508 = objc_msgSend_mutableCopy(v500, v505, v506, v507);
    uint64_t v512 = objc_msgSend_count(self->_injectionPointRanges, v509, v510, v511);
    if (v512)
    {
      uint64_t v515 = v512;
      uint64_t v516 = 0;
      while (1)
      {
        v517 = objc_msgSend_objectAtIndexedSubscript_(v493->_injectionPointRanges, v513, v516, v514);
        uint64_t v521 = objc_msgSend_rangeValue(v517, v518, v519, v520);
        v523 = (__CFString *)objc_msgSend_substringWithRange_(v493->_originalSourceCode, v522, v521, (uint64_t)v522);
        if (!objc_msgSend_hasPrefix_(v523, v524, @"#import", v525)) {
          break;
        }
        if ((objc_msgSend_containsString_(v523, v526, @"CFX-Lighting.metal", v528) & 1) == 0)
        {
          uint64_t v529 = objc_msgSend_objectAtIndexedSubscript_(v500, v513, v516, v514);
          v532 = NSString;
          v598 = v523;
          goto LABEL_367;
        }
LABEL_372:
        if (v515 == ++v516) {
          goto LABEL_373;
        }
      }
      if (objc_msgSend_length((void *)v639, v526, v527, v528)
        && objc_msgSend_containsString_(v523, v533, @"__OpenSubdivDeclShared__", v535))
      {
        uint64_t v529 = objc_msgSend_objectAtIndexedSubscript_(v500, v533, v516, v535);
        v532 = NSString;
        v598 = @"#generate \"__OpenSubdivDeclShared__.metal\"";
LABEL_367:
        uint64_t v536 = objc_msgSend_stringWithFormat_(v532, v530, @"%@%@\n%@%@\n%@", v531, @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v529, @"#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v598, @"#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n");
      }
      else
      {
        if (!objc_msgSend_length(*((void **)&v638 + 1), v533, v534, v535)
          || !objc_msgSend_containsString_(v523, v513, @"__OpenSubdivDeclPerPatchType__", v514))
        {
          goto LABEL_372;
        }
        uint64_t v538 = objc_msgSend_objectAtIndexedSubscript_(v500, v513, v516, v514);
        v539 = NSString;
        unsigned int v540 = sub_1B659D984(v623);
        uint64_t v599 = objc_msgSend_stringWithFormat_(v539, v541, @"#generate \"__OpenSubdivDeclShared__patchType%d.metal\"", v542, v540);
        v543 = v539;
        v493 = self;
        uint64_t v536 = objc_msgSend_stringWithFormat_(v543, v544, @"%@%@\n%@%@\n%@", v545, @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v538, @"#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v599, @"#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n");
      }
      objc_msgSend_setObject_atIndexedSubscript_(v508, v537, v536, v516);
      goto LABEL_372;
    }
LABEL_373:
    uint64_t v546 = objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(v493->_originalSourceCode, v513, (uint64_t)v493->_injectionPointRanges, (uint64_t)v508);
    v548 = (const void *)objc_msgSend_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount_(v493, v547, v546, (uint64_t)v508, BYTE11(v637), v614);

    uint64_t v504 = v621;
  }
  else
  {
    v548 = 0;
  }
  if (objc_msgSend_length((void *)v636, v505, v506, v507)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v549, (uint64_t)&stru_1F0FCDBB0, @"USE_VERTEX_EXTRA_ARGUMENTS");
  }
  if (objc_msgSend_length(*((void **)&v636 + 1), v549, v550, v551)) {
    objc_msgSend_setObject_forKeyedSubscript_(v625, v552, (uint64_t)&stru_1F0FCDBB0, @"USE_FRAGMENT_EXTRA_ARGUMENTS");
  }
  objc_msgSend_setObject_forKeyedSubscript_(v625, v552, (uint64_t)&unk_1F103BAF8, @"METAL");
  uint64_t v560 = sub_1B64469B8((uint64_t)a4, v553, v554, v555, v556, v557, v558, v559);
  if ((v618 & 0x400) != 0)
  {
    uint64_t v563 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v561, v560, v562);
    objc_msgSend_setObject_forKeyedSubscript_(v625, v564, v563, @"DEBUG_PIXEL");
  }
  if ((void)v626)
  {
    objc_msgSend_addObject_((void *)v626, v561, @"USE_VERTEX_EXTRA_ARGUMENTS", v562);
    objc_msgSend_addObject_((void *)v626, v565, @"USE_FRAGMENT_EXTRA_ARGUMENTS", v566);
    objc_msgSend_addObject_((void *)v626, v567, @"USE_ARGUMENT_BUFFERS", v568);
    objc_msgSend_addObject_((void *)v626, v569, @"USE_REVERSE_Z", v570);
    objc_msgSend_addObject_((void *)v626, v571, @"DEBUG_PIXEL", v572);
  }
  v573 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v561, 0, v562);
  objc_msgSend_appendString_(v573, v574, @"////////////////////////////////////////////////\n", v575);
  objc_msgSend_appendFormat_(v573, v576, @"// CommonProfile Shader v%d\n", v577, 2);
  v580 = (const void *)objc_msgSend_stringByAppendingString_(v573, v578, v504, v579);
  if (sub_1B64F53A4()) {
    v548 = (const void *)objc_msgSend_stringByAppendingString_(v573, v581, (uint64_t)v548, v582);
  }
  int v583 = 131074;
  if (v611 > 0x20002) {
    int v583 = v611;
  }
  if (v610) {
    int v584 = v583;
  }
  else {
    int v584 = v611;
  }
  v585 = (__CFXFXProgram *)sub_1B6450934(@"commonprofile_vert", @"commonprofile_frag", v580, v548, v625, (const void *)v626, v584, 0);
  v586 = (const void *)sub_1B659D890(v623);
  sub_1B64505EC((uint64_t)v585, v586, v587, v588, v589, v590, v591, v592);
  return v585;
}

- (id)splitInputOutputStructsIfNeededForSourceCode:(id)a3 generatedFromReplacementStrings:(id)a4 perPixelLighting:(BOOL)a5 clipDistanceCount:(unint64_t)a6
{
  v94[4] = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    BOOL v8 = a5;
    NSUInteger v9 = self->_commonProfileIORange.length + self->_commonProfileIORange.location;
    uint64_t v86 = 0;
    uint64_t v87 = &v86;
    uint64_t v88 = 0x3010000000;
    uint64_t v89 = "";
    _NSRange commonProfileIORange = self->_commonProfileIORange;
    injectionPointRanges = self->_injectionPointRanges;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = sub_1B6408C2C;
    v85[3] = &unk_1E61415E0;
    v85[4] = self;
    v85[5] = a4;
    v85[6] = &v86;
    v85[7] = v9;
    objc_msgSend_enumerateObjectsUsingBlock_(injectionPointRanges, a2, (uint64_t)v85, (uint64_t)a4);
    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v11, @"    float clipDistance [[clip_distance]] [%d];\n} commonprofile_io_vert;\n\n",
            v12,
            a6);
    uint64_t v15 = objc_msgSend_substringWithRange_(a3, v14, v87[4], v87[5]);
    uint64_t v19 = objc_msgSend_length(v15, v16, v17, v18);
    uint64_t v21 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v15, v20, v19 - 19, 19, v13);
    uint64_t v22 = v87[4];
    uint64_t v23 = v87[5];
    uint64_t v27 = objc_msgSend_length(a3, v24, v25, v26);
    uint64_t v28 = v23 + v22;
    uint64_t v30 = objc_msgSend_rangeOfString_options_range_(a3, v29, @"vertex commonprofile_io", 0, v23 + v22, v27 - (v23 + v22));
    uint64_t v32 = (uint64_t)v31;
    uint64_t v35 = objc_msgSend_length(a3, v31, v33, v34);
    uint64_t v40 = objc_msgSend_rangeOfString_options_range_(a3, v36, @"commonprofile_io out;",
            0,
            v30 + v32,
            v35 - (v30 + v32));
    char v41 = v37;
    if (v8)
    {
      uint64_t v42 = (uint64_t)v37;
      uint64_t v43 = objc_msgSend_length(a3, v37, v38, v39);
      uint64_t v45 = objc_msgSend_rangeOfString_options_range_(a3, v44, @"commonprofile_io out;",
              0,
              v28,
              v43 - v28);
      uint64_t v47 = (uint64_t)v46;
      v94[0] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v46, v87[4], 0);
      v94[1] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v48, v45, v47);
      v94[2] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v49, v30, v32);
      v94[3] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v50, v40, v42);
      uint64_t v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v51, (uint64_t)v94, 4);
      v93[0] = v21;
      v93[1] = @"commonprofile_io_vert out;";
      v93[2] = @"vertex commonprofile_io_vert";
      v93[3] = @"commonprofile_io_vert out;";
      uint64_t v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v53, (uint64_t)v93, 4);
    }
    else
    {
      uint64_t v56 = objc_msgSend_length(a3, v37, v38, v39);
      uint64_t v58 = objc_msgSend_rangeOfString_options_range_(a3, v57, @"commonprofile_io out;",
              0,
              v28,
              v56 - v28);
      uint64_t v60 = (uint64_t)v59;
      uint64_t v83 = v40;
      uint64_t v84 = (uint64_t)v41;
      uint64_t v63 = objc_msgSend_length(a3, v59, v61, v62);
      uint64_t v65 = objc_msgSend_rangeOfString_options_range_(a3, v64, @"commonprofile_io in;",
              0,
              v28,
              v63 - v28);
      uint64_t v67 = (uint64_t)v66;
      uint64_t v70 = objc_msgSend_length(a3, v66, v68, v69);
      uint64_t v72 = objc_msgSend_rangeOfString_options_range_(a3, v71, @"commonprofile_io io", 0, v28, v70 - v28);
      uint64_t v74 = (uint64_t)v73;
      v92[0] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v73, v87[4], 0);
      v92[1] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v75, v58, v60);
      v92[2] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v76, v65, v67);
      v92[3] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v77, v72, v74);
      v92[4] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v78, v30, v32);
      v92[5] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v79, v83, v84);
      uint64_t v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v80, (uint64_t)v92, 6);
      v91[0] = v21;
      v91[1] = @"commonprofile_io_vert out;";
      v91[2] = @"commonprofile_io_vert in;";
      v91[3] = @"commonprofile_io_vert io";
      v91[4] = @"vertex commonprofile_io_vert";
      v91[5] = @"commonprofile_io_vert out;";
      uint64_t v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v81, (uint64_t)v91, 6);
    }
    a3 = (id)objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(a3, v55, v52, v54);
    _Block_object_dispose(&v86, 8);
  }
  return a3;
}

- (void)collectShaderForProgram:(__CFXFXProgram *)a3 hashCode:(id)a4 newVertexFunctionName:(id)a5 newFragmentFunctionName:(id)a6 sourceCodeBlock:(id)a7 additionalFileBlock:(id)a8
{
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)sub_1B6450E4C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);
  uint64_t v149 = a3;
  uint64_t v19 = (void *)sub_1B6450E00((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_mutableCopy(v19, v24, v25, v26);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v27, v28, @"commonprofile_vert", (uint64_t)a5, 0, 0, v23);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v27, v29, @"commonprofile_frag", (uint64_t)a6, 0, 0, v23);
  uint64_t v33 = objc_msgSend_length(v27, v30, v31, v32);
  uint64_t v35 = objc_msgSend_rangeOfString_options_range_(v27, v34, @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, 0, v33);
  uint64_t v154 = v27;
  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v37 = v35;
    while (1)
    {
      uint64_t v38 = (uint64_t)&v36[v37];
      uint64_t v39 = objc_msgSend_rangeOfString_options_range_(v27, v36, @"#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, &v36[v37], v33 - (void)&v36[v37]);
      uint64_t v41 = (uint64_t)&v40[v39];
      uint64_t v42 = objc_msgSend_rangeOfString_options_range_(v27, v40, @"#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, &v40[v39], v33 - (void)&v40[v39]);
      uint64_t v153 = (uint64_t)v43;
      int v44 = objc_msgSend_substringWithRange_(v27, v43, v41, v42 - v41);
      if (objc_msgSend_hasPrefix_(v44, v45, @"#import", v46)) {
        break;
      }
      unsigned int v64 = &stru_1F0FCDBB0;
      if (objc_msgSend_hasPrefix_(v44, v47, @"#generate", v48))
      {
        uint64_t v68 = objc_msgSend_rangeOfString_(v44, v66, @"\"", v67);
        uint64_t v71 = objc_msgSend_substringFromIndex_(v44, v69, v68 + 1, v70);
        uint64_t v74 = objc_msgSend_rangeOfString_(v71, v72, @"\"", v73);
        uint64_t v77 = objc_msgSend_substringToIndex_(v71, v75, v74, v76);
        uint64_t v80 = objc_msgSend_stringWithFormat_(NSString, v78, @"_import/%@", v79, v77);
        unsigned int v64 = (__CFString *)objc_msgSend_stringWithFormat_(NSString, v81, @"#import \"%@\"", v82, v80);
        objc_msgSend_substringWithRange_(v154, v83, v38, v39 - v38);
        uint64_t v65 = (void (*)(void))*((void *)a8 + 2);
        goto LABEL_7;
      }
LABEL_8:
      objc_msgSend_replaceCharactersInRange_withString_(v154, v66, v42, v153, &stru_1F0FCDBB0);
      uint64_t v84 = v64;
      uint64_t v27 = v154;
      objc_msgSend_replaceCharactersInRange_withString_(v154, v85, v41, v42 - v41, v84);
      objc_msgSend_replaceCharactersInRange_withString_(v154, v86, v37, v41 - v37, &stru_1F0FCDBB0);
      uint64_t v33 = objc_msgSend_length(v154, v87, v88, v89);
      uint64_t v37 = objc_msgSend_rangeOfString_options_range_(v154, v90, @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, 0, v33);
      if (v37 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_9;
      }
    }
    uint64_t v49 = objc_msgSend_rangeOfString_(v44, v47, @"\"", v48);
    uint64_t v52 = objc_msgSend_substringFromIndex_(v44, v50, v49 + 1, v51);
    uint64_t v55 = objc_msgSend_rangeOfString_(v52, v53, @"\"", v54);
    uint64_t v58 = objc_msgSend_substringToIndex_(v52, v56, v55, v57);
    uint64_t v61 = objc_msgSend_stringWithFormat_(NSString, v59, @"_import/%@", v60, v58);
    unsigned int v64 = (__CFString *)objc_msgSend_stringWithFormat_(NSString, v62, @"#import \"%@\"", v63, v61);
    sub_1B6602C1C(v58);
    uint64_t v65 = (void (*)(void))*((void *)a8 + 2);
LABEL_7:
    v65();
    goto LABEL_8;
  }
LABEL_9:
  id v91 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_insertString_atIndex_(v27, v92, @"\n", 0);
  uint64_t v96 = objc_msgSend_allKeys(v11, v93, v94, v95);
  uint64_t v99 = objc_msgSend_sortedArrayUsingSelector_(v96, v97, (uint64_t)sel_compare_, v98);
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  uint64_t v103 = objc_msgSend_reverseObjectEnumerator(v99, v100, v101, v102);
  uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v159, (uint64_t)v164, 16);
  if (v105)
  {
    uint64_t v113 = v105;
    uint64_t v114 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v113; ++i)
      {
        if (*(void *)v160 != v114) {
          objc_enumerationMutation(v103);
        }
        uint64_t v116 = *(void *)(*((void *)&v159 + 1) + 8 * i);
        uint64_t v117 = objc_msgSend_objectForKeyedSubscript_(v11, v106, v116, v108);
        uint64_t v120 = objc_msgSend_stringWithFormat_(NSString, v118, @"#define %@ %@\n", v119, v116, v117);
        objc_msgSend_insertString_atIndex_(v154, v121, v120, 0);
        if (objc_msgSend_isEqual_(v117, v122, (uint64_t)&stru_1F0FCDBB0, v123)) {
          objc_msgSend_appendFormat_(v91, v124, @" -D%@", v125, v116, v148);
        }
        else {
          objc_msgSend_appendFormat_(v91, v124, @" -D%@=%@", v125, v116, v117);
        }
      }
      uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v106, (uint64_t)&v159, (uint64_t)v164, 16);
    }
    while (v113);
  }
  uint64_t v126 = (void *)sub_1B6450E98((uint64_t)v149, (uint64_t)v106, v107, v108, v109, v110, v111, v112);
  if (objc_msgSend_count(v126, v127, v128, v129))
  {
    uint64_t v133 = objc_msgSend_allObjects(v126, v130, v131, v132);
    uint64_t v136 = objc_msgSend_sortedArrayUsingSelector_(v133, v134, (uint64_t)sel_compare_, v135);
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    uint64_t v140 = objc_msgSend_reverseObjectEnumerator(v136, v137, v138, v139);
    uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v141, (uint64_t)&v155, (uint64_t)v163, 16);
    if (v142)
    {
      uint64_t v143 = v142;
      uint64_t v144 = *(void *)v156;
      do
      {
        for (uint64_t j = 0; j != v143; ++j)
        {
          if (*(void *)v156 != v144) {
            objc_enumerationMutation(v140);
          }
          uint64_t v146 = *(void *)(*((void *)&v155 + 1) + 8 * j);
          if (!objc_msgSend_objectForKeyedSubscript_(v11, v130, v146, v132)) {
            objc_msgSend_appendFormat_(v91, v130, @" -U%@", v132, v146);
          }
        }
        uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v130, (uint64_t)&v155, (uint64_t)v163, 16);
      }
      while (v143);
    }
  }
  uint64_t v147 = objc_msgSend_stringWithFormat_(NSString, v130, @"_unifdef/%@.h", v132, a4);
  (*((void (**)(id, id, uint64_t))a8 + 2))(a8, v91, v147);

  (*((void (**)(id, void *))a7 + 2))(a7, v154);
}

@end