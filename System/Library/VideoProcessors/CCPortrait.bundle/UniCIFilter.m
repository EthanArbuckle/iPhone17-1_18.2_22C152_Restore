@interface UniCIFilter
- (CIFilter)filter;
- (UniCIFilter)init;
- (UniCIFilter)initWithDevice:(id)a3;
- (id)inputImageArray;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputImageArray;
- (id)outputNameArray;
- (id)run:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation UniCIFilter

- (UniCIFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)UniCIFilter;
  v2 = [(UniKernel *)&v6 init];
  v4 = v2;
  if (v2) {
    objc_msgSend_setFilter_(v2, v3, 0);
  }
  return v4;
}

- (UniCIFilter)initWithDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniCIFilter;
  v5 = [(UniKernel *)&v10 init];
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
    objc_msgSend_setFilter_(v7, v8, 0);
  }

  return v7;
}

- (id)run:(id)a3
{
  v81[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v76 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    objc_super v10 = objc_msgSend_device(self, v5, v6, 0);
    id v9 = (id)objc_msgSend_newCommandQueue(v10, v11, v12);
  }
  v13 = objc_msgSend_commandBuffer(v9, v7, v8, v76);
  v16 = objc_msgSend_inputs(self, v14, v15);
  v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, *MEMORY[0x263F009D0]);

  if (!v18) {
    sub_262E4C274();
  }
  if (qword_26A997608 != -1) {
    dispatch_once(&qword_26A997608, &unk_270E12DD8);
  }
  v21 = (void *)MEMORY[0x263F08D40];
  v22 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_valueWithNonretainedObject_(v21, v23, (uint64_t)v22);

  id v25 = (id)qword_26A997600;
  objc_sync_enter(v25);
  v29 = objc_msgSend_objectForKeyedSubscript_((void *)qword_26A997600, v26, (uint64_t)v24);
  if (!v29)
  {
    v30 = (void *)MEMORY[0x263F00628];
    v31 = objc_msgSend_device(self, v27, v28);
    uint64_t v80 = *MEMORY[0x263F00858];
    v34 = objc_msgSend_null(MEMORY[0x263EFF9D0], v32, v33);
    v81[0] = v34;
    v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v81, &v80, 1);
    v29 = objc_msgSend_contextWithMTLDevice_options_(v30, v37, (uint64_t)v31, v36);

    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_26A997600, v38, (uint64_t)v29, v24);
  }
  objc_sync_exit(v25);

  if (!v29) {
    sub_262E4C2A0();
  }
  v40 = objc_msgSend__mtlTextureForImage_(UniKernel, v39, (uint64_t)v18);
  v42 = v40;
  if (!v40) {
    sub_262E4C2CC();
  }
  if ((objc_msgSend_conformsToProtocol_(v40, v41, (uint64_t)&unk_270E2A1A0) & 1) == 0) {
    sub_262E4C324();
  }
  id v43 = objc_alloc(MEMORY[0x263F00670]);
  v46 = objc_msgSend_initWithMTLTexture_commandBuffer_(v43, v44, (uint64_t)v42, v13);
  if (v46)
  {
    v48 = objc_msgSend__ciImageForInput_(self, v45, (uint64_t)v18);
    if (!v48) {
      sub_262E4C2F8();
    }
    objc_msgSend_setColorSpace_(v46, v47, 0);
    objc_msgSend_setClamped_(v46, v49, 0);
    uint64_t v52 = objc_msgSend_width(v42, v50, v51);
    uint64_t v55 = objc_msgSend_height(v42, v53, v54);
    objc_msgSend_extent(v48, v56, v57);
    v84.origin.x = v58;
    v84.origin.y = v59;
    v84.size.width = v60;
    v84.size.height = v61;
    v83.size.width = (double)(unint64_t)v52;
    v83.size.height = (double)(unint64_t)v55;
    v83.origin.x = 0.0;
    v83.origin.y = 0.0;
    if (!CGRectEqualToRect(v83, v84))
    {
      uint64_t v64 = objc_msgSend_width(v42, v62, v63);
      uint64_t v67 = objc_msgSend_height(v42, v65, v66);
      uint64_t v70 = objc_msgSend_imageByCroppingToRect_(v48, v68, v69, 0.0, 0.0, (double)(unint64_t)v64, (double)(unint64_t)v67);

      v48 = (void *)v70;
    }
    id v78 = 0;
    id v71 = (id)objc_msgSend_startTaskToRender_toDestination_error_(v29, v62, (uint64_t)v48, v46, &v78);
    id v72 = v78;
    v79[0] = v13;
    v79[1] = v42;
    v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v73, (uint64_t)v79, 2);
  }
  else
  {
    v74 = 0;
  }

  return v74;
}

