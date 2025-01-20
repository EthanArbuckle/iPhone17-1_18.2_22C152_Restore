@interface ICSTimeZone
+ (BOOL)_isTimeZone:(id)a3 pseudoDSTForDate:(id)a4;
+ (BOOL)perfectMatchForSubarray:(id)a3 inTZChangeArray:(id)a4;
+ (id)blocksAfterDate:(id)a3 untilDate:(id)a4 forTimeZone:(id)a5;
+ (id)name;
+ (id)quickTimeZoneNames;
+ (id)slowTimeZoneNames;
+ (id)timeZoneWithSystemTimeZoneName:(id)a3;
+ (int64_t)matchTypeForSubarray:(id)a3 inTZChangeArray:(id)a4;
- (BOOL)isEqualToNSTimeZone:(id)a3 forDate:(id)a4;
- (ICSTimeZone)initWithSystemTimeZone:(id)a3;
- (ICSTimeZone)initWithSystemTimeZone:(id)a3 fromDate:(id)a4 options:(int)a5;
- (ICSTimeZone)initWithTimeZone:(id)a3 fromDate:(id)a4 options:(int)a5;
- (NSString)tzid;
- (id)_previousDSTTransitionForDate:(id)a3 timezone:(id)a4;
- (id)computeTimeZoneChangeListFromDate:(id)a3 toDate:(id)a4;
- (id)getNSTimeZone:(id)a3;
- (id)getNSTimeZoneFromDate:(id)a3 toDate:(id)a4;
- (id)propertiesToExcludeForChecksum;
- (id)systemTimeZoneForDate:(id)a3;
- (void)setTzid:(id)a3;
@end

@implementation ICSTimeZone

- (id)propertiesToExcludeForChecksum
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICSTimeZone_propertiesToExcludeForChecksum__block_invoke;
  block[3] = &unk_1E6C250C8;
  block[4] = self;
  if (propertiesToExcludeForChecksum_onceToken_0 != -1) {
    dispatch_once(&propertiesToExcludeForChecksum_onceToken_0, block);
  }
  return (id)propertiesToExcludeForChecksum_propertiesToExcludeForChecksum;
}

void __45__ICSTimeZone_propertiesToExcludeForChecksum__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)ICSTimeZone;
  v1 = objc_msgSendSuper2(&v5, sel_propertiesToExcludeForChecksum);
  v6[0] = @"UID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v3 = [v1 setByAddingObjectsFromArray:v2];
  v4 = (void *)propertiesToExcludeForChecksum_propertiesToExcludeForChecksum;
  propertiesToExcludeForChecksum_propertiesToExcludeForChecksum = v3;
}

+ (id)name
{
  return @"VTIMEZONE";
}

- (ICSTimeZone)initWithSystemTimeZone:(id)a3 fromDate:(id)a4 options:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  v9 = [a3 name];
  v10 = +[ICSTimeZone timeZoneWithSystemTimeZoneName:v9];
  v11 = [(ICSTimeZone *)self initWithTimeZone:v10 fromDate:v8 options:v5];

  return v11;
}

- (NSString)tzid
{
  v2 = [(ICSComponent *)self propertiesForName:@"TZID"];
  uint64_t v3 = [v2 lastObject];
  v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setTzid:(id)a3
{
}

- (id)systemTimeZoneForDate:(id)a3
{
  id v4 = a3;
  id systemTimeZone = self->_systemTimeZone;
  if (!systemTimeZone)
  {
    v6 = [(ICSTimeZone *)self getNSTimeZone:v4];
    id v7 = self->_systemTimeZone;
    self->_id systemTimeZone = v6;

    id systemTimeZone = self->_systemTimeZone;
    if (!systemTimeZone)
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
      id v9 = self->_systemTimeZone;
      self->_id systemTimeZone = v8;

      id systemTimeZone = self->_systemTimeZone;
    }
  }
  id v10 = [MEMORY[0x1E4F1CA98] null];

  if (systemTimeZone == v10) {
    id v11 = 0;
  }
  else {
    id v11 = self->_systemTimeZone;
  }

  return v11;
}

- (void).cxx_destruct
{
}

