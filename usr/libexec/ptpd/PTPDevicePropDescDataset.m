@interface PTPDevicePropDescDataset
- (BOOL)dirty;
- (BOOL)readOnlyObject;
- (NSMutableArray)supportedValues;
- (NSMutableData)content;
- (PTPDevicePropDescDataset)init;
- (PTPDevicePropDescDataset)initWithData:(id)a3;
- (PTPDevicePropDescDataset)initWithMutableData:(id)a3;
- (id)currentValue;
- (id)description;
- (id)factoryDefaultValue;
- (id)maximumValue;
- (id)minimumValue;
- (id)stepSize;
- (unsigned)dataTypeCode;
- (unsigned)devicePropertyCode;
- (unsigned)formFlag;
- (unsigned)numberOfValues;
- (unsigned)readWriteAttribute;
- (void)setContent:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDataTypeCode:(unsigned __int16)a3;
- (void)setDevicePropertyCode:(unsigned __int16)a3;
- (void)setDirty:(BOOL)a3;
- (void)setFactoryDefaultValue:(id)a3;
- (void)setFormFlag:(unsigned __int8)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setNumberOfValues:(unsigned __int16)a3;
- (void)setReadOnlyObject:(BOOL)a3;
- (void)setReadWriteAttribute:(unsigned __int8)a3;
- (void)setStepSize:(id)a3;
- (void)setSupportedValues:(id)a3;
- (void)updateContent;
@end

@implementation PTPDevicePropDescDataset