- (id)outputImage:(id)a3
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_copy(self, v5, v6);
  objc_super v10 = objc_msgSend_inputs(v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"name");

  if (!v12) {
    sub_262E4C350();
  }
  v14 = objc_msgSend_filterWithName_(MEMORY[0x263F00640], v13, v12);
  objc_msgSend_setFilter_(v7, v15, (uint64_t)v14);

  v18 = objc_msgSend_filter(v7, v16, v17);
  if (!v18) {
    sub_262E4C37C();
  }
  v119 = (const char *)v12;
  id v120 = v4;

  v21 = objc_msgSend_filter(v7, v19, v20);
  objc_msgSend_setDefaults(v21, v22, v23);

  v24 = (void *)MEMORY[0x263EFFA08];
  v27 = objc_msgSend_filter(v7, v25, v26);
  v30 = objc_msgSend_inputKeys(v27, v28, v29);
  v124 = objc_msgSend_setWithArray_(v24, v31, (uint64_t)v30);

  uint64_t v33 = objc_msgSend_setWithSet_(MEMORY[0x263EFF9C0], v32, (uint64_t)v124);
  v36 = objc_msgSend_filter(v7, v34, v35);
  v123 = objc_msgSend_attributes(v36, v37, v38);

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v126 = v7;
  v41 = objc_msgSend_inputs(v7, v39, v40);
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v131, v140, 16);
  v45 = (void *)v33;
  v122 = (void *)v33;
  if (v43)
  {
    uint64_t v46 = v43;
    uint64_t v47 = *(void *)v132;
    uint64_t v48 = *MEMORY[0x263F009D0];
    uint64_t v121 = *MEMORY[0x263F00690];
    v125 = v41;
    while (2)
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v132 != v47) {
          objc_enumerationMutation(v41);
        }
        v50 = *(char **)(*((void *)&v131 + 1) + 8 * i);
        if ((objc_msgSend_isEqualToString_(v50, v44, @"name") & 1) == 0
          && (objc_msgSend_isEqualToString_(v50, v44, v48) & 1) == 0)
        {
          if ((objc_msgSend_containsObject_(v124, v44, (uint64_t)v50) & 1) == 0)
          {
            CGFloat v59 = uni_logger_api();
            if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              v105 = 0;
              id v72 = v126;
              v116 = (char *)v119;
              v73 = v120;
              goto LABEL_44;
            }
            v116 = (char *)v119;
            sub_262E4C4B0((uint64_t)v50, v119);
            goto LABEL_43;
          }
          v53 = objc_msgSend_inputs(v126, v51, v52);
          uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v53, v54, (uint64_t)v50);

          CGFloat v59 = objc_msgSend_objectForKeyedSubscript_(v123, v56, (uint64_t)v50);
          if (v59)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_objectForKeyedSubscript_(v59, v57, v121);
              CGFloat v60 = (NSString *)objc_claimAutoreleasedReturnValue();
              CGFloat v61 = v60;
              if (v60) {
                Class v62 = NSClassFromString(v60);
              }
              else {
                Class v62 = 0;
              }
              if ((Class)objc_opt_class() == v62 || (Class)objc_opt_class() == v62)
              {
                uint64_t v64 = objc_msgSend__ciImageForInput_(v126, v63, (uint64_t)v55);

                uint64_t v55 = (void *)v64;
              }

              v45 = v122;
            }
          }
          if (!v55)
          {
            v117 = uni_logger_api();
            v116 = (char *)v119;
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
              sub_262E4C400((uint64_t)v119, v50);
            }

