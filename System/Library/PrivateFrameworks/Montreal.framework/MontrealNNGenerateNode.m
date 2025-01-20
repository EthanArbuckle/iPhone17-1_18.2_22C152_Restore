@interface MontrealNNGenerateNode
- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters;
- (MontrealNNGenerateNode)initWithParameters:(id *)a3 weightDataFormat:(unint64_t)a4;
- (MontrealNNModelNode)node;
- (id)dataFromWeights:(float *)a3 length:(unint64_t)a4;
- (unint64_t)generateNode:(id)a3 node:(id)a4 weightIter:(unint64_t)a5 inputs:(id)a6 outputs:(id)a7;
- (unint64_t)weightDataFormat;
- (unint64_t)weightIter;
- (void)setInput:(id)a3 inputIndex:(int64_t)a4;
- (void)setInputs:(id)a3;
@end

@implementation MontrealNNGenerateNode

- (MontrealNNGenerateNode)initWithParameters:(id *)a3 weightDataFormat:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MontrealNNGenerateNode;
  v6 = [(MontrealNNGenerateNode *)&v9 init];
  v7 = v6;
  if (v6)
  {
    memcpy(&v6->_parameters, a3, sizeof(v6->_parameters));
    v7->_weightDataFormat = a4;
  }
  return v7;
}

- (id)dataFromWeights:(float *)a3 length:(unint64_t)a4
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F1C9B8], sel_dataWithBytesNoCopy_length_freeWhenDone_, a3, 4 * a4);
}