- (PTPDevicePropDescDataset)init
{
  v6.receiver = self;
  v6.super_class = (Class)PTPDevicePropDescDataset;
  v2 = [(PTPDevicePropDescDataset *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0];
    content = v2->_content;
    v2->_content = v3;

    *(_WORD *)&v2->_dirty = 1;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_content, a3);
  objc_super v6 = (unsigned __int8 *)[(NSMutableData *)self->_content bytes];
  v7 = (char *)[(NSMutableData *)self->_content length] + (void)v6;
  v181 = v6;
  self->_devicePropertyCode = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
  int v8 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
  self->_dataTypeCode = v8;
  v9 = v181 + 1;
  self->_readWriteAttribute = *v181;
  v181 = v9;
  switch(v8)
  {
    case 1:
      id v10 = objc_alloc((Class)NSNumber);
      id v11 = [v10 initWithChar:(char)*v181];
      id factoryDefaultValue = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v11;

      ++v181;
      id v13 = objc_alloc((Class)NSNumber);
      id v14 = [v13 initWithChar:(char)*v181];
      id currentValue = self->_currentValue;
      self->_id currentValue = v14;

      v16 = v181++;
      int v17 = *v181;
      self->_formFlag = v17;
      v181 = v16 + 2;
      if (v17 == 2)
      {
        int v131 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v131;
        if (v131)
        {
          unsigned int v132 = 0;
          v133 = v181;
          do
          {
            supportedValues = self->_supportedValues;
            v135 = +[NSNumber numberWithChar:(char)*v133];
            [(NSMutableArray *)supportedValues addObject:v135];

            v133 = ++v181;
            ++v132;
          }
          while (v132 < self->_numberOfValues);
        }
      }
      else if (v17 == 1)
      {
        id v18 = objc_alloc((Class)NSNumber);
        id v19 = [v18 initWithChar:(char)*v181];
        id minimumValue = self->_minimumValue;
        self->_id minimumValue = v19;

        ++v181;
        id v21 = objc_alloc((Class)NSNumber);
        id v22 = [v21 initWithChar:(char)*v181];
        id maximumValue = self->_maximumValue;
        self->_id maximumValue = v22;

        ++v181;
        id v24 = objc_alloc((Class)NSNumber);
        id v25 = [v24 initWithChar:(char)*v181];
        goto LABEL_40;
      }
      break;
    case 2:
      id v35 = objc_alloc((Class)NSNumber);
      id v36 = [v35 initWithUnsignedChar:*v181];
      id v37 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v36;

      ++v181;
      id v38 = objc_alloc((Class)NSNumber);
      id v39 = [v38 initWithUnsignedChar:*v181];
      id v40 = self->_currentValue;
      self->_id currentValue = v39;

      v41 = v181++;
      int v42 = *v181;
      self->_formFlag = v42;
      v181 = v41 + 2;
      if (v42 == 2)
      {
        int v136 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v136;
        if (v136)
        {
          unsigned int v137 = 0;
          v138 = v181;
          do
          {
            v139 = self->_supportedValues;
            v140 = +[NSNumber numberWithUnsignedChar:*v138];
            [(NSMutableArray *)v139 addObject:v140];

            v138 = ++v181;
            ++v137;
          }
          while (v137 < self->_numberOfValues);
        }
      }
      else if (v42 == 1)
      {
        id v43 = objc_alloc((Class)NSNumber);
        id v44 = [v43 initWithUnsignedChar:*v181];
        id v45 = self->_minimumValue;
        self->_id minimumValue = v44;

        ++v181;
        id v46 = objc_alloc((Class)NSNumber);
        id v47 = [v46 initWithUnsignedChar:*v181];
        id v48 = self->_maximumValue;
        self->_id maximumValue = v47;

        ++v181;
        id v49 = objc_alloc((Class)NSNumber);
        id v25 = [v49 initWithUnsignedChar:*v181];
        goto LABEL_40;
      }
      break;
    case 3:
      id v50 = [objc_alloc((Class)NSNumber) initWithShort:sub_10001F08C((unint64_t *)&v181, (unint64_t)v7)];
      id v51 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v50;

      id v52 = [objc_alloc((Class)NSNumber) initWithShort:sub_10001F08C((unint64_t *)&v181, (unint64_t)v7)];
      id v53 = self->_currentValue;
      self->_id currentValue = v52;

      v55 = v181 + 1;
      int v54 = *v181;
      self->_formFlag = v54;
      v181 = v55;
      if (v54 == 2)
      {
        int v141 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v141;
        if (v141)
        {
          unsigned int v142 = 0;
          do
          {
            uint64_t v143 = sub_10001F08C((unint64_t *)&v181, (unint64_t)v7);
            v144 = self->_supportedValues;
            v145 = +[NSNumber numberWithShort:v143];
            [(NSMutableArray *)v144 addObject:v145];

            ++v142;
          }
          while (v142 < self->_numberOfValues);
        }
      }
      else if (v54 == 1)
      {
        id v56 = [objc_alloc((Class)NSNumber) initWithShort:sub_10001F08C((unint64_t *)&v181, (unint64_t)v7)];
        id v57 = self->_minimumValue;
        self->_id minimumValue = v56;

        id v58 = [objc_alloc((Class)NSNumber) initWithShort:sub_10001F08C((unint64_t *)&v181, (unint64_t)v7)];
        id v59 = self->_maximumValue;
        self->_id maximumValue = v58;

        id v25 = [objc_alloc((Class)NSNumber) initWithShort:sub_10001F08C((unint64_t *)&v181, (unint64_t)v7)];
        goto LABEL_40;
      }
      break;
    case 4:
      id v60 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7)];
      id v61 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v60;

      id v62 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7)];
      id v63 = self->_currentValue;
      self->_id currentValue = v62;

      v65 = v181 + 1;
      int v64 = *v181;
      self->_formFlag = v64;
      v181 = v65;
      if (v64 == 2)
      {
        int v146 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v146;
        if (v146)
        {
          unsigned int v147 = 0;
          do
          {
            uint64_t v148 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
            v149 = self->_supportedValues;
            v150 = +[NSNumber numberWithUnsignedShort:v148];
            [(NSMutableArray *)v149 addObject:v150];

            ++v147;
          }
          while (v147 < self->_numberOfValues);
        }
      }
      else if (v64 == 1)
      {
        id v66 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7)];
        id v67 = self->_minimumValue;
        self->_id minimumValue = v66;

        id v68 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7)];
        id v69 = self->_maximumValue;
        self->_id maximumValue = v68;

        id v25 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7)];
        goto LABEL_40;
      }
      break;
    case 5:
      id v70 = [objc_alloc((Class)NSNumber) initWithInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
      id v71 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v70;

      id v72 = [objc_alloc((Class)NSNumber) initWithInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
      id v73 = self->_currentValue;
      self->_id currentValue = v72;

      v75 = v181 + 1;
      int v74 = *v181;
      self->_formFlag = v74;
      v181 = v75;
      if (v74 == 2)
      {
        int v151 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v151;
        if (v151)
        {
          unsigned int v152 = 0;
          do
          {
            uint64_t v153 = sub_10001F108((unint64_t *)&v181, (unint64_t)v7);
            v154 = self->_supportedValues;
            v155 = +[NSNumber numberWithInt:v153];
            [(NSMutableArray *)v154 addObject:v155];

            ++v152;
          }
          while (v152 < self->_numberOfValues);
        }
      }
      else if (v74 == 1)
      {
        id v76 = [objc_alloc((Class)NSNumber) initWithInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
        id v77 = self->_minimumValue;
        self->_id minimumValue = v76;

        id v78 = [objc_alloc((Class)NSNumber) initWithInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
        id v79 = self->_maximumValue;
        self->_id maximumValue = v78;

        id v25 = [objc_alloc((Class)NSNumber) initWithInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
        goto LABEL_40;
      }
      break;
    case 6:
      id v80 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
      id v81 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v80;

      id v82 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
      id v83 = self->_currentValue;
      self->_id currentValue = v82;

      v85 = v181 + 1;
      int v84 = *v181;
      self->_formFlag = v84;
      v181 = v85;
      if (v84 == 2)
      {
        int v156 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v156;
        if (v156)
        {
          unsigned int v157 = 0;
          do
          {
            uint64_t v158 = sub_10001F108((unint64_t *)&v181, (unint64_t)v7);
            v159 = self->_supportedValues;
            v160 = +[NSNumber numberWithUnsignedInt:v158];
            [(NSMutableArray *)v159 addObject:v160];

            ++v157;
          }
          while (v157 < self->_numberOfValues);
        }
      }
      else if (v84 == 1)
      {
        id v86 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
        id v87 = self->_minimumValue;
        self->_id minimumValue = v86;

        id v88 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
        id v89 = self->_maximumValue;
        self->_id maximumValue = v88;

        id v25 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:sub_10001F108((unint64_t *)&v181, (unint64_t)v7)];
        goto LABEL_40;
      }
      break;
    case 7:
      id v90 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v91 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v90;

      id v92 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v93 = self->_currentValue;
      self->_id currentValue = v92;

      v95 = v181 + 1;
      int v94 = *v181;
      self->_formFlag = v94;
      v181 = v95;
      if (v94 == 2)
      {
        int v161 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v161;
        if (v161)
        {
          unsigned int v162 = 0;
          do
          {
            uint64_t v163 = sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
            v164 = self->_supportedValues;
            v165 = +[NSNumber numberWithLongLong:v163];
            [(NSMutableArray *)v164 addObject:v165];

            ++v162;
          }
          while (v162 < self->_numberOfValues);
        }
      }
      else if (v94 == 1)
      {
        id v96 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v97 = self->_minimumValue;
        self->_id minimumValue = v96;

        id v98 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v99 = self->_maximumValue;
        self->_id maximumValue = v98;

        goto LABEL_35;
      }
      break;
    case 8:
      id v100 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v101 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v100;

      id v102 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v103 = self->_currentValue;
      self->_id currentValue = v102;

      v105 = v181 + 1;
      int v104 = *v181;
      self->_formFlag = v104;
      v181 = v105;
      if (v104 == 2)
      {
        int v166 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v166;
        if (v166)
        {
          unsigned int v167 = 0;
          do
          {
            uint64_t v168 = sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
            v169 = self->_supportedValues;
            v170 = +[NSNumber numberWithUnsignedLongLong:v168];
            [(NSMutableArray *)v169 addObject:v170];

            ++v167;
          }
          while (v167 < self->_numberOfValues);
        }
      }
      else if (v104 == 1)
      {
        id v106 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v107 = self->_minimumValue;
        self->_id minimumValue = v106;

        id v108 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v109 = self->_maximumValue;
        self->_id maximumValue = v108;

        goto LABEL_39;
      }
      break;
    case 9:
      sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
      id v110 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v111 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v110;

      sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
      id v112 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v113 = self->_currentValue;
      self->_id currentValue = v112;

      v115 = v181 + 1;
      int v114 = *v181;
      self->_formFlag = v114;
      v181 = v115;
      if (v114 == 2)
      {
        int v171 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v171;
        if (v171)
        {
          unsigned int v172 = 0;
          do
          {
            sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
            uint64_t v173 = sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
            v174 = self->_supportedValues;
            v175 = +[NSNumber numberWithLongLong:v173];
            [(NSMutableArray *)v174 addObject:v175];

            ++v172;
          }
          while (v172 < self->_numberOfValues);
        }
      }
      else if (v114 == 1)
      {
        sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
        id v116 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v117 = self->_minimumValue;
        self->_id minimumValue = v116;

        sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
        id v118 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v119 = self->_maximumValue;
        self->_id maximumValue = v118;

        sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
LABEL_35:
        id v25 = [objc_alloc((Class)NSNumber) initWithLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        goto LABEL_40;
      }
      break;
    case 10:
      sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
      id v120 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v121 = self->_factoryDefaultValue;
      self->_id factoryDefaultValue = v120;

      sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
      id v122 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
      id v123 = self->_currentValue;
      self->_id currentValue = v122;

      v125 = v181 + 1;
      int v124 = *v181;
      self->_formFlag = v124;
      v181 = v125;
      if (v124 == 2)
      {
        int v176 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
        self->_numberOfValues = v176;
        if (v176)
        {
          unsigned int v177 = 0;
          do
          {
            sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
            uint64_t v178 = sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
            v179 = self->_supportedValues;
            v180 = +[NSNumber numberWithUnsignedLongLong:v178];
            [(NSMutableArray *)v179 addObject:v180];

            ++v177;
          }
          while (v177 < self->_numberOfValues);
        }
      }
      else if (v124 == 1)
      {
        sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
        id v126 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v127 = self->_minimumValue;
        self->_id minimumValue = v126;

        sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
        id v128 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
        id v129 = self->_maximumValue;
        self->_id maximumValue = v128;

        sub_10001F15C((unint64_t *)&v181, (unint64_t)v7);
LABEL_39:
        id v25 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:sub_10001F15C((unint64_t *)&v181, (unint64_t)v7)];
LABEL_40:
        id stepSize = self->_stepSize;
        self->_id stepSize = v25;
      }
      break;
    default:
      if (v8 == 0xFFFF)
      {
        v26 = sub_10001F270((const void **)&v181, (unint64_t)v7);
        id v27 = self->_factoryDefaultValue;
        self->_id factoryDefaultValue = v26;

        v28 = sub_10001F270((const void **)&v181, (unint64_t)v7);
        id v29 = self->_currentValue;
        self->_id currentValue = v28;

        v30 = v181 + 1;
        int v31 = *v181;
        self->_formFlag = v31;
        v181 = v30;
        if (v31 == 2)
        {
          int v32 = sub_10001F0E0((unint64_t *)&v181, (unint64_t)v7);
          self->_numberOfValues = v32;
          if (v32)
          {
            unsigned int v33 = 0;
            do
            {
              v34 = sub_10001F270((const void **)&v181, (unint64_t)v7);
              [(NSMutableArray *)self->_supportedValues addObject:v34];

              ++v33;
            }
            while (v33 < self->_numberOfValues);
          }
        }
      }
      break;
  }
}

- (PTPDevicePropDescDataset)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTPDevicePropDescDataset;
  id v5 = [(PTPDevicePropDescDataset *)&v10 init];
  if (v5)
  {
    objc_super v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    supportedValues = v5->_supportedValues;
    v5->_supportedValues = v6;

    if ((unint64_t)[v4 length] < 6)
    {

      id v5 = 0;
    }
    else
    {
      id v8 = [v4 mutableCopy];
      [(PTPDevicePropDescDataset *)v5 setContent:v8];

      v5->_readOnlyObject = 1;
    }
  }

  return v5;
}

- (PTPDevicePropDescDataset)initWithMutableData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTPDevicePropDescDataset;
  id v5 = [(PTPDevicePropDescDataset *)&v9 init];
  if (v5)
  {
    objc_super v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    supportedValues = v5->_supportedValues;
    v5->_supportedValues = v6;

    if ((unint64_t)[v4 length] < 6)
    {

      id v5 = 0;
    }
    else
    {
      [(PTPDevicePropDescDataset *)v5 setContent:v4];
      v5->_readOnlyObject = 0;
    }
  }

  return v5;
}