+ (id)blocksAfterDate:(id)a3 untilDate:(id)a4 forTimeZone:(id)a5
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  v162 = v8;
  v12 = [v10 nextDaylightSavingTimeTransitionAfterDate:v8];
  uint64_t v166 = *MEMORY[0x1E4F1C318];
  v171 = v9;
  v170 = v10;
  v189 = v11;
  if ([v12 compare:v9] == -1)
  {
    id v163 = a1;
    v179 = 0;
    v180 = 0;
    v172 = 0;
    v173 = 0;
    uint64_t v16 = 0;
    int v174 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v175 = 0;
    uint64_t v176 = 0;
    v19 = v12;
    while (1)
    {
      id obj = v19;
      uint64_t v20 = [v19 dateByAddingTimeInterval:1.0];
      if ([v10 isDaylightSavingTimeForDate:v20])
      {
        int v177 = 0;
        uint64_t v21 = 1;
      }
      else
      {
        uint64_t v21 = [v163 _isTimeZone:v10 pseudoDSTForDate:v20];
        int v177 = v21;
      }
      v190 = [v10 abbreviationForDate:v20];
      v22 = [obj dateByAddingTimeInterval:-1.0];
      uint64_t v23 = [v10 secondsFromGMTForDate:v22];

      uint64_t v24 = [v10 secondsFromGMTForDate:v20];
      v182 = (void *)v20;
      if ([v11 count] && v23 == v24)
      {
        uint64_t v186 = v18;
        uint64_t v14 = v17;
        uint64_t v15 = v16;
        v25 = obj;
        goto LABEL_59;
      }
      uint64_t v184 = v23;
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v166];
      v27 = v180;
      if (v21) {
        v27 = v179;
      }
      id v28 = v27;
      uint64_t v186 = v24;
      if (!v28) {
        break;
      }
      v29 = v28;
      v30 = [v28 dtstart];
      v31 = [v30 value];

      [v26 setTimeZone:v10];
      v32 = [v31 components];
      v33 = [v26 dateFromComponents:v32];

      uint64_t v34 = v176;
      if (!v21) {
        uint64_t v34 = v175;
      }
      uint64_t v164 = v34;
      if (!v33)
      {
        id v28 = v29;
LABEL_22:
        v29 = v28;
        [0 day];
        v33 = 0;
        v169 = 0;
        goto LABEL_23;
      }
      v35 = (void *)MEMORY[0x1E4F1CAF0];
      v36 = [v33 dateByAddingTimeInterval:-1.0];
      v37 = objc_msgSend(v35, "timeZoneForSecondsFromGMT:", objc_msgSend(v10, "secondsFromGMTForDate:", v36));
      [v26 setTimeZone:v37];

      v38 = [v26 components:1788 fromDate:v33];
      [v26 rangeOfUnit:16 inUnit:8 forDate:v33];
      v169 = v38;
      if ([v38 day] + 7 > v39) {
        [v38 setWeekdayOrdinal:-1];
      }
LABEL_23:
      v167 = v33;
      v41 = (void *)MEMORY[0x1E4F1CAF0];
      v25 = obj;
      v42 = [obj dateByAddingTimeInterval:-1.0];
      v43 = objc_msgSend(v41, "timeZoneForSecondsFromGMT:", objc_msgSend(v10, "secondsFromGMTForDate:", v42));
      [v26 setTimeZone:v43];

      v168 = v26;
      uint64_t v44 = v21;
      if (obj)
      {
        v45 = [v26 components:1788 fromDate:obj];
        [v26 rangeOfUnit:16 inUnit:8 forDate:obj];
        uint64_t v46 = v184;
        v48 = v45;
        if ([v45 day] + 7 > v47) {
          [v45 setWeekdayOrdinal:-1];
        }
      }
      else
      {
        [0 day];
        v48 = 0;
        uint64_t v46 = v184;
      }
      if (v46 == [v29 tzoffsetfrom]
        && v186 == [v29 tzoffsetto]
        && ((v177 ^ 1 | v174) & 1) != 0)
      {
        v161 = v29;
        v49 = [v29 tzname];
        v50 = [v49 lastObject];
        if ([v190 isEqualToString:v50]
          && [v48 year] == v164 + 1
          && (uint64_t v51 = [v48 month], v51 == objc_msgSend(v169, "month"))
          && (uint64_t v52 = [v48 weekday], v52 == objc_msgSend(v169, "weekday"))
          && (uint64_t v53 = [v48 weekdayOrdinal], v53 == objc_msgSend(v169, "weekdayOrdinal"))
          && (uint64_t v54 = [v48 hour], v54 == objc_msgSend(v169, "hour")))
        {
          uint64_t v55 = [v48 minute];
          uint64_t v56 = [v169 minute];

          BOOL v57 = v55 == v56;
          v29 = v161;
          if (v57)
          {
            v58 = [v161 rrule];
            uint64_t v59 = [v58 count];

            if (!v59)
            {
              v60 = [[ICSRecurrenceRule alloc] initWithFrequency:7];
              v61 = (void *)MEMORY[0x1E4F1C978];
              v62 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v48, "month"));
              v63 = [v61 arrayWithObject:v62];
              [(ICSRecurrenceRule *)v60 setBymonth:v63];

              id objb = (id)MEMORY[0x1E4F1C978];
              v165 = [ICSByDayValue alloc];
              uint64_t v64 = [v48 weekday];
              v65 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v48, "weekdayOrdinal"));
              v66 = [(ICSByDayValue *)v165 initWithWeekday:v64 number:v65];
              v67 = [objb arrayWithObject:v66];
              [(ICSRecurrenceRule *)v60 setByday:v67];

              v68 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v60, 0);
              [v161 setRrule:v68];

              [v161 setRdate:0];
            }
            v69 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
            [v168 setTimeZone:v69];

            v70 = v173;
            uint64_t v15 = v44;
            if (v25)
            {
              v71 = [v168 components:764 fromDate:v25];
            }
            else
            {
              v71 = 0;
            }
            v88 = v190;
            v90 = [(ICSDateTimeValue *)[ICSDateTimeUTCValue alloc] initWithYear:[(ICSDate *)v71 year] month:[(ICSDate *)v71 month] day:[(ICSDate *)v71 day] hour:[(ICSDate *)v71 hour] minute:[(ICSDate *)v71 minute] second:[(ICSDate *)v71 second]];
            v86 = v161;
            id objc = [v161 rrule];
            v98 = [objc objectAtIndex:0];

            [v98 setUntil:v90];
            goto LABEL_51;
          }
        }
        else
        {
        }
      }
      uint64_t v72 = v44;
      v73 = off_1E6C24E30;
      if (!v44) {
        v73 = off_1E6C24E38;
      }
      id v74 = objc_alloc_init(*v73);
      if (v44) {
        id v75 = v180;
      }
      else {
        id v75 = v74;
      }
      id v76 = v179;
      if (v44) {
        id v76 = v74;
      }
      v179 = v76;
      v180 = v75;
      v77 = v29;
      v78 = [ICSDate alloc];
      uint64_t v79 = [v48 year];
      uint64_t v80 = [v48 month];
      uint64_t v81 = [v48 day];
      uint64_t v82 = [v48 hour];
      uint64_t v83 = [v48 minute];
      uint64_t v84 = [v48 second];
      uint64_t v85 = v81;
      v86 = v77;
      uint64_t v87 = v83;
      id v10 = v170;
      v71 = [(ICSDate *)v78 initWithYear:v79 month:v80 day:v85 hour:v82 minute:v87 second:v84];
      [v74 setDtstart:v71];
      v88 = v190;
      v89 = [MEMORY[0x1E4F1C978] arrayWithObject:v190];
      [v74 setTzname:v89];

      [v74 setTzoffsetfrom:v184];
      uint64_t v15 = v72;
      v25 = obj;
      [v74 setTzoffsetto:v186];
      [v74 addRecurrenceDate:v71];
      v90 = (ICSDateTimeUTCValue *)v74;

      [v189 addObject:v90];
      v70 = v173;