LABEL_43:
            v105 = 0;
            id v72 = v126;
            v73 = v120;
            goto LABEL_44;
          }
          v65 = objc_msgSend_filter(v126, v57, v58);
          objc_msgSend_setValue_forKey_(v65, v66, (uint64_t)v55, v50);

          objc_msgSend_removeObject_(v45, v67, (uint64_t)v50);
          v41 = v125;
        }
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v131, v140, 16);
      if (v46) {
        continue;
      }
      break;
    }
  }

  id v72 = v126;
  v73 = v120;
  if (objc_msgSend_count(v45, v68, v69))
  {
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v74 = v45;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v127, v139, 16);
    if (v76)
    {
      uint64_t v79 = v76;
      uint64_t v80 = *(void *)v128;
      do
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v128 != v80) {
            objc_enumerationMutation(v74);
          }
          uint64_t v82 = *(void *)(*((void *)&v127 + 1) + 8 * j);
          CGRect v83 = objc_msgSend_filter(v72, v77, v78);
          v85 = objc_msgSend_valueForKey_(v83, v84, v82);

          v86 = uni_logger_api();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            v89 = NSString;
            v90 = objc_msgSend_filter(v72, v87, v88);
            v91 = objc_opt_class();
            v94 = objc_msgSend_description(v91, v92, v93);
            objc_msgSend_stringWithFormat_(v89, v95, @"Using default value (%@) for key %@ because it was not set explicitly on filter %@", v85, v82, v94);
            id v96 = objc_claimAutoreleasedReturnValue();
            uint64_t v99 = objc_msgSend_UTF8String(v96, v97, v98);
            *(_DWORD *)buf = 136446466;
            v136 = "-[UniCIFilter outputImage:]";
            __int16 v137 = 2080;
            uint64_t v138 = v99;
            _os_log_impl(&dword_262E0F000, v86, OS_LOG_TYPE_INFO, "%{public}s %s", buf, 0x16u);

            id v72 = v126;
          }
        }
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v127, v139, 16);
      }
      while (v79);
    }

    v73 = v120;
    v45 = v122;
  }
  v100 = objc_msgSend_filter(v72, v70, v71);
  uint64_t v103 = objc_msgSend_outputImage(v100, v101, v102);

  if (!v103) {
    sub_262E4C3A8();
  }
  v125 = (void *)v103;
  v105 = objc_msgSend_imageWithCIImage_(UniImage, v104, v103);
  v108 = objc_msgSend_inputs(v72, v106, v107);
  v110 = objc_msgSend_objectForKeyedSubscript_(v108, v109, *MEMORY[0x263F009D0]);
  objc_msgSend_setTexture_(v105, v111, (uint64_t)v110);

  objc_msgSend_setKernel_(v105, v112, (uint64_t)v72);
  uint64_t v115 = objc_msgSend_texture(v105, v113, v114);
  if (!v115) {
    sub_262E4C3D4();
  }
  CGFloat v59 = v115;
  v116 = (char *)v119;
LABEL_44:

  return v105;
}

- (id)outputImageArray
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend_inputs(self, a2, v2);
  v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, *MEMORY[0x263F009D0]);
  v7 = objc_msgSend__mtlTextureForImage_(UniKernel, v6, (uint64_t)v5);

  if (!v7) {
    sub_262E4C560();
  }
  uint64_t v8 = rootTexture(v7);
  v12[0] = v8;
  objc_super v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, (uint64_t)v12, 1);

  return v10;
}

- (id)inputImageArray
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!self->filter) {
    sub_262E4C58C();
  }
  id v4 = objc_msgSend_inputNameArray(self, a2, v2);
  v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(v4, v6, v7);
  uint64_t v26 = objc_msgSend_arrayWithCapacity_(v5, v9, v8);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, v31, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v10);
        }
        v18 = objc_msgSend_valueForKey_(self->filter, v13, *(void *)(*((void *)&v27 + 1) + 8 * i));
        if (v18)
        {
          v19 = objc_msgSend__mtlTextureForImage_(UniKernel, v17, (uint64_t)v18);
          uint64_t v20 = v19;
          if (v19)
          {
            v21 = rootTexture(v19);
            objc_msgSend_addObject_(v26, v22, (uint64_t)v21);
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v27, v31, 16);
    }
    while (v14);
  }

  v24 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v23, (uint64_t)v26);

  return v24;
}

- (id)inputNameArray
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  filter = self->filter;
  if (!filter) {
    sub_262E4C5B8();
  }
  id v4 = objc_msgSend_attributes(filter, a2, v2);
  id v25 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v27;
    uint64_t v13 = *MEMORY[0x263F00690];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v16 = objc_msgSend_objectForKeyedSubscript_(v7, v10, v15);
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_objectForKeyedSubscript_(v16, v17, v13);
            v18 = (NSString *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18) {
              Class v20 = NSClassFromString(v18);
            }
            else {
              Class v20 = 0;
            }
            if ((Class)objc_opt_class() == v20 || (Class)objc_opt_class() == v20) {
              objc_msgSend_addObject_(v25, v21, v15);
            }
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v26, v30, 16);
    }
    while (v11);
  }

  uint64_t v23 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v22, (uint64_t)v25);

  return v23;
}

- (id)outputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F009D0];
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (CIFilter)filter
{
  return self->filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end