- (unint64_t)generateNode:(id)a3 node:(id)a4 weightIter:(unint64_t)a5 inputs:(id)a6 outputs:(id)a7
{
  v220[1] = *MEMORY[0x1E4F143B8];
  id v197 = a3;
  id v193 = a4;
  id v195 = a6;
  id v196 = a7;
  self->_unint64_t weightIter = a5;
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2F012000000;
  v205 = sub_19E2FA1A8;
  v206 = nullsub_173;
  v207 = &unk_19E35E9F1;
  memcpy(v208, &self->_parameters, sizeof(v208));
  v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13, v14);
  v16 = sub_19E32BAB8(v203[12]);
  objc_msgSend_setObject_forKeyedSubscript_(v15, v17, (uint64_t)v16, (uint64_t)off_1E9457F90);

  v18 = sub_19E32BBB8(v203[11]);
  objc_msgSend_setObject_forKeyedSubscript_(v15, v19, (uint64_t)v18, (uint64_t)off_1E9457F98);

  v20 = sub_19E32BBB8(v203[10]);
  objc_msgSend_setObject_forKeyedSubscript_(v15, v21, (uint64_t)v20, (uint64_t)off_1E9457FA8);

  v25 = sub_19E32BDC0(v203[21], v22, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v15, v26, (uint64_t)v25, (uint64_t)off_1E9457FA0);

  v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28, v29);
  v198[0] = MEMORY[0x1E4F143A8];
  v198[1] = 3221225472;
  v198[2] = sub_19E2FA1BC;
  v198[3] = &unk_1E599D318;
  v201 = &v202;
  v198[4] = self;
  id v192 = v193;
  id v199 = v192;
  id v194 = v30;
  id v200 = v194;
  uint64_t v31 = MEMORY[0x19F3BC450](v198);
  v35 = (void (**)(void, void, void))v31;
  switch(v203[6])
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t, __CFString *))(v31 + 16))(v31, *((int *)v203 + 76) * (uint64_t)*((int *)v203 + 44), off_1E94581E8);
      int v89 = *((_DWORD *)v203 + 76);
      goto LABEL_8;
    case 1:
      int v91 = *((_DWORD *)v203 + 46);
      if (v91 <= 1) {
        int v91 = *((_DWORD *)v203 + 44);
      }
      uint64_t v92 = v91;
      (*(void (**)(uint64_t, void, __CFString *))(v31 + 16))(v31, v91, off_1E94581E8);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, v92, off_1E94581F0);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, v92, off_1E9458240);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, v92, off_1E9458248);
      break;
    case 2:
      (*(void (**)(uint64_t, uint64_t, __CFString *))(v31 + 16))(v31, *((int *)v203 + 76) * (uint64_t)*((int *)v203 + 44), off_1E94581E8);
      ((void (**)(void, void, __CFString *))v35)[2](v35, *((int *)v203 + 76), off_1E94581F0);
      if (v203[13] != 6) {
        break;
      }
      v191 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v93, v94, v95);
      LODWORD(v96) = *((_DWORD *)v203 + 108);
      v100 = objc_msgSend_numberWithFloat_(NSNumber, v97, v98, v99, v96);
      objc_msgSend_setObject_forKeyedSubscript_(v191, v101, (uint64_t)v100, (uint64_t)off_1E9457FE0);

      v105 = objc_msgSend_copy(v191, v102, v103, v104);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v106, (uint64_t)v105, (uint64_t)off_1E9457FC8);
      goto LABEL_28;
    case 4:
    case 23:
      v191 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v32, v33, v34);
      v219 = off_1E94581D0;
      v38 = objc_msgSend_numberWithInt_(NSNumber, v36, *((unsigned int *)v203 + 76), v37);
      v218 = v38;
      v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v39, (uint64_t)&v218, 1);
      v220[0] = v40;
      v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)v220, (uint64_t)&v219, 1);
      objc_msgSend_setObject_forKeyedSubscript_(v191, v43, (uint64_t)v42, (uint64_t)off_1E9457FC0);

      v216 = off_1E94581D0;
      v46 = objc_msgSend_numberWithInt_(NSNumber, v44, *((unsigned int *)v203 + 92), v45);
      v215 = v46;
      v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v47, (uint64_t)&v215, 1);
      v217 = v48;
      v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)&v217, (uint64_t)&v216, 1);
      objc_msgSend_setObject_forKeyedSubscript_(v191, v51, (uint64_t)v50, (uint64_t)off_1E9457FB8);

      v55 = objc_msgSend_copy(v191, v52, v53, v54);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v56, (uint64_t)v55, (uint64_t)off_1E9457FC8);

      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, *((int *)v203 + 76) * (uint64_t)*((int *)v203 + 92), off_1E94581E8);
      goto LABEL_29;
    case 5:
      v84 = (void (**)(void, uint64_t, __CFString *))(v31 + 16);
      int v85 = *((_DWORD *)v203 + 44);
      int v86 = *((_DWORD *)v203 + 76);
      if ((v203[21] & 0x20) != 0)
      {
        uint64_t v87 = 4 * v86 * (v86 + v85);
        v88 = &off_1E94581E8;
      }
      else
      {
        (*(void (**)(uint64_t, void, __CFString *))(v31 + 16))(v31, 4 * v85 * v86, off_1E94581E8);
        uint64_t v87 = (4 * *((_DWORD *)v203 + 76) * *((_DWORD *)v203 + 76));
        v88 = &off_1E94581F8;
      }
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, v87, *v88);
      uint64_t v107 = 4 * *((int *)v203 + 76);
      v108 = off_1E94581F0;
      v109 = *v84;
      if ((v203[21] & 0x80) == 0)
      {
        v109(v35, v107, off_1E94581F0);
        uint64_t v107 = 4 * *((int *)v203 + 76);
        v108 = off_1E9458200;
        v109 = *v84;
      }
      v109(v35, v107, v108);
      if (!v203[68]) {
        break;
      }
      int v110 = *((_DWORD *)v203 + 92);
      if (!v110) {
        break;
      }
      uint64_t v111 = v110;
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, *((int *)v203 + 76) * (uint64_t)v110, off_1E9458238);
      v191 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v112, v113, v114);
      v117 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v115, v111, v116);
      objc_msgSend_setObject_forKeyedSubscript_(v191, v118, (uint64_t)v117, (uint64_t)off_1E9457FE8);

      if (*((float *)v203 + 120) < 0.0)
      {
        float v122 = *((float *)v203 + 121);
        if (v122 > 0.0)
        {
          v123 = objc_msgSend_numberWithFloat_(NSNumber, v119, v120, v121);
          objc_msgSend_setObject_forKeyedSubscript_(v191, v124, (uint64_t)v123, (uint64_t)off_1E9457FF0);

          *(float *)&double v125 = v122;
          v129 = objc_msgSend_numberWithFloat_(NSNumber, v126, v127, v128, v125);
          objc_msgSend_setObject_forKeyedSubscript_(v191, v130, (uint64_t)v129, (uint64_t)off_1E9457FF8);
        }
      }
      v105 = objc_msgSend_copy(v191, v119, v120, v121);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v131, (uint64_t)v105, (uint64_t)off_1E9457FC8);