LABEL_51:

      uint64_t v91 = [v48 year];
      int v92 = v174;
      if (v15) {
        int v92 = v177;
      }
      int v174 = v92;
      if (v15) {
        uint64_t v93 = v175;
      }
      else {
        uint64_t v93 = v91;
      }
      uint64_t v94 = v176;
      if (v15) {
        uint64_t v94 = v91;
      }
      uint64_t v175 = v93;
      uint64_t v176 = v94;
      id v95 = v48;

      id v96 = v88;
      v172 = v95;
      v173 = v96;
      uint64_t v14 = v184;
      id v11 = v189;
LABEL_59:
      v12 = [v10 nextDaylightSavingTimeTransitionAfterDate:v182];
      if ([v12 compare:v25] != 1)
      {

        v12 = v25;
        uint64_t v13 = v186;
        goto LABEL_65;
      }

      uint64_t v97 = [v12 compare:v171];
      v19 = v12;
      uint64_t v16 = v15;
      uint64_t v17 = v14;
      uint64_t v13 = v186;
      uint64_t v18 = v186;
      if (v97 != -1) {
        goto LABEL_65;
      }
    }
    uint64_t v40 = v176;
    if (!v21) {
      uint64_t v40 = v175;
    }
    uint64_t v164 = v40;
    goto LABEL_22;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  LOBYTE(v174) = 0;
  LOBYTE(v15) = 0;
  v172 = 0;
  v173 = 0;
  v179 = 0;
  v180 = 0;
LABEL_65:
  uint64_t v187 = v13;
  if ((v174 & 1) != 0 && (v15 & 1) == 0) {
    [v11 removeAllObjects];
  }
  v183 = v12;
  uint64_t v185 = v14;
  char v178 = v15;

  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id obja = (id)[v11 copy];
  uint64_t v99 = [obja countByEnumeratingWithState:&v197 objects:v202 count:16];
  if (!v99)
  {
    v101 = 0;
    v102 = 0;
    goto LABEL_93;
  }
  uint64_t v100 = v99;
  v101 = 0;
  v102 = 0;
  uint64_t v103 = *(void *)v198;
  do
  {
    for (uint64_t i = 0; i != v100; ++i)
    {
      if (*(void *)v198 != v103) {
        objc_enumerationMutation(obja);
      }
      v105 = *(void **)(*((void *)&v197 + 1) + 8 * i);
      v106 = [v105 rrule];
      uint64_t v107 = [v106 count];

      if (!v107)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v108 = v102;
        }
        else {
          v108 = v101;
        }
        id v109 = v108;
        v110 = [v109 rrule];
        uint64_t v111 = [v110 count];

        if (!v111)
        {
          uint64_t v112 = [v109 tzoffsetfrom];
          if (v112 == [v105 tzoffsetfrom])
          {
            uint64_t v113 = [v109 tzoffsetto];
            if (v113 == [v105 tzoffsetto])
            {
              v114 = [v109 tzname];
              v115 = [v105 tzname];
              char v191 = [v114 isEqualToArray:v115];

              if (v191)
              {
                v116 = [v105 dtstart];
                [v109 addRecurrenceDate:v116];

                [v189 removeObjectIdenticalTo:v105];
                goto LABEL_89;
              }
            }
          }
        }
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v118 = v105;
      if (isKindOfClass) {
        id v109 = v102;
      }
      else {
        id v109 = v101;
      }
      if (isKindOfClass) {
        v102 = v118;
      }
      else {
        v101 = v118;
      }
LABEL_89:
    }
    uint64_t v100 = [obja countByEnumeratingWithState:&v197 objects:v202 count:16];
  }
  while (v100);
