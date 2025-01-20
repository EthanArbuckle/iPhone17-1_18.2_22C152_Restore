@interface MontrealNNModelNode
- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters;
- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)parametersSet;
- (MontrealNNModelNode)initWithDictionary:(id)a3 tensors:(id)a4 quantization:(id)a5 jsonDir:(id)a6;
- (MontrealNNModelNode)initWithName:(id)a3 nodeStr:(id)a4 activations:(id)a5 properties:(id)a6 weights:(id)a7;
- (MontrealNNModelQuantization)quantization;
- (NSArray)activations;
- (NSArray)inputs;
- (NSArray)inputsWithDimensions;
- (NSArray)outputs;
- (NSArray)outputsWithDimensions;
- (NSArray)weights;
- (NSDictionary)properties;
- (NSString)name;
- (NSString)nodeStr;
- (id)auditAndUpdateTensors:(id)a3 dimensionTensors:(id)a4;
- (id)checkForValidity;
- (id)createDataContainer;
- (id)jsonDescription;
- (unint64_t)hash;
- (void)description:(id)a3 indent:(id)a4;
- (void)generateJSONAtPath:(id)a3;
- (void)keepTensors:(id)a3;
- (void)setInputs:(id)a3;
- (void)setInputsWithDimensions:(id)a3;
- (void)setOutputs:(id)a3;
- (void)setOutputsWithDimensions:(id)a3;
- (void)setParameters:(id *)a3;
- (void)setParametersSet:(BOOL)a3;
@end

@implementation MontrealNNModelNode

- (id)checkForValidity
{
  v35[4] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_name(self, a2, v2, v3);
  v34[0] = v5;
  v34[1] = @"name";
  v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v34, 2);
  v35[0] = v7;
  v11 = objc_msgSend_nodeStr(self, v8, v9, v10);
  v33[0] = v11;
  v33[1] = @"nodeStr";
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v33, 2);
  v35[1] = v13;
  v17 = objc_msgSend_inputs(self, v14, v15, v16);
  v32[0] = v17;
  v32[1] = @"inputs";
  v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v32, 2);
  v35[2] = v19;
  v23 = objc_msgSend_outputs(self, v20, v21, v22);
  v31[0] = v23;
  v31[1] = @"outputs";
  v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v31, 2);
  v35[3] = v25;
  v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v35, 4);
  objc_msgSend_checkForValidity_(self, v28, (uint64_t)v27, v29);

  return self;
}

- (MontrealNNModelNode)initWithName:(id)a3 nodeStr:(id)a4 activations:(id)a5 properties:(id)a6 weights:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)MontrealNNModelNode;
  v18 = [(MontrealNNModelNode *)&v35 init];
  uint64_t v22 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v22->_nodeStr, a4);
    uint64_t v26 = objc_msgSend_copy(v15, v23, v24, v25);
    activations = v22->_activations;
    v22->_activations = (NSArray *)v26;

    objc_storeStrong((id *)&v22->_properties, a6);
    objc_storeStrong((id *)&v22->_weights, a7);
    inputs = v22->_inputs;
    uint64_t v29 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v22->_inputs = (NSArray *)MEMORY[0x1E4F1CBF0];

    outputs = v22->_outputs;
    v22->_outputs = v29;

    inputsWithDimensions = v22->_inputsWithDimensions;
    v22->_inputsWithDimensions = v29;

    outputsWithDimensions = v22->_outputsWithDimensions;
    v22->_outputsWithDimensions = v29;

    bzero(&v22->_parameters, 0x2C0uLL);
  }
  id v33 = (id)objc_msgSend_checkForValidity(v22, v19, v20, v21);

  return v22;
}