LABEL_28:

      goto LABEL_29;
    case 6:
      (*(void (**)(uint64_t, void, __CFString *))(v31 + 16))(v31, 4 * *((_DWORD *)v203 + 44) * *((_DWORD *)v203 + 76), off_1E94581E8);
      ((void (**)(void, void, __CFString *))v35)[2](v35, (4 * *((_DWORD *)v203 + 76) * *((_DWORD *)v203 + 76)), off_1E94581F8);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 4 * *((int *)v203 + 76), off_1E94581F0);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 4 * *((int *)v203 + 76), off_1E9458200);
      ((void (**)(void, void, __CFString *))v35)[2](v35, 4 * *((_DWORD *)v203 + 44) * *((_DWORD *)v203 + 76), off_1E9458208);
      ((void (**)(void, void, __CFString *))v35)[2](v35, (4 * *((_DWORD *)v203 + 76) * *((_DWORD *)v203 + 76)), off_1E9458218);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 4 * *((int *)v203 + 76), off_1E9458210);
      int v89 = 4 * *((_DWORD *)v203 + 76);
      goto LABEL_17;
    case 9:
      (*(void (**)(uint64_t, void, __CFString *))(v31 + 16))(v31, 3 * *((_DWORD *)v203 + 44) * *((_DWORD *)v203 + 76), off_1E94581E8);
      ((void (**)(void, void, __CFString *))v35)[2](v35, (3 * *((_DWORD *)v203 + 76) * *((_DWORD *)v203 + 76)), off_1E94581F8);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v203 + 76), off_1E94581F0);
      int v89 = 3 * *((_DWORD *)v203 + 76);
      v90 = &off_1E9458200;
      goto LABEL_18;
    case 10:
      (*(void (**)(uint64_t, void, __CFString *))(v31 + 16))(v31, 3 * *((_DWORD *)v203 + 44) * *((_DWORD *)v203 + 76), off_1E94581E8);
      ((void (**)(void, void, __CFString *))v35)[2](v35, (3 * *((_DWORD *)v203 + 76) * *((_DWORD *)v203 + 76)), off_1E94581F8);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v203 + 76), off_1E94581F0);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v203 + 76), off_1E9458200);
      ((void (**)(void, void, __CFString *))v35)[2](v35, 3 * *((_DWORD *)v203 + 44) * *((_DWORD *)v203 + 76), off_1E9458208);
      ((void (**)(void, void, __CFString *))v35)[2](v35, (3 * *((_DWORD *)v203 + 76) * *((_DWORD *)v203 + 76)), off_1E9458218);
      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v203 + 76), off_1E9458210);
      int v89 = 3 * *((_DWORD *)v203 + 76);
LABEL_17:
      v90 = &off_1E9458220;
      goto LABEL_18;
    case 11:
    case 12:
      v191 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v32, v33, v34);
      v213 = off_1E94581D0;
      v59 = objc_msgSend_numberWithInt_(NSNumber, v57, *((unsigned int *)v203 + 92), v58);
      v212[0] = v59;
      v62 = objc_msgSend_numberWithInt_(NSNumber, v60, *((unsigned int *)v203 + 93), v61);
      v212[1] = v62;
      v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v63, (uint64_t)v212, 2);
      v214 = v64;
      v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v65, (uint64_t)&v214, (uint64_t)&v213, 1);
      objc_msgSend_setObject_forKeyedSubscript_(v191, v67, (uint64_t)v66, (uint64_t)off_1E9457FD0);

      v210 = off_1E94581D0;
      v70 = objc_msgSend_numberWithInt_(NSNumber, v68, *((unsigned int *)v203 + 94), v69);
      v209[0] = v70;
      v73 = objc_msgSend_numberWithInt_(NSNumber, v71, *((unsigned int *)v203 + 95), v72);
      v209[1] = v73;
      v75 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v74, (uint64_t)v209, 2);
      v211 = v75;
      v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v76, (uint64_t)&v211, (uint64_t)&v210, 1);
      objc_msgSend_setObject_forKeyedSubscript_(v191, v78, (uint64_t)v77, (uint64_t)off_1E9457FD8);

      v82 = objc_msgSend_copy(v191, v79, v80, v81);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v83, (uint64_t)v82, (uint64_t)off_1E9457FC8);

      ((void (**)(void, uint64_t, __CFString *))v35)[2](v35, *((int *)v203 + 93) * (uint64_t)*((int *)v203 + 92) * *((int *)v203 + 46) * *((int *)v203 + 76), off_1E94581E8);
      ((void (**)(void, void, __CFString *))v35)[2](v35, *((int *)v203 + 76), off_1E94581F0);