LABEL_93:

  v119 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v166];
  v120 = [MEMORY[0x1E4F1C9C8] date];
  v192 = v119;
  v121 = [v119 components:4 fromDate:v120];

  v122 = [v102 rrule];
  uint64_t v123 = [v122 count];

  v124 = v170;
  v125 = v183;
  if (v123)
  {
    v126 = [v102 rrule];
    v127 = [v126 objectAtIndex:0];

    v128 = [v127 until];
    uint64_t v129 = [v128 year];
    if (v129 > [v121 year] + 10)
    {
      [v127 setCount:0];
      [v127 setUntil:0];
    }
  }
  v130 = [v101 rrule];
  uint64_t v131 = [v130 count];

  if (v131)
  {
    v132 = [v101 rrule];
    v133 = [v132 objectAtIndex:0];

    v134 = [v133 until];
    uint64_t v135 = [v134 year];
    if (v135 > [v121 year] + 10)
    {
      [v133 setCount:0];
      [v133 setUntil:0];
    }
  }
  v181 = v121;
  id v136 = [v102 rrule];
  if (![v136 count]) {
    goto LABEL_111;
  }
  v137 = [v101 rrule];
  uint64_t v138 = [v137 count];

  if (v138)
  {
    id v136 = [v102 rrule];
    v139 = [v136 objectAtIndex:0];
    uint64_t v140 = [(ICSDate *)v139 until];
    if (!v140) {
      goto LABEL_110;
    }
    v141 = (void *)v140;
    v142 = [v101 rrule];
    v143 = [v142 objectAtIndex:0];
    v144 = [v143 until];

    v125 = v183;
    if (v144)
    {
      v145 = off_1E6C24E30;
      if ((v178 & 1) == 0) {
        v145 = off_1E6C24E38;
      }
      id v136 = objc_alloc_init(*v145);
      v139 = -[ICSDate initWithYear:month:day:hour:minute:second:]([ICSDate alloc], "initWithYear:month:day:hour:minute:second:", [v172 year], objc_msgSend(v172, "month"), objc_msgSend(v172, "day"), objc_msgSend(v172, "hour"), objc_msgSend(v172, "minute"), objc_msgSend(v172, "second"));
      [v136 setDtstart:v139];
      if (v173)
      {
        v201 = v173;
        v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
        [v136 setTzname:v146];
      }
      [v136 setTzoffsetfrom:v185];
      [v136 setTzoffsetto:v187];
      [v189 addObject:v136];
LABEL_110:

      v125 = v183;
LABEL_111:
    }
  }
  v147 = v189;
  if (![v189 count])
  {
    v148 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v166];
    v149 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    v188 = v148;
    [v148 setTimeZone:v149];

    uint64_t v150 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    v151 = v148;
    v152 = (void *)v150;
    v153 = objc_msgSend(v151, "components:fromDate:", 252);
    v154 = -[ICSDate initWithYear:month:day:hour:minute:second:]([ICSDate alloc], "initWithYear:month:day:hour:minute:second:", [v153 year], objc_msgSend(v153, "month"), objc_msgSend(v153, "day"), objc_msgSend(v153, "hour"), objc_msgSend(v153, "minute"), objc_msgSend(v153, "second"));
    v155 = objc_alloc_init(ICSTimeZoneStandardBlock);
    [(ICSTimeZoneBlock *)v155 setDtstart:v154];
    v156 = (void *)MEMORY[0x1E4F1C978];
    v157 = [v170 abbreviationForDate:v152];
    v158 = [v156 arrayWithObject:v157];
    [(ICSTimeZoneBlock *)v155 setTzname:v158];

    v125 = v183;
    -[ICSTimeZoneBlock setTzoffsetfrom:](v155, "setTzoffsetfrom:", [v170 secondsFromGMTForDate:v162]);
    -[ICSTimeZoneBlock setTzoffsetto:](v155, "setTzoffsetto:", [v170 secondsFromGMTForDate:v162]);
    [v189 addObject:v155];

    v147 = v189;
    v124 = v170;
  }
  id v159 = v147;

  return v159;
}

+ (BOOL)_isTimeZone:(id)a3 pseudoDSTForDate:(id)a4
{
  id v5 = a4;
  v6 = [a3 name];
  int v7 = [v6 isEqualToString:@"Europe/Moscow"];

  if (v7)
  {
    if (_isTimeZone_pseudoDSTForDate__onceToken != -1) {
      dispatch_once(&_isTimeZone_pseudoDSTForDate__onceToken, &__block_literal_global_1);
    }
    id v8 = [(id)_isTimeZone_pseudoDSTForDate__beginEffectiveDST laterDate:v5];
    if (v8 == v5)
    {
      id v9 = [(id)_isTimeZone_pseudoDSTForDate__endEffectiveDST earlierDate:v5];
      LOBYTE(v7) = v9 == v5;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

uint64_t __64__ICSTimeZone_TimeZoneGeneration___isTimeZone_pseudoDSTForDate___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1301180400.0];
  v1 = (void *)_isTimeZone_pseudoDSTForDate__beginEffectiveDST;
  _isTimeZone_pseudoDSTForDate__beginEffectiveDST = v0;

  _isTimeZone_pseudoDSTForDate__endEffectiveDST = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1414274400.0];
  return MEMORY[0x1F41817F8]();
}

