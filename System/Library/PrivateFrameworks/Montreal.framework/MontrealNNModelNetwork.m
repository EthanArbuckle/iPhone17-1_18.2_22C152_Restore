@interface MontrealNNModelNetwork
- (MontrealNNModelNetwork)init;
- (MontrealNNModelNetwork)initWithDictionary:(id)a3 tensors:(id)a4 quantization:(id)a5 optimizerParams:(id)a6 jsonDir:(id)a7 optimization:(unint64_t)a8;
- (MontrealNNModelNetwork)initWithJSONDir:(id)a3;
- (MontrealNNModelNetwork)initWithModelContainer:(void *)a3 tensors:(id)a4;
- (MontrealNNModelOptimizerParam)optimizerParams;
- (MontrealNNModelQuantization)quantization;
- (NSArray)inputs;
- (NSArray)nodes;
- (NSArray)outputs;
- (NSString)jsonDir;
- (id)checkForValidity;
- (id)createDataContainer;
- (id)jsonDescription;
- (void)collapseNodes;
- (void)collapsePackUnpack:(id)a3 nodesToRemove:(id)a4;
- (void)description:(id)a3 indent:(id)a4;
- (void)generateJSONAtPath:(id)a3;
- (void)generateModelContainer;
- (void)removeView:(id)a3 nodesToRemove:(id)a4;
- (void)setInputs:(id)a3;
- (void)setNodes:(id)a3;
- (void)setOutputs:(id)a3;
- (void)validateNetworkTensors:(id)a3;
- (void)validateNodeTensors;
@end

@implementation MontrealNNModelNetwork

- (id)checkForValidity
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_nodes(self, a2, v2, v3);
  v27[0] = v5;
  v27[1] = @"nodes";
  v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v27, 2);
  v28[0] = v7;
  v11 = objc_msgSend_inputs(self, v8, v9, v10);
  v26[0] = v11;
  v26[1] = @"inputs";
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v26, 2);
  v28[1] = v13;
  v17 = objc_msgSend_outputs(self, v14, v15, v16);
  v25[0] = v17;
  v25[1] = @"outputs";
  v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v25, 2);
  v28[2] = v19;
  v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)v28, 3);
  objc_msgSend_checkForValidity_(self, v22, (uint64_t)v21, v23);

  return self;
}

- (MontrealNNModelNetwork)init
{
  v9.receiver = self;
  v9.super_class = (Class)MontrealNNModelNetwork;
  uint64_t v2 = [(MontrealNNModelNetwork *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    nodes = v2->_nodes;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_nodes = (NSArray *)MEMORY[0x1E4F1CBF0];

    inputs = v3->_inputs;
    v3->_inputs = v5;

    outputs = v3->_outputs;
    v3->_outputs = v5;
  }
  return v3;
}

- (MontrealNNModelNetwork)initWithJSONDir:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)MontrealNNModelNetwork;
  v8 = [(MontrealNNModelNetwork *)&v55 init];
  if (v8)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v5, @"%@/network.json", v7);
    uint64_t v13 = objc_msgSend_dataWithContentsOfFile_(v9, v11, (uint64_t)v10, v12);

    v54 = (void *)v13;
    uint64_t v15 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v14, v13, 0, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_19E15DB6C(@"Failed to extract network JSON", (uint64_t)v16, v17, v18, v19, v20, v21, v22, (uint64_t)v4);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F1C9B8];
    v24 = objc_msgSend_stringWithFormat_(NSString, v16, @"%@/description.json", v18);
    v27 = objc_msgSend_dataWithContentsOfFile_(v23, v25, (uint64_t)v24, v26);

    v29 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v28, (uint64_t)v27, 0, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_19E15DB6C(@"Failed to extract description JSON", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v4);
    }
    id v37 = v29;
    v38 = [MontrealNNModelQuantization alloc];
    v41 = objc_msgSend_initWithDictionary_(v38, v39, (uint64_t)v37, v40);
    v42 = [MontrealNNModelOptimizerParam alloc];
    v45 = objc_msgSend_initWithDictionary_(v42, v43, (uint64_t)v37, v44);
    v49 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v46, v47, v48);
    v51 = objc_msgSend_initWithDictionary_tensors_quantization_optimizerParams_jsonDir_optimization_(v8, v50, (uint64_t)v15, (uint64_t)v49, v41, v45, v4, 0);
  }
  else
  {
    v51 = 0;
  }
  objc_msgSend_checkForValidity(v51, v5, v6, v7);
  v52 = (MontrealNNModelNetwork *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (MontrealNNModelNetwork)initWithModelContainer:(void *)a3 tensors:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)off_1E9459420(a3, 0);
  objc_super v9 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v8, (uint64_t)v7, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_19E15DB6C(@"Failed to extract network JSON from model container", v10, v11, v12, v13, v14, v15, v16, v33);
  }
  uint64_t v17 = (void *)off_1E9459418(a3);
  uint64_t v18 = [MontrealNNModelOptimizerParam alloc];
  uint64_t v21 = objc_msgSend_initWithDictionary_(v18, v19, (uint64_t)v17, v20);
  v24 = objc_msgSend_exMRL_numberForKey_(v17, v22, (uint64_t)off_1E9458250, v23);
  uint64_t v28 = objc_msgSend_unsignedIntegerValue(v24, v25, v26, v27);

  v29 = [MontrealNNModelNetwork alloc];
  uint64_t v31 = (MontrealNNModelNetwork *)objc_msgSend_initWithDictionary_tensors_quantization_optimizerParams_jsonDir_optimization_(v29, v30, (uint64_t)v9, (uint64_t)v6, 0, v21, 0, v28);

  return v31;
}