- (MontrealNNModelNode)initWithDictionary:(id)a3 tensors:(id)a4 quantization:(id)a5 jsonDir:(id)a6
{
  v152[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v140 = a4;
  id v11 = a5;
  id v12 = a6;
  v149.receiver = self;
  v149.super_class = (Class)MontrealNNModelNode;
  uint64_t v16 = [(MontrealNNModelNode *)&v149 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_exMRL_stringForKey_(v10, v13, (uint64_t)off_1E9457F58, v15);
    v18 = *(void **)(v16 + 16);
    *(void *)(v16 + 16) = v17;

    uint64_t v21 = objc_msgSend_exMRL_arrayForKey_(v10, v19, (uint64_t)off_1E9457F60, v20);
    uint64_t v22 = *(void **)(v16 + 24);
    *(void *)(v16 + 24) = v21;

    if (!*(void *)(v16 + 24))
    {
      uint64_t v25 = objc_msgSend_exMRL_stringForKey_(v10, v23, (uint64_t)off_1E9457F60, v24);
      v27 = (void *)v25;
      if (v25)
      {
        v152[0] = v25;
        uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v152, 1);
        uint64_t v29 = *(void **)(v16 + 24);
        *(void *)(v16 + 24) = v28;
      }
    }
    uint64_t v30 = objc_msgSend_exMRL_stringForKey_(v10, v23, (uint64_t)off_1E9457F70, v24);
    v31 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v30;

    uint64_t v34 = objc_msgSend_exMRL_dictionaryForKey_(v10, v32, (uint64_t)off_1E9457F88, v33);
    objc_super v35 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v34;

    v36 = [MontrealNNModelQuantization alloc];
    uint64_t v39 = objc_msgSend_initWithDictionary_(v36, v37, *(void *)(v16 + 40), v38);
    v40 = *(void **)(v16 + 88);
    *(void *)(v16 + 88) = v39;

    if (!*(void *)(v16 + 88)) {
      objc_storeStrong((id *)(v16 + 88), a5);
    }
    uint64_t v41 = sub_19E26F734(v10, off_1E9457F78);
    v42 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v41;

    uint64_t v43 = sub_19E26F734(v10, off_1E9457F80);
    v44 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = v43;

    id v137 = v12;
    id v138 = v11;
    uint64_t v45 = sub_19E26F8E4(v10, off_1E9457F68, v11, v12);
    v46 = *(void **)(v16 + 80);
    *(void *)(v16 + 80) = v45;

    uint64_t v47 = sub_19E26F734(v10, off_1E9457F78);
    v48 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v47;

    id v139 = v10;
    uint64_t v49 = sub_19E26F734(v10, off_1E9457F80);
    v50 = *(void **)(v16 + 72);
    *(void *)(v16 + 72) = v49;

    objc_msgSend_addObjectsFromArray_(v140, v51, *(void *)(v16 + 48), v52);
    objc_msgSend_addObjectsFromArray_(v140, v53, *(void *)(v16 + 64), v54);
    v57 = objc_msgSend_stringWithFormat_(NSString, v55, @"%@ == %%@", v56, off_1E94581C8);
    v58 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v62 = objc_msgSend_count(*(void **)(v16 + 48), v59, v60, v61);
    v65 = objc_msgSend_arrayWithCapacity_(v58, v63, v62, v64);
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v66 = *(id *)(v16 + 48);
    uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v145, (uint64_t)v151, 16);
    if (v68)
    {
      uint64_t v72 = v68;
      uint64_t v73 = *(void *)v146;
      do
      {
        for (uint64_t i = 0; i != v72; ++i)
        {
          if (*(void *)v146 != v73) {
            objc_enumerationMutation(v66);
          }
          v75 = (void *)MEMORY[0x1E4F28F60];
          v76 = objc_msgSend_name(*(void **)(*((void *)&v145 + 1) + 8 * i), v69, v70, v71);
          v79 = objc_msgSend_predicateWithFormat_(v75, v77, (uint64_t)v57, v78, v76);

          v82 = objc_msgSend_filteredSetUsingPredicate_(v140, v80, (uint64_t)v79, v81);
          v86 = objc_msgSend_anyObject(v82, v83, v84, v85);

          v90 = objc_msgSend_asInput(v86, v87, v88, v89);
          objc_msgSend_addObject_(v90, v91, v16, v92);

          objc_msgSend_addObject_(v65, v93, (uint64_t)v86, v94);
        }
        uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v145, (uint64_t)v151, 16);
      }
      while (v72);
    }

    location = (id *)v65;
    objc_storeStrong((id *)(v16 + 48), v65);
    v95 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v99 = objc_msgSend_count(*(void **)(v16 + 64), v96, v97, v98);
    v102 = objc_msgSend_arrayWithCapacity_(v95, v100, v99, v101);
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    uint64_t v103 = v16;
    id v104 = *(id *)(v16 + 64);
    uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v141, (uint64_t)v150, 16);
    if (v106)
    {
      uint64_t v110 = v106;
      uint64_t v111 = *(void *)v142;
      do
      {
        for (uint64_t j = 0; j != v110; ++j)
        {
          if (*(void *)v142 != v111) {
            objc_enumerationMutation(v104);
          }
          v113 = (void *)MEMORY[0x1E4F28F60];
          v114 = objc_msgSend_name(*(void **)(*((void *)&v141 + 1) + 8 * j), v107, v108, v109);
          v117 = objc_msgSend_predicateWithFormat_(v113, v115, (uint64_t)v57, v116, v114);

          v120 = objc_msgSend_filteredSetUsingPredicate_(v140, v118, (uint64_t)v117, v119);
          v124 = objc_msgSend_anyObject(v120, v121, v122, v123);

          v128 = objc_msgSend_asOutput(v124, v125, v126, v127);
          objc_msgSend_addObject_(v128, v129, v103, v130);

          objc_msgSend_addObject_(v102, v131, (uint64_t)v124, v132);
        }
        uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v141, (uint64_t)v150, 16);
      }
      while (v110);
    }

    uint64_t v16 = v103;
    v133 = *(void **)(v103 + 64);
    *(void *)(v103 + 64) = v102;

    id v11 = v138;
    id v10 = v139;
    id v12 = v137;
  }
  objc_msgSend_checkForValidity((void *)v16, v13, v14, v15);
  v134 = (MontrealNNModelNode *)objc_claimAutoreleasedReturnValue();

  return v134;
}