- (ICSTimeZone)initWithSystemTimeZone:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICSComponent *)self init];
  if (v5)
  {
    v6 = [v4 name];
    [(ICSTimeZone *)v5 setTzid:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    id v8 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    id v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    id v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v9 setTimeZone:v10];

    [v7 setYear:1900];
    id v11 = [v9 dateFromComponents:v7];
    [v7 setYear:2050];
    v12 = [v9 dateFromComponents:v7];
    uint64_t v13 = +[ICSTimeZone blocksAfterDate:v11 untilDate:v12 forTimeZone:v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [(ICSComponent *)v5 addComponent:*(void *)(*((void *)&v19 + 1) + 8 * v17++) withUIDGenerator:0];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
  return v5;
}

- (ICSTimeZone)initWithTimeZone:(id)a3 fromDate:(id)a4 options:(int)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v49 = a4;
  id v9 = [(ICSComponent *)self init];
  if (v9)
  {
    id v10 = [v8 tzid];
    [(ICSTimeZone *)v9 setTzid:v10];

    uint64_t v51 = [MEMORY[0x1E4F1CA80] set];
    int v50 = a5;
    id v46 = v8;
    if (a5 == 1)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      v12 = (void *)[v11 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
      [v12 setTimeZone:v13];

      id v54 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v54 setYear:2050];
      uint64_t v14 = v12;
      uint64_t v52 = [v12 dateFromComponents:v54];
      uint64_t v15 = (void *)MEMORY[0x1E4F1CAF0];
      uint64_t v16 = [v8 tzid];
      uint64_t v17 = [v15 timeZoneWithName:v16];

      a5 = 1;
      uint64_t v18 = objc_opt_new();
      objc_msgSend(v18, "setYear:", objc_msgSend(v49, "year"));
      objc_msgSend(v18, "setMonth:", objc_msgSend(v49, "month"));
      objc_msgSend(v18, "setDay:", objc_msgSend(v49, "day"));
      objc_msgSend(v18, "setHour:", objc_msgSend(v49, "hour"));
      objc_msgSend(v18, "setMinute:", objc_msgSend(v49, "minute"));
      objc_msgSend(v18, "setSecond:", objc_msgSend(v49, "second"));
      [v18 setTimeZone:v17];
      long long v19 = v14;
      long long v20 = [v14 dateFromComponents:v18];
      long long v21 = [(ICSTimeZone *)v9 _previousDSTTransitionForDate:v20 timezone:v17];
      long long v22 = [v21 dateByAddingTimeInterval:-1.0];
      uint64_t v23 = +[ICSTimeZone blocksAfterDate:v22 untilDate:v52 forTimeZone:v17];

      unint64_t v24 = 1;
    }
    else
    {
      uint64_t v23 = [v8 components];
      unint64_t v24 = -1;
    }
    if (objc_msgSend(v23, "count", v46))
    {
      unint64_t v25 = 0;
      unint64_t v53 = 0;
      unint64_t v55 = 0;
      unint64_t v26 = 0x1E6C24000;
      unint64_t v48 = v24;
      while (1)
      {
        v27 = [v23 objectAtIndex:v25];
        if (++v25 >= [v23 count])
        {
          v32 = 0;
        }
        else
        {
          unint64_t v28 = v25;
          while (1)
          {
            uint64_t v29 = objc_opt_class();
            v30 = [v23 objectAtIndex:v28];
            uint64_t v31 = objc_opt_class();

            if (v29 == v31) {
              break;
            }
            if (++v28 >= [v23 count])
            {
              v32 = 0;
              goto LABEL_14;
            }
          }
          v33 = [v23 objectAtIndex:v28];
          uint64_t v34 = [v33 dtstart];
          v32 = [v34 value];

LABEL_14:
          unint64_t v26 = 0x1E6C24000uLL;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v35 = objc_msgSend(objc_alloc(*(Class *)(v26 + 3368)), "initWithYear:month:day:hour:minute:second:", objc_msgSend(v32, "year"), objc_msgSend(v32, "month"), objc_msgSend(v32, "day"), objc_msgSend(v32, "hour"), objc_msgSend(v32, "minute"), objc_msgSend(v32, "second"));
          v36 = v35;
          if (v35)
          {
            a5 = v50;
            unint64_t v24 = v48;
            unint64_t v26 = 0x1E6C24000;
            if ([v35 compare:v49] != 1) {
              goto LABEL_35;
            }
          }
          else
          {
            a5 = v50;
            unint64_t v24 = v48;
            unint64_t v26 = 0x1E6C24000;
          }
        }
        else
        {
          v36 = 0;
        }
        if (a5 == 2)
        {
          [v51 addObject:v27];
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_30;
        }
        unint64_t v38 = v55;
        if (v55 < v24)
        {
          ++v55;
LABEL_29:
          [v51 addObject:v27];
LABEL_30:
          unint64_t v38 = v55;
        }
        unint64_t v37 = v53;
LABEL_33:
        unint64_t v53 = v37;
        unint64_t v55 = v38;
        if (v37 == v24 && v38 == v24)
        {

          goto LABEL_38;
        }
LABEL_35:

        if (v25 >= [v23 count]) {
          goto LABEL_38;
        }
      }
      unint64_t v37 = v53;
      if (v53 >= v24)
      {
        unint64_t v38 = v55;
        goto LABEL_33;
      }
      ++v53;
      goto LABEL_29;
    }
LABEL_38:
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v39 = [v51 allObjects];
    uint64_t v40 = [v39 sortedArrayUsingSelector:sel_compare_];

    uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          [(ICSComponent *)v9 addComponent:*(void *)(*((void *)&v56 + 1) + 8 * i) withUIDGenerator:0];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v42);
    }

    id v8 = v47;
  }

  return v9;
}

- (id)_previousDSTTransitionForDate:(id)a3 timezone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v8 setTimeZone:v6];
  id v9 = [v8 dateByAddingUnit:4 value:-1 toDate:v5 options:1];
  id v10 = [v8 timeZone];
  id v11 = [v10 nextDaylightSavingTimeTransitionAfterDate:v9];

  id v12 = v11;
  uint64_t v13 = [v12 earlierDate:v5];
  int v14 = [v13 isEqualToDate:v12];

  uint64_t v15 = v12;
  if (!v14) {
    goto LABEL_4;
  }
  do
  {
    uint64_t v16 = v12;
    id v12 = v15;

    uint64_t v17 = [v8 timeZone];
    uint64_t v15 = [v17 nextDaylightSavingTimeTransitionAfterDate:v12];

    uint64_t v18 = [v15 earlierDate:v5];
    char v19 = [v18 isEqualToDate:v15];
  }
  while ((v19 & 1) != 0);
  if ((v14 & 1) == 0)
  {
LABEL_4:
    long long v20 = [v8 components:252 fromDate:v5];
    [v20 setMonth:1];
    [v20 setDay:1];
    long long v21 = [v8 dateFromComponents:v20];
    long long v22 = [v8 timeZone];
    uint64_t v23 = [v22 nextDaylightSavingTimeTransitionAfterDate:v21];

    id v12 = (id)v23;
  }

  return v12;
}