- (MontrealNNModelNetwork)initWithDictionary:(id)a3 tensors:(id)a4 quantization:(id)a5 optimizerParams:(id)a6 jsonDir:(id)a7 optimization:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v40.receiver = self;
  v40.super_class = (Class)MontrealNNModelNetwork;
  uint64_t v18 = [(MontrealNNModelNetwork *)&v40 init];
  uint64_t v22 = v18;
  uint64_t v23 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_optimizerParams, a6);
    objc_storeStrong((id *)&v22->_jsonDir, a7);
    uint64_t v24 = sub_19E26FC20(v13, off_1E94581E0, v14, v15, v17);
    nodes = v23->_nodes;
    v23->_nodes = (NSArray *)v24;

    uint64_t v26 = sub_19E26F734(v13, off_1E94581D8);
    inputs = v23->_inputs;
    v23->_inputs = (NSArray *)v26;

    uint64_t v28 = sub_19E26F734(v13, off_1E9457F80);
    outputs = v23->_outputs;
    v23->_outputs = (NSArray *)v28;

    objc_msgSend_validateNetworkTensors_(v23, v30, (uint64_t)v14, v31);
    objc_msgSend_collapseNodes(v23, v32, v33, v34);
    objc_msgSend_validateNodeTensors(v23, v35, v36, v37);
  }
  objc_msgSend_checkForValidity(v23, v19, v20, v21);
  v38 = (MontrealNNModelNetwork *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (void)validateNetworkTensors:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v5, @"%@ == %%@", v6, off_1E94581C8);
  id v13 = v4;
  id v14 = v13;
  id v8 = v7;
  id v15 = v8;
  sub_19E2FE644((uint64_t)&v14, self->_inputs);
  objc_super v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputs = self->_inputs;
  self->_inputs = v9;

  sub_19E2FE644((uint64_t)&v14, self->_outputs);
  uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v11;
}

- (void)collapseNodes
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  do
  {
    v49 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obj = self->_nodes;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v8)
    {
      uint64_t v9 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend_nodeStr(v11, v5, v6, v7);
          int isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)off_1E9458060, v14);

          if (isEqualToString)
          {
            objc_msgSend_collapsePackUnpack_nodesToRemove_(self, v16, (uint64_t)v11, (uint64_t)v49);
            goto LABEL_21;
          }
          uint64_t v19 = objc_msgSend_nodeStr(v11, v16, v17, v18);
          if (objc_msgSend_isEqualToString_(v19, v20, (uint64_t)off_1E9458078, v21)) {
            goto LABEL_19;
          }
          v25 = objc_msgSend_nodeStr(v11, v22, v23, v24);
          if (objc_msgSend_isEqualToString_(v25, v26, (uint64_t)off_1E9458080, v27)) {
            goto LABEL_18;
          }
          uint64_t v31 = objc_msgSend_nodeStr(v11, v28, v29, v30);
          if (objc_msgSend_isEqualToString_(v31, v32, (uint64_t)off_1E9458068, v33))
          {

LABEL_18:
LABEL_19:

LABEL_20:
            objc_msgSend_removeView_nodesToRemove_(self, v5, (uint64_t)v11, (uint64_t)v49);
LABEL_21:
            char v41 = 1;
            goto LABEL_22;
          }
          uint64_t v37 = objc_msgSend_nodeStr(v11, v34, v35, v36);
          char v40 = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)off_1E9458070, v39);

          if (v40) {
            goto LABEL_20;
          }
        }
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v52, (uint64_t)v56, 16);
        char v41 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v41 = 0;
    }