- (id)auditAndUpdateTensors:(id)a3 dimensionTensors:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v5;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        while (1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v11);
          }
          uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v6, v14, v25, v15, (void)v33) & 1) == 0) {
            break;
          }
          uint64_t v19 = objc_msgSend_indexOfObject_(v6, v26, v25, v27);
          uint64_t v22 = objc_msgSend_objectAtIndex_(v6, v20, v19, v21);
          objc_msgSend_addObject_(v10, v23, (uint64_t)v22, v24);

          if (v16 == ++i) {
            goto LABEL_3;
          }
        }
        objc_msgSend_addObject_(v10, v26, v25, v27);
      }
LABEL_3:
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v16);
  }

  v31 = objc_msgSend_copy(v10, v28, v29, v30);

  return v31;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
  id v5 = a3;
  objc_msgSend_inputs(self, v6, v7, v8);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = objc_msgSend_inputsWithDimensions(self, v9, v10, v11);
  objc_msgSend_auditAndUpdateTensors_dimensionTensors_(self, v13, (uint64_t)v16, (uint64_t)v12);
  uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputsWithDimensions = self->_inputsWithDimensions;
  self->_inputsWithDimensions = v14;
}

- (void)setOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_outputs, a3);
  id v5 = a3;
  objc_msgSend_outputs(self, v6, v7, v8);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = objc_msgSend_outputsWithDimensions(self, v9, v10, v11);
  objc_msgSend_auditAndUpdateTensors_dimensionTensors_(self, v13, (uint64_t)v16, (uint64_t)v12);
  uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputsWithDimensions = self->_outputsWithDimensions;
  self->_outputsWithDimensions = v14;
}

- (void)keepTensors:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19E249F9C;
  v11[3] = &unk_1E599D0A8;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void (**)(void, void))MEMORY[0x19F3BC450](v11);
  ((void (**)(void, NSArray *))v6)[2](v6, self->_inputs);
  uint64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputs = self->_inputs;
  self->_inputs = v7;

  ((void (**)(void, NSArray *))v6)[2](v6, self->_outputs);
  uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v9;
}

- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters:(SEL)a3
{
  if ((objc_msgSend_parametersSet(self, a3, (uint64_t)a4, v4) & 1) == 0)
  {
    sub_19E31FA2C(self, (uint64_t)a4, v11);
    memcpy(&self->_parameters, v11, sizeof(self->_parameters));
    objc_msgSend_setParametersSet_(self, v8, 1, v9);
  }
  return ($2F5DD3F8DC6DFA190B2787CD1D3A833E *)memcpy(retstr, &self->_parameters, sizeof($2F5DD3F8DC6DFA190B2787CD1D3A833E));
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_name(self, v8, v9, v10);
  objc_msgSend_appendFormat_(v7, v12, @"\r %@ Name = %@ ", v13, v6, v11);

  uint64_t v17 = objc_msgSend_nodeStr(self, v14, v15, v16);
  objc_msgSend_appendFormat_(v7, v18, @"\r %@ Node Type = %@ ", v19, v6, v17);

  v23 = objc_msgSend_activations(self, v20, v21, v22);
  uint64_t v24 = sub_19E26F1C0(v23, v6);
  objc_msgSend_appendFormat_(v7, v25, @"\r %@ Activation Type = %@ ", v26, v6, v24);

  uint64_t v30 = objc_msgSend_inputsWithDimensions(self, v27, v28, v29);
  v31 = sub_19E26F1C0(v30, v6);
  objc_msgSend_appendFormat_(v7, v32, @"\r %@ Inputs With Dimensions = %@ ", v33, v6, v31);

  v37 = objc_msgSend_outputsWithDimensions(self, v34, v35, v36);
  uint64_t v38 = sub_19E26F1C0(v37, v6);
  objc_msgSend_appendFormat_(v7, v39, @"\r %@ Outputs With Dimension = %@ ", v40, v6, v38);

  v44 = objc_msgSend_inputs(self, v41, v42, v43);
  uint64_t v45 = sub_19E26F1C0(v44, v6);
  objc_msgSend_appendFormat_(v7, v46, @"\r %@ Inputs = %@ ", v47, v6, v45);

  v51 = objc_msgSend_outputs(self, v48, v49, v50);
  uint64_t v52 = sub_19E26F1C0(v51, v6);
  objc_msgSend_appendFormat_(v7, v53, @"\r %@ Outputs = %@ ", v54, v6, v52);

  v58 = objc_msgSend_weights(self, v55, v56, v57);
  v59 = sub_19E26F1C0(v58, v6);
  objc_msgSend_appendFormat_(v7, v60, @"\r %@ Weights = %@ ", v61, v6, v59);

  objc_msgSend_properties(self, v62, v63, v64);
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  v65 = sub_19E26F430(v68, v6);
  objc_msgSend_appendFormat_(v7, v66, @"\r %@ Properties = %@ ", v67, v6, v65);
}

- (id)jsonDescription
{
  id v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v9 = objc_msgSend_nodeStr(self, v6, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, (uint64_t)off_1E9457F58);

  uint64_t v14 = objc_msgSend_activations(self, v11, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)v14, (uint64_t)off_1E9457F60);

  uint64_t v19 = objc_msgSend_name(self, v16, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v19, (uint64_t)off_1E9457F70);

  uint64_t v24 = objc_msgSend_properties(self, v21, v22, v23);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v25, (uint64_t)v24, (uint64_t)off_1E9457F88);

  uint64_t v29 = objc_msgSend_weights(self, v26, v27, v28);
  uint64_t v30 = sub_19E26FAC8(v29);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)v30, (uint64_t)off_1E9457F68);

  uint64_t v35 = objc_msgSend_inputsWithDimensions(self, v32, v33, v34);
  uint64_t v36 = sub_19E26FAC8(v35);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v37, (uint64_t)v36, (uint64_t)off_1E9457F78);

  uint64_t v41 = objc_msgSend_outputsWithDimensions(self, v38, v39, v40);
  uint64_t v42 = sub_19E26FAC8(v41);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v43, (uint64_t)v42, (uint64_t)off_1E9457F80);

  uint64_t v47 = objc_msgSend_copy(v5, v44, v45, v46);

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_name(v5, v10, v11, v12);

    char isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_name(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (void)generateJSONAtPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v8 = objc_msgSend_weights(self, v5, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_generateJSONAtPath_(*(void **)(*((void *)&v16 + 1) + 8 * v15++), v11, (uint64_t)v4, v12);
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v13);
  }
}

- (id)createDataContainer
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = objc_msgSend_weights(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v9);
        }
        long long v18 = objc_msgSend_createDataContainer(*(void **)(*((void *)&v26 + 1) + 8 * i), v12, v13, v14);
        objc_msgSend_addEntriesFromDictionary_(v5, v19, (uint64_t)v18, v20);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v15);
  }

  uint64_t v24 = objc_msgSend_copy(v5, v21, v22, v23);

  return v24;
}

- (BOOL)isValid
{
  return self->_parameters.nodeType >= 0;
}

- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters
{
  objc_copyStruct(retstr, &self->_parameters, 704, 1, 0);
  return result;
}

- (void)setParameters:(id *)a3
{
}

- (NSString)nodeStr
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)activations
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)inputsWithDimensions
{
  return self->_inputsWithDimensions;
}

- (void)setInputsWithDimensions:(id)a3
{
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSArray)outputsWithDimensions
{
  return self->_outputsWithDimensions;
}

- (void)setOutputsWithDimensions:(id)a3
{
}

- (NSArray)weights
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (MontrealNNModelQuantization)quantization
{
  return (MontrealNNModelQuantization *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)parametersSet
{
  return self->_parametersSet;
}

- (void)setParametersSet:(BOOL)a3
{
  self->_parametersSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantization, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_outputsWithDimensions, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputsWithDimensions, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_activations, 0);

  objc_storeStrong((id *)&self->_nodeStr, 0);
}

@end