+ (id)timeZoneWithSystemTimeZoneName:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = (void *)_sCache;
  if (!_sCache)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = (void *)_sCache;
    _sCache = (uint64_t)v7;

    id v6 = (void *)_sCache;
  }
  id v9 = [v6 objectForKey:v4];
  if (!v9)
  {
    id v10 = [ICSTimeZone alloc];
    id v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v4];
    id v9 = [(ICSTimeZone *)v10 initWithSystemTimeZone:v11];

    [(id)_sCache setObject:v9 forKey:v4];
  }
  objc_sync_exit(v5);

  return v9;
}

- (BOOL)isEqualToNSTimeZone:(id)a3 forDate:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    unint64_t v24 = self;
    id v8 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", [v7 year] - 1, objc_msgSend(v7, "month"), objc_msgSend(v7, "day"), objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), objc_msgSend(v7, "second"));
    id v9 = [ICSDateTimeValue alloc];
    uint64_t v10 = [v7 year] + 1;
    uint64_t v11 = [v7 month];
    uint64_t v12 = [v7 day];
    uint64_t v13 = [v7 hour];
    uint64_t v14 = [v7 minute];
    uint64_t v15 = [v7 second];

    uint64_t v16 = [(ICSDateTimeValue *)v9 initWithYear:v10 month:v11 day:v12 hour:v13 minute:v14 second:v15];
    uint64_t v17 = [(ICSTimeZone *)v24 computeTimeZoneChangeListFromDate:v8 toDate:v16];
    uint64_t v18 = [v6 ICSComputeTimeZoneChangeListFromDate:v8 toDate:v16];
    char v19 = [v18 ICSContainsArray:v17];
    if ((v19 & 1) == 0)
    {
      long long v20 = logHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        long long v22 = [v6 name];
        uint64_t v23 = [(ICSComponent *)v24 ICSStringWithOptions:0];
        *(_DWORD *)buf = 138413570;
        unint64_t v26 = v22;
        __int16 v27 = 2112;
        unint64_t v28 = v8;
        __int16 v29 = 2112;
        v30 = v16;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 2112;
        uint64_t v34 = v18;
        __int16 v35 = 2112;
        v36 = v23;
        _os_log_error_impl(&dword_1DB9BF000, v20, OS_LOG_TYPE_ERROR, "VTIMEZONE does not match System Time Zone (%@) for %@ to %@: %@ != %@\n\n%@", buf, 0x3Eu);
      }
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (id)getNSTimeZoneFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v53 = a4;
  id v54 = self;
  id v6 = [(ICSTimeZone *)self tzid];
  id v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v6];
  if (v7 && [v6 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v7;
    id v15 = v12;
    goto LABEL_40;
  }
  id v8 = [(ICSTimeZone *)self computeTimeZoneChangeListFromDate:v52 toDate:v53];
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x3032000000;
  id v76 = __Block_byref_object_copy_;
  v77 = __Block_byref_object_dispose_;
  id v78 = 0;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __54__ICSTimeZone_Internal__getNSTimeZoneFromDate_toDate___block_invoke;
  v67[3] = &unk_1E6C25A50;
  id v9 = v52;
  id v68 = v9;
  id v10 = v53;
  id v69 = v10;
  v70 = self;
  id v51 = v8;
  id v71 = v51;
  uint64_t v72 = &v73;
  uint64_t v11 = (uint64_t (**)(void, void))MEMORY[0x1E01966B0](v67);
  id v12 = [MEMORY[0x1E4F1CAF0] systemTimeZone];

  if (!((uint64_t (**)(void, id))v11)[2](v11, v12))
  {
    uint64_t v16 = [(ICSTimeZone *)self tzid];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v14 = v6;
    }
    else
    {
      uint64_t v18 = [(ICSTimeZone *)v54 tzid];
      id v14 = +[ICSTimeZoneTranslator timeZoneNameForNonstandardTimeZone:v18];

      if (v14)
      {
        char v19 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v14];

        if (v19)
        {
          if ((((uint64_t (**)(void, void *))v11)[2](v11, v19) & 1) == 0)
          {
            long long v20 = logHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v49 = [(ICSComponent *)v54 ICSStringWithOptions:0];
              *(_DWORD *)buf = 138413314;
              id v83 = v14;
              __int16 v84 = 2112;
              id v85 = v9;
              __int16 v86 = 2112;
              id v87 = v10;
              __int16 v88 = 2112;
              id v89 = v51;
              __int16 v90 = 2112;
              uint64_t v91 = v49;
              _os_log_error_impl(&dword_1DB9BF000, v20, OS_LOG_TYPE_ERROR, "VTIMEZONE does not match System Time Zone (%@) for %@ to %@: %@\n\n%@", buf, 0x34u);
            }
          }
          id v13 = v19;
          id v12 = v13;
          goto LABEL_5;
        }
        id v12 = 0;
      }
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v21 = [(id)objc_opt_class() quickTimeZoneNames];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v81 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v64;
      while (2)
      {
        uint64_t v24 = 0;
        unint64_t v25 = v12;
        unint64_t v26 = v14;
        do
        {
          if (*(void *)v64 != v23) {
            objc_enumerationMutation(v21);
          }
          id v14 = *(id *)(*((void *)&v63 + 1) + 8 * v24);

          id v12 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v14];

          if (((uint64_t (**)(void, id))v11)[2](v11, v12))
          {
            id v12 = v12;

            goto LABEL_38;
          }
          ++v24;
          unint64_t v25 = v12;
          unint64_t v26 = v14;
        }
        while (v22 != v24);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v81 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    __int16 v27 = [(id)objc_opt_class() slowTimeZoneNames];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v80 count:16];
    if (v28)
    {
      id v14 = 0;
      uint64_t v29 = *(void *)v60;
      while (2)
      {
        uint64_t v30 = 0;
        __int16 v31 = v12;
        v32 = v14;
        do
        {
          if (*(void *)v60 != v29) {
            objc_enumerationMutation(v27);
          }
          id v14 = *(id *)(*((void *)&v59 + 1) + 8 * v30);

          id v12 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v14];

          if (((uint64_t (**)(void, id))v11)[2](v11, v12))
          {
            id v12 = v12;

            goto LABEL_38;
          }
          ++v30;
          __int16 v31 = v12;
          v32 = v14;
        }
        while (v28 != v30);
        uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v80 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    __int16 v33 = (void *)v74[5];
    if (v33)
    {
      id v15 = v33;
      id v14 = 0;
    }
    else
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      __int16 v35 = [(id)objc_opt_class() quickTimeZoneNames];
      v36 = [(id)objc_opt_class() slowTimeZoneNames];
      id obj = [v35 arrayByAddingObjectsFromArray:v36];

      uint64_t v37 = [obj countByEnumeratingWithState:&v55 objects:v79 count:16];
      if (v37)
      {
        id v14 = 0;
        uint64_t v38 = *(void *)v56;
        while (2)
        {
          uint64_t v39 = v37;
          uint64_t v40 = 0;
          uint64_t v41 = v12;
          uint64_t v42 = v14;
          do
          {
            if (*(void *)v56 != v38) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(id *)(*((void *)&v55 + 1) + 8 * v40);

            id v12 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v14];

            uint64_t v43 = [MEMORY[0x1E4F1CA20] currentLocale];
            uint64_t v44 = [v12 localizedName:0 locale:v43];
            v45 = [(ICSTimeZone *)v54 tzid];
            char v46 = [v44 isEqualToString:v45];

            if (v46)
            {
              id v12 = v12;

              goto LABEL_38;
            }
            ++v40;
            uint64_t v41 = v12;
            uint64_t v42 = v14;
          }
          while (v39 != v40);
          uint64_t v37 = [obj countByEnumeratingWithState:&v55 objects:v79 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }
      if ([v51 count] == 1)
      {
        uint64_t v47 = [v51 objectAtIndex:0];
        unint64_t v48 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", objc_msgSend(v47, "tzOffsetTo"));

        id v12 = v48;
        id v14 = 0;
LABEL_38:
        id v15 = v12;
      }
      else
      {
        id v14 = 0;
        id v15 = 0;
      }
    }
    goto LABEL_39;
  }
  id v13 = v12;
  id v12 = v13;
  id v14 = v6;