LABEL_22:

    v45 = (NSArray *)objc_msgSend_mutableCopy(self->_nodes, v42, v43, v44);
    objc_msgSend_removeObjectsInArray_(v45, v46, (uint64_t)v49, v47);
    nodes = self->_nodes;
    self->_nodes = v45;
  }
  while ((v41 & 1) != 0);
}

- (void)validateNodeTensors
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_mutableCopy(self->_nodes, a2, v2, v3);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v6 = self->_nodes;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v15 = objc_msgSend_inputs(v14, v8, v9, v10);
        id v16 = sub_19E2FEDD0(v15);
        objc_msgSend_setInputs_(v14, v17, (uint64_t)v16, v18);

        uint64_t v22 = objc_msgSend_outputs(v14, v19, v20, v21);
        uint64_t v23 = sub_19E2FEDD0(v22);
        objc_msgSend_setOutputs_(v14, v24, (uint64_t)v23, v25);

        uint64_t v29 = objc_msgSend_inputs(v14, v26, v27, v28);
        if (!objc_msgSend_count(v29, v30, v31, v32))
        {

LABEL_5:
          objc_msgSend_removeObject_(v5, v8, (uint64_t)v14, v10);
          continue;
        }
        uint64_t v36 = objc_msgSend_outputs(v14, v33, v34, v35);
        BOOL v40 = objc_msgSend_count(v36, v37, v38, v39) == 0;

        if (v40) {
          goto LABEL_5;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v11);
  }

  uint64_t v44 = (NSArray *)objc_msgSend_copy(v5, v41, v42, v43);
  nodes = self->_nodes;
  self->_nodes = v44;

  sub_19E2FEDD0(self->_inputs);
  v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputs = self->_inputs;
  self->_inputs = v46;

  sub_19E2FEDD0(self->_outputs);
  uint64_t v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v48;
}

- (void)collapsePackUnpack:(id)a3 nodesToRemove:(id)a4
{
  v130[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_inputs(v5, v7, v8, v9);
  if (!objc_msgSend_count(v10, v11, v12, v13))
  {

    goto LABEL_5;
  }
  uint64_t v17 = objc_msgSend_outputs(v5, v14, v15, v16);
  uint64_t v21 = objc_msgSend_count(v17, v18, v19, v20);

  if (!v21) {
LABEL_5:
  }
    sub_19E15DB6C(@"Node %@ contains empty inputs or outputs", (uint64_t)v22, v23, v24, v25, v26, v27, v28, (uint64_t)v5);
  uint64_t v29 = objc_msgSend_inputs(v5, v22, v23, v24);
  uint64_t v32 = objc_msgSend_objectAtIndex_(v29, v30, 0, v31);

  uint64_t v36 = objc_msgSend_outputs(v5, v33, v34, v35);
  uint64_t v39 = objc_msgSend_objectAtIndex_(v36, v37, 0, v38);

  uint64_t v43 = objc_msgSend_asInput(v39, v40, v41, v42);
  uint64_t v47 = objc_msgSend_anyObject(v43, v44, v45, v46);

  if (!v47) {
    sub_19E15DB6C(@"Node %@ output is going nowhere?", (uint64_t)v48, v49, v50, v51, v52, v53, v54, 0);
  }
  uint64_t v55 = objc_msgSend_outputs(v47, v48, v49, v50);
  uint64_t v59 = objc_msgSend_count(v55, v56, v57, v58);

  if (!v59) {
    sub_19E15DB6C(@"Node %@ contains empty outputs", (uint64_t)v60, v61, v62, v63, v64, v65, v66, (uint64_t)v47);
  }
  v67 = objc_msgSend_outputs(v47, v60, v61, v62);
  v70 = objc_msgSend_objectAtIndex_(v67, v68, 0, v69);

  v74 = objc_msgSend_asInput(v70, v71, v72, v73);
  v78 = objc_msgSend_anyObject(v74, v75, v76, v77);

  if (!v78) {
    sub_19E15DB6C(@"No unpack node?", (uint64_t)v79, v80, v81, v82, v83, v84, v85, v128);
  }
  v86 = objc_msgSend_outputs(v78, v79, v80, v81);
  v89 = objc_msgSend_objectAtIndex_(v86, v87, 0, v88);

  v130[0] = v32;
  v91 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v90, (uint64_t)v130, 1);
  objc_msgSend_setInputs_(v47, v92, (uint64_t)v91, v93);

  v97 = objc_msgSend_asInput(v32, v94, v95, v96);
  objc_msgSend_removeAllObjects(v97, v98, v99, v100);

  v104 = objc_msgSend_asInput(v32, v101, v102, v103);
  objc_msgSend_addObject_(v104, v105, (uint64_t)v47, v106);

  v129 = v89;
  v108 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v107, (uint64_t)&v129, 1);
  objc_msgSend_setOutputs_(v47, v109, (uint64_t)v108, v110);

  v114 = objc_msgSend_asOutput(v89, v111, v112, v113);
  objc_msgSend_removeAllObjects(v114, v115, v116, v117);

  v121 = objc_msgSend_asOutput(v89, v118, v119, v120);
  objc_msgSend_addObject_(v121, v122, (uint64_t)v47, v123);

  objc_msgSend_addObject_(v6, v124, (uint64_t)v5, v125);
  objc_msgSend_addObject_(v6, v126, (uint64_t)v78, v127);
}

