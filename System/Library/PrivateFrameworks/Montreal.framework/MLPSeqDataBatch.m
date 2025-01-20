@interface MLPSeqDataBatch
- (MLPNDArrayLossLabels)combinedLossLabels;
- (MLPSeqDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5;
- (NSArray)matrix;
- (unint64_t)labelsCount;
- (void)setCombinedLossLabels:(id)a3;
- (void)setLabelsCount:(unint64_t)a3;
- (void)setMatrix:(id)a3;
@end

@implementation MLPSeqDataBatch

- (MLPSeqDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5
{
  id v169 = a3;
  id v174 = a5;
  v192.receiver = self;
  v192.super_class = (Class)MLPSeqDataBatch;
  v11 = [(MLPSeqDataBatch *)&v192 init];
  if (v11)
  {
    v12 = objc_msgSend_deviceHandler(v174, v8, v9, v10);
    v167 = objc_msgSend_device(v12, v13, v14, v15);

    v19 = objc_msgSend_layers(v174, v16, v17, v18);
    v166 = objc_msgSend_firstObject(v19, v20, v21, v22);

    v26 = objc_msgSend_layers(v174, v23, v24, v25);
    v168 = objc_msgSend_lastObject(v26, v27, v28, v29);

    v180 = objc_msgSend_objectForKeyedSubscript_(v169, v30, (uint64_t)MLPModelSampleDataBatchOfSequencesKey, v31);
    v173 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v32, v33, v34);
    v172 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v35, v36, v37);
    v38 = (void *)MEMORY[0x1E4F35578];
    uint64_t v42 = objc_msgSend_outputChannels(v168, v39, v40, v41);
    v165 = objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(v38, v43, 4, 1, 1, v42);
    v189 = 0;
    v190 = 0;
    v191 = 0;
    v175 = v11;
    v46 = 0;
    if (a4)
    {
      uint64_t v47 = 0;
      objc_msgSend_objectAtIndexedSubscript_(v180, v44, 0, v45);
      while (1)
        v50 = {;
        v53 = objc_msgSend_objectForKeyedSubscript_(v50, v51, (uint64_t)MLPModelSampleDataSequenceValuesKey, v52);
        uint64_t v57 = objc_msgSend_count(v53, v54, v55, v56);
        uint64_t v58 = v57;
        if (v46 < v191)
        {
          uint64_t *v46 = v47;
          v46[1] = v57;
          v46 += 2;
          goto LABEL_5;
        }
        v59 = v189;
        uint64_t v60 = ((char *)v46 - (char *)v189) >> 4;
        unint64_t v61 = v60 + 1;
        if ((unint64_t)(v60 + 1) >> 60) {
          sub_19E13D694();
        }
        uint64_t v62 = (char *)v191 - (char *)v189;
        if (v191 - v189 > v61) {
          unint64_t v61 = v62 >> 3;
        }
        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v63 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v63 = v61;
        }
        if (v63)
        {
          if (v63 >> 60) {
            sub_19E13C418();
          }
          v64 = (char *)operator new(16 * v63);
          v65 = (uint64_t *)&v64[16 * v60];
          uint64_t *v65 = v47;
          v65[1] = v58;
          if (v46 == v59)
          {
LABEL_22:
            v67 = v46;
            v46 = v65 + 2;
            v189 = v65;
            v190 = v65 + 2;
            v191 = (uint64_t *)&v64[16 * v63];
            if (!v67) {
              goto LABEL_5;
            }
LABEL_23:
            operator delete(v67);
            goto LABEL_5;
          }
        }
        else
        {
          v64 = 0;
          v65 = (uint64_t *)(16 * v60);
          uint64_t *v65 = v47;
          v65[1] = v58;
          if (v46 == v59) {
            goto LABEL_22;
          }
        }
        v66 = v65;
        do
        {
          *((_OWORD *)v66 - 1) = *((_OWORD *)v46 - 1);
          v66 -= 2;
          v46 -= 2;
        }
        while (v46 != v59);
        v67 = v189;
        v46 = v65 + 2;
        v189 = v66;
        v190 = v65 + 2;
        v191 = (uint64_t *)&v64[16 * v63];
        if (v67) {
          goto LABEL_23;
        }
LABEL_5:
        v11 = v175;
        v190 = v46;

        if (++v47 == a4)
        {
          unint64_t v68 = (unint64_t)v189;
          goto LABEL_26;
        }
        objc_msgSend_objectAtIndexedSubscript_(v180, v48, v47, v49);
      }
    }
    unint64_t v68 = 0;
LABEL_26:
    unint64_t v69 = 126 - 2 * __clz((uint64_t)((uint64_t)v46 - v68) >> 4);
    if (v46 == (uint64_t *)v68) {
      uint64_t v70 = 0;
    }
    else {
      uint64_t v70 = v69;
    }
    sub_19E265918(v68, v46, v70, 1);
    v74 = v189;
    uint64_t v171 = v189[1];
    if (v171)
    {
      unint64_t v75 = 0;
      v76 = v190;
      v170 = v189;
      v177 = v190;
      while (1)
      {
        v186 = 0;
        uint64_t v187 = 0;
        v188 = 0;
        __p = 0;
        v184 = 0;
        v185 = 0;
        if (v74 != v76) {
          break;
        }
        v182 = 0;
LABEL_89:
        v145 = objc_msgSend_deviceHandler(v174, v71, v72, v73);
        v146 = v186;
        v11 = v175;
        v148 = objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v145, v147, v182 - v186, 1, v186, 0, 0.0);

        objc_msgSend_addObject_(v173, v149, (uint64_t)v148, v150);
        v175->_labelsCount += ((char *)v184 - (unsigned char *)__p) >> 2;
        v74 = v170;
        CFArrayRef v151 = sub_19E2628E8((int **)&__p);
        objc_msgSend_addObjectsFromArray_(v172, v152, (uint64_t)v151, v153);

        if (v151) {
          CFRelease(v151);
        }

        if (__p)
        {
          v184 = (float *)__p;
          operator delete(__p);
        }
        if (v146) {
          operator delete(v146);
        }
        if (++v75 == v171) {
          goto LABEL_95;
        }
      }
      v77 = 0;
      v179 = 0;
      v78 = 0;
      v79 = v74;
      unint64_t v176 = v75;
      while (1)
      {
        while (1)
        {
          v80 = objc_msgSend_objectAtIndexedSubscript_(v180, v71, *v79, v73);
          v83 = objc_msgSend_objectForKeyedSubscript_(v80, v81, (uint64_t)MLPModelSampleDataSequenceValuesKey, v82);
          v86 = objc_msgSend_objectForKeyedSubscript_(v80, v84, (uint64_t)MLPModelSampleDataSequenceLabelsKey, v85);
          if (objc_msgSend_count(v83, v87, v88, v89) > v75) {
            break;
          }
          v182 = v78;

          v79 += 2;
          if (v79 == v76) {
            goto LABEL_89;
          }
        }
        v92 = objc_msgSend_objectAtIndexedSubscript_(v83, v90, v75, v91);
        v181 = v86;
        v178 = v80;
        float v96 = (float)(unint64_t)objc_msgSend_unsignedIntegerValue(v92, v93, v94, v95);
        if (v78 < v179)
        {
          float *v78 = v96;
          uint64_t v97 = (uint64_t)(v78 + 1);
          goto LABEL_53;
        }
        uint64_t v98 = v78 - v77;
        unint64_t v99 = v98 + 1;
        if ((unint64_t)(v98 + 1) >> 62) {
          sub_19E13D694();
        }
        if (((char *)v179 - (char *)v77) >> 1 > v99) {
          unint64_t v99 = ((char *)v179 - (char *)v77) >> 1;
        }
        unint64_t v100 = (unint64_t)((char *)v179 - (char *)v77) >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v99;
        if (v100)
        {
          if (v100 >> 62) {
            sub_19E13C418();
          }
          unint64_t v101 = v100;
          v102 = operator new(4 * v100);
          unint64_t v100 = v101;
          v103 = (float *)&v102[4 * v98];
          float *v103 = v96;
          uint64_t v97 = (uint64_t)(v103 + 1);
          if (v78 == v77)
          {
LABEL_67:
            v186 = v103;
            uint64_t v187 = v97;
            v179 = (float *)&v102[4 * v100];
            v188 = v179;
            if (!v77) {
              goto LABEL_52;
            }
LABEL_51:
            operator delete(v77);
            goto LABEL_52;
          }
        }
        else
        {
          v102 = 0;
          v103 = (float *)(4 * v98);
          *(float *)(4 * v98) = v96;
          uint64_t v97 = 4 * v98 + 4;
          if (v78 == v77) {
            goto LABEL_67;
          }
        }
        unint64_t v104 = (char *)(v78 - 1) - (char *)v77;
        if (v104 < 0xBC
          || &v102[(char *)v78 - (char *)v77 - 4 - (v104 & 0xFFFFFFFFFFFFFFFCLL)] > &v102[(char *)v78 - (char *)v77 - 4]
          || (float *)((char *)v78 - (v104 & 0xFFFFFFFFFFFFFFFCLL) - 4) > v78 - 1
          || (unint64_t)((char *)v77 - v102) < 0x20)
        {
          break;
        }
        uint64_t v130 = (v104 >> 2) + 1;
        uint64_t v131 = 4 * (v130 & 0x7FFFFFFFFFFFFFF8);
        v105 = &v78[v131 / 0xFFFFFFFFFFFFFFFCLL];
        v103 = (float *)((char *)v103 - v131);
        v132 = &v102[4 * v98 - 16];
        v133 = v78 - 4;
        uint64_t v134 = v130 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v135 = *(_OWORD *)v133;
          *(v132 - 1) = *((_OWORD *)v133 - 1);
          _OWORD *v132 = v135;
          v132 -= 2;
          v133 -= 8;
          v134 -= 8;
        }
        while (v134);
        if (v130 != (v130 & 0x7FFFFFFFFFFFFFF8)) {
          goto LABEL_49;
        }
LABEL_50:
        v186 = v103;
        uint64_t v187 = v97;
        v179 = (float *)&v102[4 * v100];
        v188 = v179;
        if (v77) {
          goto LABEL_51;
        }
LABEL_52:
        v77 = v103;
LABEL_53:
        v182 = (float *)v97;
        uint64_t v187 = v97;

        unint64_t v107 = v75;
        v110 = objc_msgSend_objectAtIndexedSubscript_(v86, v108, v75, v109);
        v111 = v83;
        float v115 = (float)(unint64_t)objc_msgSend_unsignedIntegerValue(v110, v112, v113, v114);
        v116 = v184;
        if (v184 >= v185)
        {
          v120 = (float *)__p;
          int64_t v121 = (char *)v184 - (unsigned char *)__p;
          uint64_t v122 = ((char *)v184 - (unsigned char *)__p) >> 2;
          unint64_t v123 = v122 + 1;
          if ((unint64_t)(v122 + 1) >> 62) {
            sub_19E13D694();
          }
          uint64_t v124 = (char *)v185 - (unsigned char *)__p;
          if (((char *)v185 - (unsigned char *)__p) >> 1 > v123) {
            unint64_t v123 = v124 >> 1;
          }
          if ((unint64_t)v124 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v125 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v125 = v123;
          }
          if (v125)
          {
            if (v125 >> 62) {
              sub_19E13C418();
            }
            unint64_t v126 = v125;
            v127 = (char *)operator new(4 * v125);
            unint64_t v125 = v126;
            v128 = (float *)&v127[4 * v122];
            float *v128 = v115;
            uint64_t v117 = (uint64_t)(v128 + 1);
            if (v116 != v120)
            {
LABEL_64:
              unint64_t v129 = (char *)(v116 - 1) - (char *)v120;
              if (v129 < 0x2C)
              {
                v83 = v111;
                goto LABEL_82;
              }
              unint64_t v136 = (char *)v116 - &v127[v121];
              v83 = v111;
              if (v136 < 0x20) {
                goto LABEL_107;
              }
              uint64_t v137 = (v129 >> 2) + 1;
              uint64_t v138 = 4 * (v137 & 0x7FFFFFFFFFFFFFF8);
              v139 = &v116[v138 / 0xFFFFFFFFFFFFFFFCLL];
              v128 = (float *)((char *)v128 - v138);
              v140 = &v127[4 * v122 - 16];
              v141 = v116 - 4;
              uint64_t v142 = v137 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v143 = *(_OWORD *)v141;
                *((_OWORD *)v140 - 1) = *((_OWORD *)v141 - 1);
                *(_OWORD *)v140 = v143;
                v140 -= 32;
                v141 -= 8;
                v142 -= 8;
              }
              while (v142);
              v116 = v139;
              if (v137 != (v137 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_107:
                do
                {
LABEL_82:
                  int v144 = *((_DWORD *)v116-- - 1);
                  *((_DWORD *)v128-- - 1) = v144;
                }
                while (v116 != v120);
              }
LABEL_83:
              __p = v128;
              v184 = (float *)v117;
              v185 = (float *)&v127[4 * v125];
              if (v120) {
                operator delete(v120);
              }
              v118 = v178;
              v119 = v181;
              unint64_t v75 = v176;
              goto LABEL_86;
            }
          }
          else
          {
            v127 = 0;
            v128 = (float *)(4 * v122);
            *(float *)(4 * v122) = v115;
            uint64_t v117 = 4 * v122 + 4;
            if (v116 != v120) {
              goto LABEL_64;
            }
          }
          v83 = v111;
          goto LABEL_83;
        }
        float *v184 = v115;
        uint64_t v117 = (uint64_t)(v116 + 1);
        unint64_t v75 = v107;
        v118 = v178;
        v119 = v181;
LABEL_86:
        v184 = (float *)v117;

        v78 = v182;
        v76 = v177;

        v79 += 2;
        if (v79 == v177) {
          goto LABEL_89;
        }
      }
      v105 = v78;
      do
      {
LABEL_49:
        int v106 = *((_DWORD *)v105-- - 1);
        *((_DWORD *)v103-- - 1) = v106;
      }
      while (v105 != v77);
      goto LABEL_50;
    }
LABEL_95:
    uint64_t v154 = objc_msgSend_copy(v173, v71, v72, v73);
    matrix = v11->_matrix;
    v11->_matrix = (NSArray *)v154;

    v156 = objc_alloc_init(MLPNDArrayLossLabels);
    v160 = objc_msgSend_copy(v172, v157, v158, v159);
    objc_msgSend_setLabels_(v156, v161, (uint64_t)v160, v162);

    combinedLossLabels = v11->_combinedLossLabels;
    v11->_combinedLossLabels = v156;

    if (v74) {
      operator delete(v74);
    }
  }
  return v11;
}

- (NSArray)matrix
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMatrix:(id)a3
{
}

- (MLPNDArrayLossLabels)combinedLossLabels
{
  return (MLPNDArrayLossLabels *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCombinedLossLabels:(id)a3
{
}

- (unint64_t)labelsCount
{
  return self->_labelsCount;
}

- (void)setLabelsCount:(unint64_t)a3
{
  self->_labelsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedLossLabels, 0);

  objc_storeStrong((id *)&self->_matrix, 0);
}

@end