LABEL_5:
  id v15 = v13;
LABEL_39:

  _Block_object_dispose(&v73, 8);
  id v6 = v14;
LABEL_40:

  return v15;
}

uint64_t __54__ICSTimeZone_Internal__getNSTimeZoneFromDate_toDate___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 ICSComputeTimeZoneChangeListFromDate:a1[4] toDate:a1[5]];
    uint64_t v7 = [(id)objc_opt_class() matchTypeForSubarray:a1[7] inTZChangeArray:v6];
    if (v7 == 2)
    {
      uint64_t v11 = 1;
    }
    else
    {
      if (v7 == 1)
      {
        uint64_t v8 = *(void *)(a1[8] + 8);
        uint64_t v10 = *(void *)(v8 + 40);
        id v9 = (id *)(v8 + 40);
        if (!v10) {
          objc_storeStrong(v9, a2);
        }
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)quickTimeZoneNames
{
  if (quickTimeZoneNames_onceToken != -1) {
    dispatch_once(&quickTimeZoneNames_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)quickTimeZoneNames__quickTimeZoneNames;
  return v2;
}

void __43__ICSTimeZone_Internal__quickTimeZoneNames__block_invoke()
{
  uint64_t v0 = (void *)quickTimeZoneNames__quickTimeZoneNames;
  quickTimeZoneNames__quickTimeZoneNames = (uint64_t)&unk_1F360C200;
}

+ (id)slowTimeZoneNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (slowTimeZoneNames_onceToken != -1) {
    dispatch_once(&slowTimeZoneNames_onceToken, block);
  }
  v2 = (void *)slowTimeZoneNames__slowTimeZones;
  return v2;
}

void __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  v2 = [*(id *)(a1 + 32) quickTimeZoneNames];
  uint64_t v3 = [v1 setWithArray:v2];

  id v4 = [MEMORY[0x1E4F1CAF0] knownTimeZoneNames];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke_2;
  v9[3] = &unk_1E6C25A78;
  id v10 = v3;
  id v5 = v3;
  id v6 = [v4 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [v4 objectsAtIndexes:v6];
  uint64_t v8 = (void *)slowTimeZoneNames__slowTimeZones;
  slowTimeZoneNames__slowTimeZones = v7;
}

uint64_t __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)getNSTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", [v4 year] - 1, objc_msgSend(v4, "month"), objc_msgSend(v4, "day"), objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"));
  id v6 = [ICSDateTimeValue alloc];
  uint64_t v7 = [v4 year] + 1;
  uint64_t v8 = [v4 month];
  uint64_t v9 = [v4 day];
  uint64_t v10 = [v4 hour];
  uint64_t v11 = [v4 minute];
  uint64_t v12 = [v4 second];

  id v13 = [(ICSDateTimeValue *)v6 initWithYear:v7 month:v8 day:v9 hour:v10 minute:v11 second:v12];
  id v14 = [(ICSTimeZone *)self getNSTimeZoneFromDate:v5 toDate:v13];

  return v14;
}