- (void)removeView:(id)a3 nodesToRemove:(id)a4
{
  id v86 = a3;
  id v5 = a4;
  uint64_t v9 = objc_msgSend_inputs(v86, v6, v7, v8);
  if (!objc_msgSend_count(v9, v10, v11, v12))
  {

    goto LABEL_5;
  }
  uint64_t v16 = objc_msgSend_outputs(v86, v13, v14, v15);
  uint64_t v20 = objc_msgSend_count(v16, v17, v18, v19);

  if (!v20) {
LABEL_5:
  }
    sub_19E15DB6C(@"Node %@ contains empty inputs or outputs", (uint64_t)v21, v22, v23, v24, v25, v26, v27, (uint64_t)v86);
  uint64_t v28 = objc_msgSend_inputs(v86, v21, v22, v23);
  uint64_t v31 = objc_msgSend_objectAtIndex_(v28, v29, 0, v30);

  uint64_t v35 = objc_msgSend_outputs(v86, v32, v33, v34);
  uint64_t v38 = objc_msgSend_objectAtIndex_(v35, v36, 0, v37);

  uint64_t v42 = objc_msgSend_asInput(v38, v39, v40, v41);
  uint64_t v46 = objc_msgSend_anyObject(v42, v43, v44, v45);

  if (!v46) {
    sub_19E15DB6C(@"Node %@ output is going nowhere?", (uint64_t)v47, v48, v49, v50, v51, v52, v53, (uint64_t)v86);
  }
  uint64_t v54 = objc_msgSend_inputs(v46, v47, v48, v49);
  uint64_t v58 = objc_msgSend_mutableCopy(v54, v55, v56, v57);

  uint64_t v61 = objc_msgSend_indexOfObject_(v58, v59, (uint64_t)v38, v60);
  objc_msgSend_removeObjectAtIndex_(v58, v62, v61, v63);
  objc_msgSend_insertObject_atIndex_(v58, v64, (uint64_t)v31, v61);
  v68 = objc_msgSend_copy(v58, v65, v66, v67);
  objc_msgSend_setInputs_(v46, v69, (uint64_t)v68, v70);

  v74 = objc_msgSend_asInput(v31, v71, v72, v73);
  objc_msgSend_removeAllObjects(v74, v75, v76, v77);

  uint64_t v81 = objc_msgSend_asInput(v31, v78, v79, v80);
  objc_msgSend_addObject_(v81, v82, (uint64_t)v46, v83);

  objc_msgSend_addObject_(v5, v84, (uint64_t)v86, v85);
}