- (void)updateContent
{
  if (self->_dirty && !self->_readOnlyObject)
  {
    switch(self->_dataTypeCode)
    {
      case 1u:
      case 2u:
        int formFlag = self->_formFlag;
        if (formFlag == 1)
        {
          id v4 = 0;
          unsigned int v5 = 11;
        }
        else
        {
          id v4 = 0;
          if (formFlag == 2) {
            unsigned int v5 = self->_numberOfValues + 10;
          }
          else {
            unsigned int v5 = 8;
          }
        }
        break;
      case 3u:
      case 4u:
        int v14 = self->_formFlag;
        if (v14 == 1)
        {
          id v4 = 0;
          unsigned int v5 = 16;
        }
        else
        {
          id v4 = 0;
          if (v14 == 2) {
            unsigned int v5 = 2 * self->_numberOfValues + 12;
          }
          else {
            unsigned int v5 = 10;
          }
        }
        break;
      case 5u:
      case 6u:
        int v15 = self->_formFlag;
        if (v15 == 1)
        {
          id v4 = 0;
          unsigned int v5 = 26;
        }
        else
        {
          id v4 = 0;
          if (v15 == 2) {
            unsigned int v5 = 4 * self->_numberOfValues + 16;
          }
          else {
            unsigned int v5 = 14;
          }
        }
        break;
      case 7u:
      case 8u:
        int v16 = self->_formFlag;
        if (v16 == 1)
        {
          id v4 = 0;
          unsigned int v5 = 46;
        }
        else
        {
          id v4 = 0;
          if (v16 == 2) {
            unsigned int v5 = 8 * self->_numberOfValues + 24;
          }
          else {
            unsigned int v5 = 22;
          }
        }
        break;
      case 9u:
      case 0xAu:
        int v17 = self->_formFlag;
        if (v17 == 1)
        {
          id v4 = 0;
          unsigned int v5 = 86;
        }
        else
        {
          id v4 = 0;
          if (v17 == 2) {
            unsigned int v5 = 8 * self->_numberOfValues + 40;
          }
          else {
            unsigned int v5 = 38;
          }
        }
        break;
      default:
        if (self->_dataTypeCode == 0xFFFF)
        {
          unsigned int v6 = [self->_factoryDefaultValue length];
          if (v6) {
            int v7 = 2 * v6 + 10;
          }
          else {
            int v7 = 8;
          }
          unsigned int v8 = [self->_currentValue length];
          int v9 = 2 * v8 + 2;
          if (!v8) {
            int v9 = 0;
          }
          unsigned int v5 = v9 + v7;
          if (self->_formFlag == 2 && (v5 += 2, self->_numberOfValues))
          {
            unint64_t v10 = 0;
            id v11 = 0;
            do
            {
              id v4 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v10];

              unsigned int v12 = [v4 length];
              int v13 = 2 * v12 + 3;
              if (!v12) {
                int v13 = 1;
              }
              v5 += v13;
              ++v10;
              id v11 = v4;
            }
            while (v10 < self->_numberOfValues);
          }
          else
          {
            id v4 = 0;
          }
        }
        else
        {
          id v4 = 0;
          unsigned int v5 = 6;
        }
        break;
    }
    [(NSMutableData *)self->_content setLength:v5];
    id v63 = [(NSMutableData *)self->_content mutableBytes];
    sub_10001F0B4(&v63, self->_devicePropertyCode);
    sub_10001F0B4(&v63, self->_dataTypeCode);
    *(unsigned char *)id v63 = self->_readWriteAttribute;
    id v63 = (_WORD *)((char *)v63 + 1);
    switch(self->_dataTypeCode)
    {
      case 1u:
        unsigned __int8 v18 = [self->_factoryDefaultValue charValue];
        *(unsigned char *)id v63 = v18;
        id v63 = (_WORD *)((char *)v63 + 1);
        unsigned __int8 v19 = [self->_currentValue charValue];
        *(unsigned char *)id v63 = v19;
        v20 = v63;
        id v63 = (_WORD *)((char *)v63 + 1);
        *((unsigned char *)v20 + 1) = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v21 = self->_formFlag;
        if (v21 != 2) {
          goto LABEL_57;
        }
        sub_10001F0B4(&v63, self->_numberOfValues);
        if (self->_numberOfValues)
        {
          unint64_t v22 = 0;
          v23 = 0;
          do
          {
            id v24 = v23;
            v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v22];

            unsigned __int8 v25 = [v23 charValue];
            *(unsigned char *)id v63 = v25;
            id v63 = (_WORD *)((char *)v63 + 1);
            ++v22;
          }
          while (v22 < self->_numberOfValues);
          goto LABEL_120;
        }
        break;
      case 2u:
        unsigned __int8 v28 = [self->_factoryDefaultValue charValue];
        *(unsigned char *)id v63 = v28;
        id v63 = (_WORD *)((char *)v63 + 1);
        unsigned __int8 v29 = [self->_currentValue charValue];
        *(unsigned char *)id v63 = v29;
        v30 = v63;
        id v63 = (_WORD *)((char *)v63 + 1);
        *((unsigned char *)v30 + 1) = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v21 = self->_formFlag;
        if (v21 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v44 = 0;
            v23 = 0;
            do
            {
              id v45 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v44];

              unsigned __int8 v46 = [v23 charValue];
              *(unsigned char *)id v63 = v46;
              id v63 = (_WORD *)((char *)v63 + 1);
              ++v44;
            }
            while (v44 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else
        {
LABEL_57:
          if (v21 == 1)
          {
            unsigned __int8 v31 = [self->_minimumValue charValue];
            *(unsigned char *)id v63 = v31;
            id v63 = (_WORD *)((char *)v63 + 1);
            unsigned __int8 v32 = [self->_maximumValue charValue];
            *(unsigned char *)id v63 = v32;
            id v63 = (_WORD *)((char *)v63 + 1);
            unsigned __int8 v33 = [self->_stepSize charValue];
            *(unsigned char *)id v63 = v33;
            id v63 = (_WORD *)((char *)v63 + 1);
          }
        }
        break;
      case 3u:
        sub_10001F0B4(&v63, (__int16)[self->_factoryDefaultValue shortValue]);
        sub_10001F0B4(&v63, (__int16)[self->_currentValue shortValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v34 = self->_formFlag;
        if (v34 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v47 = 0;
            v23 = 0;
            do
            {
              id v48 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v47];

              sub_10001F0B4(&v63, (__int16)[v23 shortValue]);
              ++v47;
            }
            while (v47 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v34 == 1)
        {
          goto LABEL_61;
        }
        break;
      case 4u:
        sub_10001F0B4(&v63, (__int16)[self->_factoryDefaultValue shortValue]);
        sub_10001F0B4(&v63, (__int16)[self->_currentValue shortValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v35 = self->_formFlag;
        if (v35 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v49 = 0;
            v23 = 0;
            do
            {
              id v50 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v49];

              sub_10001F0B4(&v63, (__int16)[v23 shortValue]);
              ++v49;
            }
            while (v49 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v35 == 1)
        {
LABEL_61:
          sub_10001F0B4(&v63, (__int16)[self->_minimumValue shortValue]);
          sub_10001F0B4(&v63, (__int16)[self->_maximumValue shortValue]);
          sub_10001F0B4(&v63, (__int16)[self->_stepSize shortValue]);
        }
        break;
      case 5u:
        sub_10001F130((_DWORD **)&v63, (int)[self->_factoryDefaultValue intValue]);
        sub_10001F130((_DWORD **)&v63, (int)[self->_currentValue intValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v36 = self->_formFlag;
        if (v36 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v51 = 0;
            v23 = 0;
            do
            {
              id v52 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v51];

              sub_10001F130((_DWORD **)&v63, (int)[v23 intValue]);
              ++v51;
            }
            while (v51 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v36 == 1)
        {
          sub_10001F130((_DWORD **)&v63, (int)[self->_minimumValue intValue]);
          sub_10001F130((_DWORD **)&v63, (int)[self->_maximumValue intValue]);
          sub_10001F130((_DWORD **)&v63, (int)[self->_stepSize intValue]);
        }
        break;
      case 6u:
        sub_10001F130((_DWORD **)&v63, (int)[self->_factoryDefaultValue unsignedIntValue]);
        sub_10001F130((_DWORD **)&v63, (int)[self->_currentValue unsignedIntValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v37 = self->_formFlag;
        if (v37 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v53 = 0;
            v23 = 0;
            do
            {
              int v54 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v53];

              sub_10001F130((_DWORD **)&v63, (int)[v23 unsignedIntValue]);
              ++v53;
            }
            while (v53 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v37 == 1)
        {
          sub_10001F130((_DWORD **)&v63, (int)[self->_minimumValue unsignedIntValue]);
          sub_10001F130((_DWORD **)&v63, (int)[self->_maximumValue unsignedIntValue]);
          sub_10001F130((_DWORD **)&v63, (int)[self->_stepSize unsignedIntValue]);
        }
        break;
      case 7u:
        sub_10001F184((void **)&v63, (uint64_t)[self->_factoryDefaultValue longLongValue]);
        sub_10001F184((void **)&v63, (uint64_t)[self->_currentValue longLongValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v38 = self->_formFlag;
        if (v38 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v55 = 0;
            v23 = 0;
            do
            {
              id v56 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v55];

              sub_10001F184((void **)&v63, (uint64_t)[v23 longLongValue]);
              ++v55;
            }
            while (v55 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v38 == 1)
        {
          sub_10001F184((void **)&v63, (uint64_t)[self->_minimumValue longLongValue]);
          uint64_t v39 = (uint64_t)[self->_maximumValue longLongValue];
          goto LABEL_80;
        }
        break;
      case 8u:
        sub_10001F184((void **)&v63, (uint64_t)[self->_factoryDefaultValue unsignedLongLongValue]);
        sub_10001F184((void **)&v63, (uint64_t)[self->_currentValue unsignedLongLongValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v40 = self->_formFlag;
        if (v40 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v57 = 0;
            v23 = 0;
            do
            {
              id v58 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v57];

              sub_10001F184((void **)&v63, (uint64_t)[v23 unsignedLongLongValue]);
              ++v57;
            }
            while (v57 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v40 == 1)
        {
          sub_10001F184((void **)&v63, (uint64_t)[self->_minimumValue unsignedLongLongValue]);
          uint64_t v41 = (uint64_t)[self->_maximumValue unsignedLongLongValue];
          goto LABEL_84;
        }
        break;
      case 9u:
        sub_10001F184((void **)&v63, 0x4170706C65496E63);
        sub_10001F184((void **)&v63, (uint64_t)[self->_factoryDefaultValue longLongValue]);
        sub_10001F184((void **)&v63, 0x4170706C65496E63);
        sub_10001F184((void **)&v63, (uint64_t)[self->_currentValue longLongValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v42 = self->_formFlag;
        if (v42 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v59 = 0;
            v23 = 0;
            do
            {
              id v60 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v59];

              sub_10001F184((void **)&v63, 0x4170706C65496E63);
              sub_10001F184((void **)&v63, (uint64_t)[v23 longLongValue]);
              ++v59;
            }
            while (v59 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v42 == 1)
        {
          sub_10001F184((void **)&v63, 0x4170706C65496E63);
          sub_10001F184((void **)&v63, (uint64_t)[self->_minimumValue longLongValue]);
          sub_10001F184((void **)&v63, 0x4170706C65496E63);
          sub_10001F184((void **)&v63, (uint64_t)[self->_maximumValue longLongValue]);
          uint64_t v39 = 0x4170706C65496E63;
LABEL_80:
          sub_10001F184((void **)&v63, v39);
          sub_10001F184((void **)&v63, (uint64_t)[self->_stepSize longLongValue]);
        }
        break;
      case 0xAu:
        sub_10001F184((void **)&v63, 0x4170706C65496E63);
        sub_10001F184((void **)&v63, (uint64_t)[self->_factoryDefaultValue unsignedLongLongValue]);
        sub_10001F184((void **)&v63, 0x4170706C65496E63);
        sub_10001F184((void **)&v63, (uint64_t)[self->_currentValue unsignedLongLongValue]);
        *(unsigned char *)id v63 = self->_formFlag;
        id v63 = (_WORD *)((char *)v63 + 1);
        int v43 = self->_formFlag;
        if (v43 == 2)
        {
          sub_10001F0B4(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            unint64_t v61 = 0;
            v23 = 0;
            do
            {
              id v62 = v23;
              v23 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v61];

              sub_10001F184((void **)&v63, 0x4170706C65496E63);
              sub_10001F184((void **)&v63, (uint64_t)[v23 unsignedLongLongValue]);
              ++v61;
            }
            while (v61 < self->_numberOfValues);
LABEL_120:
          }
        }
        else if (v43 == 1)
        {
          sub_10001F184((void **)&v63, 0x4170706C65496E63);
          sub_10001F184((void **)&v63, (uint64_t)[self->_minimumValue unsignedLongLongValue]);
          sub_10001F184((void **)&v63, 0x4170706C65496E63);
          sub_10001F184((void **)&v63, (uint64_t)[self->_maximumValue unsignedLongLongValue]);
          uint64_t v41 = 0x4170706C65496E63;
LABEL_84:
          sub_10001F184((void **)&v63, v41);
          sub_10001F184((void **)&v63, (uint64_t)[self->_stepSize unsignedLongLongValue]);
        }
        break;
      default:
        if (self->_dataTypeCode == 0xFFFF)
        {
          sub_10001F2B8((unsigned char **)&v63, self->_factoryDefaultValue);
          sub_10001F2B8((unsigned char **)&v63, self->_currentValue);
          *(unsigned char *)id v63 = self->_formFlag;
          id v63 = (_WORD *)((char *)v63 + 1);
          if (self->_formFlag == 2)
          {
            sub_10001F0B4(&v63, self->_numberOfValues);
            if (self->_numberOfValues)
            {
              unint64_t v26 = 0;
              id v27 = v4;
              do
              {
                id v4 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v26];

                sub_10001F2B8((unsigned char **)&v63, v4);
                ++v26;
                id v27 = v4;
              }
              while (v26 < self->_numberOfValues);
            }
          }
        }
        break;
    }
    self->_dirty = 0;
  }
}

- (NSMutableData)content
{
  [(PTPDevicePropDescDataset *)self updateContent];
  content = self->_content;

  return content;
}

- (id)description
{
  uint64_t v3 = sub_100020AC0(self->_devicePropertyCode);
  id v4 = (void *)v3;
  unsigned int v5 = "RW";
  if (!self->_readWriteAttribute) {
    unsigned int v5 = "RO";
  }
  unsigned int v6 = +[NSMutableString stringWithFormat:@"<PTPDevicePropDescDataset %p>{\n  _devicePropertyCode:  %@\n  _dataTypeCode:        %u\n  _readWriteAttribute:  %s\n  _factoryDefaultValue: %@\n  _currentValue:        %@\n  _formFlag:            %u\n", self, v3, self->_dataTypeCode, v5, self->_factoryDefaultValue, self->_currentValue, self->_formFlag];

  int formFlag = self->_formFlag;
  if (formFlag == 2)
  {
    [v6 appendFormat:@"  _numberOfValues:      %u\n", self->_numberOfValues];
    if (self->_numberOfValues)
    {
      unint64_t v8 = 0;
      do
      {
        int v9 = [(NSMutableArray *)self->_supportedValues objectAtIndex:v8];
        [v6 appendFormat:@"    _supportedValue %02d: %@\n", v8, v9];

        ++v8;
      }
      while (v8 < self->_numberOfValues);
    }
  }
  else if (formFlag == 1)
  {
    [v6 appendFormat:@"  _minimumValue:        %@\n  _maximumValue:        %@\n  _stepSize:            %@\n", self->_minimumValue, self->_maximumValue, self->_stepSize];
  }
  [v6 appendString:@"}"];

  return v6;
}

- (unsigned)devicePropertyCode
{
  return self->_devicePropertyCode;
}

- (void)setDevicePropertyCode:(unsigned __int16)a3
{
  self->_devicePropertyCode = a3;
  self->_dirty = 1;
}

- (unsigned)dataTypeCode
{
  return self->_dataTypeCode;
}

- (void)setDataTypeCode:(unsigned __int16)a3
{
  self->_dataTypeCode = a3;
  self->_dirty = 1;
}

- (unsigned)readWriteAttribute
{
  return self->_readWriteAttribute;
}

- (void)setReadWriteAttribute:(unsigned __int8)a3
{
  self->_readWriteAttribute = a3;
  self->_dirty = 1;
}

- (id)factoryDefaultValue
{
  return self->_factoryDefaultValue;
}

- (void)setFactoryDefaultValue:(id)a3
{
  id v5 = a3;
  p_id factoryDefaultValue = &self->_factoryDefaultValue;
  if (self->_factoryDefaultValue != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_factoryDefaultValue, a3);
    id v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_factoryDefaultValue, v5);
}

- (id)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
  id v5 = a3;
  p_id currentValue = &self->_currentValue;
  if (self->_currentValue != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_currentValue, a3);
    id v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_currentValue, v5);
}

- (unsigned)formFlag
{
  return self->_formFlag;
}

- (void)setFormFlag:(unsigned __int8)a3
{
  self->_int formFlag = a3;
  self->_dirty = 1;
}

- (id)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  id v5 = a3;
  p_id minimumValue = &self->_minimumValue;
  if (self->_minimumValue != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_minimumValue, a3);
    id v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_minimumValue, v5);
}

- (id)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  id v5 = a3;
  p_id maximumValue = &self->_maximumValue;
  if (self->_maximumValue != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_maximumValue, a3);
    id v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_maximumValue, v5);
}

- (id)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(id)a3
{
  id v5 = a3;
  p_id stepSize = &self->_stepSize;
  if (self->_stepSize != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_stepSize, a3);
    id v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_stepSize, v5);
}

- (unsigned)numberOfValues
{
  return self->_numberOfValues;
}

- (void)setNumberOfValues:(unsigned __int16)a3
{
  self->_numberOfValues = a3;
  self->_dirty = 1;
}

- (NSMutableArray)supportedValues
{
  return self->_supportedValues;
}

- (void)setSupportedValues:(id)a3
{
  id v5 = (NSMutableArray *)a3;
  p_supportedValues = &self->_supportedValues;
  if (self->_supportedValues != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_supportedValues, a3);
    id v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_supportedValues, v5);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)readOnlyObject
{
  return self->_readOnlyObject;
}

- (void)setReadOnlyObject:(BOOL)a3
{
  self->_readOnlyObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_supportedValues, 0);
  objc_storeStrong(&self->_stepSize, 0);
  objc_storeStrong(&self->_maximumValue, 0);
  objc_storeStrong(&self->_minimumValue, 0);
  objc_storeStrong(&self->_currentValue, 0);

  objc_storeStrong(&self->_factoryDefaultValue, 0);
}

@end