+ (BOOL)perfectMatchForSubarray:(id)a3 inTZChangeArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count]
    && (unint64_t v7 = [v5 count], v7 <= objc_msgSend(v6, "count"))
    && ([v5 objectAtIndex:0],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v6 indexOfObject:v8],
        v8,
        v9 != 0x7FFFFFFFFFFFFFFFLL)
    && (unint64_t v10 = [v5 count] + v9, v10 <= objc_msgSend(v6, "count")))
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v13 = 1;
      do
      {
        id v14 = [v5 objectAtIndex:v13];
        id v15 = [v6 objectAtIndex:v9 + v13];
        char v11 = [v14 isEqual:v15];

        if ((v11 & 1) == 0) {
          break;
        }
        ++v13;
      }
      while (v13 < [v5 count]);
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (int64_t)matchTypeForSubarray:(id)a3 inTZChangeArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 perfectMatchForSubarray:v6 inTZChangeArray:v7])
  {
    int64_t v8 = 2;
  }
  else
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 tzOffsetTo];

    char v11 = [v6 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 tzOffsetTo];

    if ([v7 count])
    {
      unint64_t v13 = 0;
      unint64_t v14 = 0;
      BOOL v15 = 0;
      LOBYTE(v16) = 0;
      do
      {
        BOOL v17 = [v7 objectAtIndexedSubscript:v13];
        uint64_t v18 = v17;
        BOOL v16 = v16 || [v17 tzOffsetTo] != v10;
        if (v14 < [v6 count])
        {
          char v19 = [v6 objectAtIndexedSubscript:v14];
          if ([v18 isCloseTo:v19])
          {
            ++v14;
            BOOL v15 = v15 || [v19 tzOffsetTo] != v12;
          }
          else if (v14)
          {

            int64_t v8 = 0;
            goto LABEL_20;
          }
        }
        ++v13;
      }
      while (v13 < [v7 count]);
      int v20 = v16 ^ v15;
    }
    else
    {
      unint64_t v14 = 0;
      int v20 = 0;
    }
    int64_t v8 = (v14 != 0) & (v20 ^ 1u);
  }
LABEL_20:

  return v8;
}

- (id)computeTimeZoneChangeListFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v55 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v52 = self;
  id obj = [(ICSComponent *)self components];
  uint64_t v7 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 computeTimeZoneChangeListFromDate:v54 toDate:v55];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v70 objects:v81 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v71;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v71 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v70 + 1) + 8 * j);
                if (([v6 containsObject:v17] & 1) == 0) {
                  [v6 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v70 objects:v81 count:16];
            }
            while (v14);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
    }
    while (v8);
  }

  if (![v6 count])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v18 = [(ICSComponent *)v52 components];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id obja = 0;
      long long v21 = 0;
      uint64_t v22 = *(void *)v67;
      uint64_t v48 = *(void *)v67;
      id v49 = v18;
      do
      {
        uint64_t v23 = 0;
        uint64_t v50 = v20;
        do
        {
          if (*(void *)v67 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void **)(*((void *)&v66 + 1) + 8 * v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v25 = [v24 dtstart];
            unint64_t v26 = [v25 value];

            if ([v26 compare:v55] == -1)
            {
              id v51 = v26;
              uint64_t v53 = v23;
              if (!v21 || [v26 compare:v21] == 1)
              {
                id v27 = v26;

                id obja = (id)[v24 tzoffsetto];
                long long v21 = v27;
              }
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              uint64_t v28 = objc_msgSend(v24, "rrule", v48, v49);
              uint64_t v29 = [v28 countByEnumeratingWithState:&v62 objects:v79 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v63;
                do
                {
                  for (uint64_t k = 0; k != v30; ++k)
                  {
                    if (*(void *)v63 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    __int16 v33 = *(void **)(*((void *)&v62 + 1) + 8 * k);
                    uint64_t v34 = [v33 until];
                    uint64_t v35 = [v34 compare:v21];

                    if (v35 == 1)
                    {
                      uint64_t v36 = [v33 until];

                      id obja = (id)[v24 tzoffsetto];
                      long long v21 = (void *)v36;
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v62 objects:v79 count:16];
                }
                while (v30);
              }

              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              uint64_t v37 = [v24 rdate];
              uint64_t v38 = [v37 countByEnumeratingWithState:&v58 objects:v78 count:16];
              if (v38)
              {
                uint64_t v39 = v38;
                uint64_t v40 = *(void *)v59;
                do
                {
                  for (uint64_t m = 0; m != v39; ++m)
                  {
                    if (*(void *)v59 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    uint64_t v42 = *(void **)(*((void *)&v58 + 1) + 8 * m);
                    uint64_t v43 = [v42 value];
                    uint64_t v44 = [v43 compare:v21];

                    if (v44 == 1)
                    {
                      uint64_t v45 = [v42 value];

                      id obja = (id)[v24 tzoffsetto];
                      long long v21 = (void *)v45;
                    }
                  }
                  uint64_t v39 = [v37 countByEnumeratingWithState:&v58 objects:v78 count:16];
                }
                while (v39);
              }

              uint64_t v22 = v48;
              uint64_t v18 = v49;
              uint64_t v20 = v50;
              unint64_t v26 = v51;
              uint64_t v23 = v53;
            }
          }
          ++v23;
        }
        while (v23 != v20);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v20);
    }
    else
    {
      id obja = 0;
      long long v21 = 0;
    }

    char v46 = [[ICSTimeZoneChange alloc] initWithTimeInterval:obja tzOffsetTo:0.0];
    [v6 addObject:v46];
  }
  objc_msgSend(v6, "sortUsingSelector:", sel_compare_, v48, v49);

  return v6;
}

@end