- (void)description:(id)a3 indent:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_inputs(self, v7, v8, v9);
  uint64_t v11 = sub_19E26F1C0(v10, v6);
  objc_msgSend_appendFormat_(v28, v12, @"\r %@ Inputs = %@ ", v13, v6, v11);

  uint64_t v17 = objc_msgSend_outputs(self, v14, v15, v16);
  uint64_t v18 = sub_19E26F1C0(v17, v6);
  objc_msgSend_appendFormat_(v28, v19, @"\r %@ Outputs = %@ ", v20, v6, v18);

  uint64_t v24 = objc_msgSend_nodes(self, v21, v22, v23);
  uint64_t v25 = sub_19E26F1C0(v24, v6);
  objc_msgSend_appendFormat_(v28, v26, @"\r %@ Nodes = %@ ", v27, v6, v25);
}

- (id)jsonDescription
{
  id v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v9 = objc_msgSend_nodes(self, v6, v7, v8);
  uint64_t v10 = sub_19E26FAC8(v9);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v11, (uint64_t)v10, (uint64_t)off_1E94581E0);

  uint64_t v15 = objc_msgSend_inputs(self, v12, v13, v14);
  uint64_t v16 = sub_19E26FAC8(v15);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, (uint64_t)off_1E9457F78);

  uint64_t v21 = objc_msgSend_outputs(self, v18, v19, v20);
  uint64_t v22 = sub_19E26FAC8(v21);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v23, (uint64_t)v22, (uint64_t)off_1E9457F80);

  uint64_t v27 = objc_msgSend_copy(v5, v24, v25, v26);

  return v27;
}

- (void)generateJSONAtPath:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_jsonDescription(self, v5, v6, v7);
  id v38 = 0;
  uint64_t v10 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v9, (uint64_t)v8, 1, &v38);
  id v11 = v38;
  uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v12, @"%@/network.json", v13, v4);
  objc_msgSend_writeToFile_atomically_(v10, v15, (uint64_t)v14, 1);

  id v37 = v11;
  uint64_t v17 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v16, MEMORY[0x1E4F1CC08], 1, &v37);
  id v18 = v37;

  uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v19, @"%@/description.json", v20, v4);
  objc_msgSend_writeToFile_atomically_(v17, v22, (uint64_t)v21, 1);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v26 = objc_msgSend_nodes(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, (uint64_t)v39, 16);
  if (v30)
  {
    uint64_t v31 = *(void *)v34;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend_generateJSONAtPath_(*(void **)(*((void *)&v33 + 1) + 8 * v32++), v28, (uint64_t)v4, v29);
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v33, (uint64_t)v39, 16);
    }
    while (v30);
  }
}

- (id)createDataContainer
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = objc_msgSend_nodes(self, v6, v7, v8, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = objc_msgSend_createDataContainer(*(void **)(*((void *)&v25 + 1) + 8 * i), v11, v12, v13);
        objc_msgSend_addEntriesFromDictionary_(v5, v18, (uint64_t)v17, v19);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v14);
  }

  uint64_t v23 = objc_msgSend_copy(v5, v20, v21, v22);

  return v23;
}

- (void)generateModelContainer
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_jsonDescription(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v6, (uint64_t)v5, 1, 0);
  id v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  objc_msgSend_addObject_(v11, v12, (uint64_t)v7, v13);
  uint64_t v20 = objc_msgSend_createDataContainer(self, v14, v15, v16);
  for (unint64_t i = 1; objc_msgSend_count(v20, v17, v18, v19) >= i; ++i)
  {
    uint64_t v24 = objc_msgSend_numberWithInt_(NSNumber, v22, i, v23);
    long long v27 = objc_msgSend_exMRL_dataForKey_(v20, v25, (uint64_t)v24, v26);

    objc_msgSend_addObject_(v11, v28, (uint64_t)v27, v29);
  }
  sub_19E2374CC();
  uint64_t v39 = off_1E9458250;
  v40[0] = &unk_1EF0B3490;
  uint64_t v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v40, (uint64_t)&v39, 1);
  uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, void *, void))off_1E9459428;
  long long v36 = objc_msgSend_copy(v11, v33, v34, v35);
  id v37 = (void *)v32(2, 7, 1, v31, v36, 0);

  return v37;
}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNodes:(id)a3
{
}

- (NSArray)inputs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputs:(id)a3
{
}

- (NSArray)outputs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputs:(id)a3
{
}

- (MontrealNNModelQuantization)quantization
{
  return (MontrealNNModelQuantization *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)jsonDir
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (MontrealNNModelOptimizerParam)optimizerParams
{
  return (MontrealNNModelOptimizerParam *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerParams, 0);
  objc_storeStrong((id *)&self->_jsonDir, 0);
  objc_storeStrong((id *)&self->_quantization, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end