LABEL_29:

      break;
    case 13:
      (*(void (**)(uint64_t, void, __CFString *))(v31 + 16))(v31, (2 * *((_DWORD *)v203 + 44) * *((_DWORD *)v203 + 44)), off_1E94581E8);
      int v89 = 2 * *((_DWORD *)v203 + 44);
LABEL_8:
      v90 = &off_1E94581F0;
LABEL_18:
      ((void (**)(void, void, __CFString *))v35)[2](v35, v89, *v90);
      break;
    default:
      break;
  }
  uint64_t v132 = arc4random_uniform(0x3E8u);
  v133 = NSString;
  v136 = objc_msgSend_numberWithInt_(NSNumber, v134, v132, v135);
  v139 = objc_msgSend_stringWithFormat_(v133, v137, @"Node_%@", v138, v136);

  v142 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v140, 8, v141);
  v143 = sub_19E32B7F0(v203[13]);
  objc_msgSend_addObject_(v142, v144, (uint64_t)v143, v145);

  v146 = sub_19E32B7F0(v203[14]);
  objc_msgSend_addObject_(v142, v147, (uint64_t)v146, v148);

  v149 = sub_19E32B7F0(v203[15]);
  objc_msgSend_addObject_(v142, v150, (uint64_t)v149, v151);

  v152 = sub_19E32B7F0(v203[16]);
  objc_msgSend_addObject_(v142, v153, (uint64_t)v152, v154);

  v155 = sub_19E32B7F0(v203[17]);
  objc_msgSend_addObject_(v142, v156, (uint64_t)v155, v157);

  v158 = sub_19E32B7F0(v203[18]);
  objc_msgSend_addObject_(v142, v159, (uint64_t)v158, v160);

  v161 = sub_19E32B7F0(v203[19]);
  objc_msgSend_addObject_(v142, v162, (uint64_t)v161, v163);

  v164 = sub_19E32B7F0(v203[20]);
  objc_msgSend_addObject_(v142, v165, (uint64_t)v164, v166);

  v167 = [MontrealNNModelNode alloc];
  if (v197) {
    uint64_t v168 = (uint64_t)v197;
  }
  else {
    uint64_t v168 = (uint64_t)v139;
  }
  v169 = sub_19E32B2B4(v203[6]);
  v173 = objc_msgSend_copy(v194, v170, v171, v172);
  v175 = (MontrealNNModelNode *)objc_msgSend_initWithName_nodeStr_activations_properties_weights_(v167, v174, v168, (uint64_t)v169, v142, v15, v173);
  node = self->_node;
  self->_node = v175;

  v180 = objc_msgSend_node(self, v177, v178, v179);
  objc_msgSend_setInputs_(v180, v181, (uint64_t)v195, v182);

  v186 = objc_msgSend_node(self, v183, v184, v185);
  objc_msgSend_setOutputs_(v186, v187, (uint64_t)v196, v188);

  unint64_t weightIter = self->_weightIter;
  _Block_object_dispose(&v202, 8);

  return weightIter;
}

- (void)setInputs:(id)a3
{
  id v10 = a3;
  v7 = objc_msgSend_node(self, v4, v5, v6);
  objc_msgSend_setInputs_(v7, v8, (uint64_t)v10, v9);
}

- (void)setInput:(id)a3 inputIndex:(int64_t)a4
{
  id v29 = a3;
  uint64_t v9 = objc_msgSend_node(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_inputs(v9, v10, v11, v12);
  v17 = objc_msgSend_mutableCopy(v13, v14, v15, v16);

  objc_msgSend_setObject_atIndexedSubscript_(v17, v18, (uint64_t)v29, a4);
  v22 = objc_msgSend_copy(v17, v19, v20, v21);
  v26 = objc_msgSend_node(self, v23, v24, v25);
  objc_msgSend_setInputs_(v26, v27, (uint64_t)v22, v28);
}

- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters
{
  objc_copyStruct(retstr, &self->_parameters, 704, 1, 0);
  return result;
}

- (unint64_t)weightIter
{
  return self->_weightIter;
}

- (MontrealNNModelNode)node
{
  return (MontrealNNModelNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)weightDataFormat
{
  return self->_weightDataFormat;
}

- (void).cxx_destruct
{
}

@end