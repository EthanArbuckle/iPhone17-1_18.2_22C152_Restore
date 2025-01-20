@interface MLPImageDataBatch
- (MLPImageDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5;
- (NSArray)images;
- (NSArray)labels;
- (NSArray)lossLabels;
- (void)setImages:(id)a3;
- (void)setLabels:(id)a3;
- (void)setLossLabels:(id)a3;
@end

@implementation MLPImageDataBatch

- (MLPImageDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5
{
  id v7 = a3;
  id v138 = a5;
  v144.receiver = self;
  v144.super_class = (Class)MLPImageDataBatch;
  v11 = [(MLPImageDataBatch *)&v144 init];
  if (v11)
  {
    v12 = objc_msgSend_deviceHandler(v138, v8, v9, v10);
    v137 = objc_msgSend_device(v12, v13, v14, v15);

    v19 = objc_msgSend_layers(v138, v16, v17, v18);
    v23 = objc_msgSend_firstObject(v19, v20, v21, v22);

    v27 = objc_msgSend_layers(v138, v24, v25, v26);
    v136 = objc_msgSend_lastObject(v27, v28, v29, v30);

    objc_msgSend_objectForKeyedSubscript_(v7, v31, (uint64_t)MLPModelSampleDataFeatureValuesKey, v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    uint64_t v37 = objc_msgSend_bytes(v33, v34, v35, v36);
    objc_msgSend_objectForKeyedSubscript_(v7, v38, (uint64_t)MLPModelSampleDataLabelsKey, v39);
    v133 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v40, a4, v41);
    v129 = v33;
    v130 = v11;
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v42, a4, v43);
    v131 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v128 = v7;
    v44 = (void *)MEMORY[0x1E4F35578];
    uint64_t v48 = objc_msgSend_outputChannels(v136, v45, v46, v47);
    v132 = objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(v44, v49, 1, 1, 1, v48);
    if (a4)
    {
      uint64_t v53 = 0;
      do
      {
        v54 = objc_alloc_init(MLPData);
        uint64_t v58 = objc_msgSend_inputLength(v23, v55, v56, v57);
        uint64_t v62 = objc_msgSend_inputChannels(v23, v59, v60, v61);
        v64 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v63, v37 + 4 * v62 * v58 * v53, 4 * v62 * v58);
        objc_msgSend_setPixels_(v54, v65, (uint64_t)v64, v66);

        v70 = objc_msgSend_deviceHandler(v138, v67, v68, v69);
        v74 = objc_msgSend_pixels(v54, v71, v72, v73);
        uint64_t v78 = objc_msgSend_inputLength(v23, v75, v76, v77);
        uint64_t v82 = objc_msgSend_inputChannels(v23, v79, v80, v81);
        v84 = objc_msgSend_imageFromData_width_height_featureChannels_(v70, v83, (uint64_t)v74, v78, 1, v82);

        objc_msgSend_addObject_(v134, v85, (uint64_t)v84, v86);
        v89 = objc_msgSend_objectAtIndex_(v133, v87, v53, v88);
        uint64_t v93 = objc_msgSend_unsignedIntegerValue(v89, v90, v91, v92);
        objc_msgSend_setLabel_(v54, v94, v93, v95);
        id v96 = objc_alloc(MEMORY[0x1E4F35530]);
        v98 = objc_msgSend_initWithDevice_imageDescriptor_(v96, v97, (uint64_t)v137, (uint64_t)v132);
        size_t v102 = objc_msgSend_outputChannels(v136, v99, v100, v101);
        size_t v106 = v102;
        v141 = 0;
        v142 = 0;
        uint64_t v143 = 0;
        if (v102)
        {
          if ((v102 & 0x8000000000000000) != 0) {
            sub_19E13D694();
          }
          v107 = operator new(v102);
          v141 = v107;
          v142 = v107;
          bzero(v107, v106);
        }
        else
        {
          v107 = 0;
        }
        *((unsigned char *)v107 + objc_msgSend_unsignedIntegerValue(v89, v103, v104, v105)) = -1;
        v111 = objc_msgSend_deviceHandler(v138, v108, v109, v110);
        uint64_t v115 = objc_msgSend_dataLayout(v111, v112, v113, v114);
        objc_msgSend_writeBytes_dataLayout_imageIndex_(v98, v116, (uint64_t)v107, v115, 0);

        id v117 = objc_alloc(MEMORY[0x1E4F35468]);
        int64x2_t v139 = vdupq_n_s64(1uLL);
        uint64_t v140 = 1;
        v119 = objc_msgSend_initWithDevice_lossImageSize_labelsImage_weightsImage_(v117, v118, (uint64_t)v137, (uint64_t)&v139, v98, 0);
        objc_msgSend_addObject_(v131, v120, (uint64_t)v119, v121);

        operator delete(v107);
        ++v53;
      }
      while (a4 != v53);
    }
    uint64_t v122 = objc_msgSend_copy(v134, v50, v51, v52);
    v11 = v130;
    images = v130->_images;
    v130->_images = (NSArray *)v122;

    lossLabels = v130->_lossLabels;
    v130->_lossLabels = v131;
    v125 = v131;

    labels = v130->_labels;
    v130->_labels = v133;

    id v7 = v128;
  }

  return v11;
}

- (NSArray)images
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setImages:(id)a3
{
}

- (NSArray)lossLabels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLossLabels:(id)a3
{
}

- (NSArray)labels
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_lossLabels, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end