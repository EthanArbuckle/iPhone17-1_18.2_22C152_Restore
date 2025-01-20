@interface REMRecurrenceRuleFormatter
+ (id)_andDaysOfWeekString:(id)a3;
+ (id)_byDayOfWeekOrdinalStrings;
+ (id)_customByDayItemFormatLocalizedString;
+ (id)_customDayCombinationDescription:(id)a3;
+ (id)_dayOfMonthAsString:(int64_t)a3;
+ (id)_daysOfWeek;
+ (id)_localizedOfMonthStringForMonth:(id)a3;
+ (id)_numberedWeekDayString:(id)a3;
+ (id)_orDaysOfWeekString:(id)a3;
+ (id)_readableMonths;
+ (id)_readableWeekDays;
+ (id)_stringForByDayOfWeek:(id)a3 setPositions:(id)a4;
+ (id)_stringForDayOfWeek:(int64_t)a3;
+ (id)_stringForMonthNumber:(int64_t)a3;
+ (id)_weekDayPositionAsString:(int64_t)a3;
+ (id)localizedDescriptionForRepeatType:(int64_t)a3;
+ (id)naturalLanguageDescriptionForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11 withStartDate:(id)a12;
+ (id)naturalLanguageDescriptionForRecurrenceRule:(id)a3 withStartDate:(id)a4;
+ (id)shortNaturalLanguageDescriptionForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 setPositions:(id)a8 date:(id)a9 timeZone:(id)a10 lowercase:(BOOL)a11;
+ (id)shortNaturalLanguageDescriptionForRecurrenceRule:(id)a3 date:(id)a4 timeZone:(id)a5 lowercase:(BOOL)a6;
+ (int64_t)daysTypeForDayArray:(id)a3;
+ (int64_t)repeatTypeForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11 recurrenceDate:(id)a12 recurrenceTimeZone:(id)a13 getRepeatEnd:(id *)a14;
+ (int64_t)repeatTypeForRecurrenceRules:(id)a3 recurrenceDate:(id)a4 recurrenceTimeZone:(id)a5 getRepeatEnd:(id *)a6;
@end

@implementation REMRecurrenceRuleFormatter

+ (id)naturalLanguageDescriptionForRecurrenceRule:(id)a3 withStartDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v17 = [v6 frequency];
  uint64_t v7 = [v6 interval];
  v8 = [v6 daysOfTheWeek];
  v9 = [v6 daysOfTheMonth];
  v10 = [v6 monthsOfTheYear];
  v11 = [v6 weeksOfTheYear];
  v12 = [v6 daysOfTheYear];
  v13 = [v6 setPositions];
  v14 = [v6 recurrenceEnd];

  v15 = [a1 naturalLanguageDescriptionForFrequency:v17 interval:v7 daysOfTheWeek:v8 daysOfTheMonth:v9 monthsOfTheYear:v10 weeksOfTheYear:v11 daysOfTheYear:v12 setPositions:v13 end:v14 withStartDate:v5];

  return v15;
}

+ (id)naturalLanguageDescriptionForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11 withStartDate:(id)a12
{
  id v17 = a5;
  id v144 = a6;
  id v18 = a7;
  id v138 = a8;
  id v19 = a9;
  id v143 = a10;
  id v140 = a11;
  id v20 = a12;
  v142 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v139 = v20;
  v141 = [v21 components:536 fromDate:v20];

  p_cb = &OBJC_PROTOCOL___REMDAChangeTrackableFetchableModel.cb;
  if (!naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableWeekDayArray)
  {
    uint64_t v23 = [a1 _readableWeekDays];
    v24 = (void *)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableWeekDayArray;
    naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableWeekDayArray = v23;
  }
  if (!naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray)
  {
    uint64_t v25 = [a1 _readableMonths];
    v26 = (void *)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray;
    naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray = v25;
  }
  v27 = v143;
  v145 = v18;
  switch(a3)
  {
    case 0:
      v28 = NSString;
      int64_t v29 = a4;
      if (a4 == 1)
      {
        v30 = @"Event will occur every day.";
        goto LABEL_21;
      }
      v63 = @"Event will occur every %lu days.";
      goto LABEL_72;
    case 1:
      if (!v17
        || [v17 count] == 1
        && ([v17 objectAtIndex:0],
            v31 = objc_claimAutoreleasedReturnValue(),
            uint64_t v32 = [v31 dayOfTheWeek],
            uint64_t v33 = [v141 weekday],
            v31,
            v32 == v33))
      {
        v28 = NSString;
        int64_t v29 = a4;
        if (a4 == 1)
        {
          v30 = @"Event will occur every week.";
          goto LABEL_21;
        }
        v63 = @"Event will occur every %lu weeks.";
        goto LABEL_72;
      }
      if (a4 != 1)
      {
        int64_t v81 = a4;
        v82 = NSString;
        v83 = @"Event will occur every %lu weeks on %@.";
        v84 = &stru_1F1339A18;
        v38 = v142;
        v85 = v142;
        goto LABEL_80;
      }
      switch([(id)objc_opt_class() daysTypeForDayArray:v17])
      {
        case 0:
        case 3:
          v64 = NSString;
          v38 = v142;
          v39 = [v142 localizedStringForKey:@"Event will occur every week on %@." value:&stru_1F1339A18 table:0];
          v65 = [(id)objc_opt_class() _andDaysOfWeekString:v17];
          uint64_t v66 = objc_msgSend(v64, "stringWithFormat:", v39, v65);
          goto LABEL_82;
        case 1:
          v119 = @"Event will occur every day.";
          break;
        case 2:
          v119 = @"Event will occur every weekday.";
          break;
        default:
          v36 = 0;
          goto LABEL_18;
      }
      v38 = v142;
      v36 = [v142 localizedStringForKey:v119 value:&stru_1F1339A18 table:0];
      goto LABEL_75;
    case 2:
      if ([v18 count])
      {
        if ([v18 count])
        {
LABEL_15:
          if ([v18 count] == 1)
          {
            a3 = [v18 objectAtIndex:0];
            uint64_t v34 = [(id)a3 integerValue];
            BOOL v35 = v34 == [v141 month];
          }
          else
          {
            BOOL v35 = 0;
          }
          if (![v17 count] && (!objc_msgSend(v18, "count") || v35))
          {
            v41 = NSString;
            v38 = v142;
            if (a4 == 1)
            {
              v42 = [v142 localizedStringForKey:@"Event will occur every year." value:&stru_1F1339A18 table:0];
            }
            else
            {
              v42 = [v142 localizedStringForKey:@"Event will occur every %lu years." value:&stru_1F1339A18 table:@"PluralLocalizable"];
              int64_t v123 = a4;
            }
            objc_msgSend(v41, "localizedStringWithFormat:", v42, v123);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v37 = v138;
            v27 = v143;
            goto LABEL_152;
          }
          id v128 = v19;
          v130 = v17;
          v146 = [MEMORY[0x1E4F28E78] string];
          uint64_t v43 = [v18 count];
          if (v43)
          {
            unint64_t v44 = v43;
            uint64_t v45 = 0;
            while (1)
            {
              v46 = [v18 objectAtIndex:v45];
              v47 = v46;
              if (v45) {
                break;
              }
              if ([v46 integerValue] < 1 || objc_msgSend(v47, "integerValue") >= 13)
              {
                [v146 appendString:@"???"];
              }
              else
              {
                v53 = objc_msgSend((id)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray, "objectAtIndex:", objc_msgSend(v47, "integerValue") - 1);
                [v146 appendString:v53];
              }
LABEL_53:

              if (v44 == ++v45) {
                goto LABEL_54;
              }
            }
            v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v49 = v48;
            if (v45 + 1 >= v44)
            {
              if (v44 == 2)
              {
                int64_t v50 = [v48 localizedStringForKey:@"Recurrence rule last item format for a list with two terms.  The last part of a list: X and Y. Here %@ is 'Y'" value:@" and %@" table:0];
                int v52 = 0;
                int v51 = 1;
                v134 = v49;
                v135 = (void *)v50;
              }
              else
              {
                int64_t v50 = [v48 localizedStringForKey:@"Recurrence rule last item format for a list with three or more items.  The last part of a list: X, Y, and Z. Here %@ is 'Z'", @", and %@", 0 value table];
                int v51 = 0;
                int v52 = 1;
                v132 = v49;
                v133 = (void *)v50;
              }
            }
            else
            {
              int64_t v50 = [v48 localizedStringForKey:@", %@", &stru_1F1339A18, 0 value table];
              int v51 = 0;
              int v52 = 0;
              v27 = v49;
              a3 = v50;
            }
            if ([v47 integerValue] < 1 || objc_msgSend(v47, "integerValue") >= 13)
            {
              objc_msgSend(v146, "appendFormat:", v50, @"???");
              if (!v52)
              {
LABEL_48:
                if (v51)
                {
                }
                if (v45 + 1 < v44)
                {
                }
                id v18 = v145;
                goto LABEL_53;
              }
            }
            else
            {
              v54 = objc_msgSend((id)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray, "objectAtIndex:", objc_msgSend(v47, "integerValue") - 1);
              objc_msgSend(v146, "appendFormat:", v50, v54);

              if (!v52) {
                goto LABEL_48;
              }
            }

            goto LABEL_48;
          }
LABEL_54:
          v27 = v143;
          if ([v143 count])
          {
            v55 = objc_opt_class();
            v56 = [v143 objectAtIndex:0];
            v57 = objc_msgSend(v55, "_weekDayPositionAsString:", objc_msgSend(v56, "integerValue"));

            uint64_t v58 = [v18 count];
            v59 = NSString;
            if (v58)
            {
              id v19 = v128;
              if (a4 != 1)
              {
                v60 = [v142 localizedStringForKey:@"Event will occur every %lu years on the %@ %@ of %@." value:&stru_1F1339A18 table:@"PluralLocalizable"];
                v62 = [(id)objc_opt_class() _orDaysOfWeekString:v130];
                objc_msgSend(v59, "localizedStringWithFormat:", v60, a4, v57, v62, v146);
                goto LABEL_95;
              }
              v60 = [v142 localizedStringForKey:@"Event will occur every year on the %@ %@ of %@." value:&stru_1F1339A18 table:0];
              uint64_t v61 = [(id)objc_opt_class() _orDaysOfWeekString:v130];
              v62 = (void *)v61;
              v125 = v146;
            }
            else
            {
              id v19 = v128;
              if (a4 != 1)
              {
                v60 = [v142 localizedStringForKey:@"Event will occur every %lu years on the %@ %@." value:&stru_1F1339A18 table:@"PluralLocalizable"];
                v62 = [(id)objc_opt_class() _orDaysOfWeekString:v130];
                objc_msgSend(v59, "localizedStringWithFormat:", v60, a4, v57, v62, v126);
                goto LABEL_95;
              }
              v60 = [v142 localizedStringForKey:@"Event will occur every year on the %@ %@." value:&stru_1F1339A18 table:0];
              uint64_t v61 = [(id)objc_opt_class() _orDaysOfWeekString:v130];
              v62 = (void *)v61;
            }
            objc_msgSend(v59, "localizedStringWithFormat:", v60, v57, v61, v125, v126);
LABEL_95:
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_149:
LABEL_150:
            v37 = v138;

            id v17 = v130;
            goto LABEL_151;
          }
          v67 = [v130 objectAtIndex:0];
          uint64_t v68 = [v67 weekNumber];

          if (v68)
          {
            id v18 = v145;
            uint64_t v69 = [v145 count];
            v70 = NSString;
            id v19 = v128;
            if (v69)
            {
              int64_t v71 = a4;
              v72 = v142;
              if (a4 == 1)
              {
                v73 = @"Event will occur every year on the %@ of %@.";
LABEL_88:
                v57 = [v72 localizedStringForKey:v73 value:&stru_1F1339A18 table:0];
                uint64_t v87 = [(id)objc_opt_class() _andDaysOfWeekString:v130];
                v60 = (void *)v87;
                v124 = v146;
LABEL_134:
                objc_msgSend(v70, "localizedStringWithFormat:", v57, v87, v124, v125);
LABEL_148:
                v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                goto LABEL_149;
              }
              v100 = @"Event will occur every %lu years on the %@ of %@.";
              goto LABEL_137;
            }
            int64_t v92 = a4;
            v93 = v142;
            if (a4 == 1)
            {
              v94 = @"Event will occur every year on the %@.";
LABEL_133:
              v57 = [v93 localizedStringForKey:v94 value:&stru_1F1339A18 table:0];
              uint64_t v87 = [(id)objc_opt_class() _andDaysOfWeekString:v130];
              v60 = (void *)v87;
              goto LABEL_134;
            }
            v118 = @"Event will occur every %lu years on the %@.";
          }
          else
          {
            id v19 = v128;
            if (![v130 count])
            {
              v117 = NSString;
              if (a4 == 1)
              {
                v57 = [v142 localizedStringForKey:@"Event will occur every year in %@." value:&stru_1F1339A18 table:0];
                objc_msgSend(v117, "localizedStringWithFormat:", v57, v146, v124);
              }
              else
              {
                v57 = [v142 localizedStringForKey:@"Event will occur every %lu years in %@." value:&stru_1F1339A18 table:@"PluralLocalizable"];
                objc_msgSend(v117, "localizedStringWithFormat:", v57, a4, v146);
              }
              v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
              id v18 = v145;
              goto LABEL_150;
            }
            id v18 = v145;
            uint64_t v86 = [v145 count];
            v70 = NSString;
            if (v86)
            {
              int64_t v71 = a4;
              v72 = v142;
              if (a4 == 1)
              {
                v73 = @"Event will occur every year on every %@ in %@.";
                goto LABEL_88;
              }
              v100 = @"Event will occur every %lu years on every %@ in %@.";
LABEL_137:
              int64_t v120 = v71;
              v57 = [v72 localizedStringForKey:v100 value:&stru_1F1339A18 table:@"PluralLocalizable"];
              v60 = [(id)objc_opt_class() _andDaysOfWeekString:v130];
              objc_msgSend(v70, "localizedStringWithFormat:", v57, v120, v60, v146);
              goto LABEL_148;
            }
            int64_t v92 = a4;
            v93 = v142;
            if (a4 == 1)
            {
              v94 = @"Event will occur every year on every %@.";
              goto LABEL_133;
            }
            v118 = @"Event will occur every %lu years on every %@.";
          }
          int64_t v121 = v92;
          v57 = [v93 localizedStringForKey:v118 value:&stru_1F1339A18 table:@"PluralLocalizable"];
          v60 = [(id)objc_opt_class() _andDaysOfWeekString:v130];
          objc_msgSend(v70, "localizedStringWithFormat:", v57, v121, v60, v125);
          goto LABEL_148;
        }
LABEL_17:
        v36 = &stru_1F1339A18;
LABEL_18:
        v37 = v138;
LABEL_151:
        v38 = v142;
        goto LABEL_152;
      }
      if (![v17 count])
      {
        uint64_t v88 = [v144 count];
        if (!v144
          || (unint64_t v89 = v88, v88 == 1)
          && ([v144 objectAtIndex:0],
              v90 = objc_claimAutoreleasedReturnValue(),
              p_cb = (uint32_t *)[v90 integerValue],
              uint64_t v91 = [v141 day],
              v90,
              p_cb == (uint32_t *)v91))
        {
          v28 = NSString;
          int64_t v29 = a4;
          if (a4 == 1)
          {
            v30 = @"Event will occur every month.";
            goto LABEL_21;
          }
          v63 = @"Event will occur every %lu months.";
LABEL_72:
          v38 = v142;
          int64_t v80 = v29;
          v39 = [v142 localizedStringForKey:v63 value:&stru_1F1339A18 table:@"PluralLocalizable"];
          int64_t v123 = v80;
LABEL_73:
          objc_msgSend(v28, "localizedStringWithFormat:", v39, v123);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_74;
        }
        v147 = [MEMORY[0x1E4F28E78] string];
        if (!v89)
        {
LABEL_122:
          v114 = NSString;
          if (a4 == 1)
          {
            v115 = [v142 localizedStringForKey:@"Event will occur every month on the %@." value:&stru_1F1339A18 table:0];
            v116 = v147;
            objc_msgSend(v114, "localizedStringWithFormat:", v115, v147, v124);
          }
          else
          {
            v115 = [v142 localizedStringForKey:@"Event will occur every %lu months on the %@." value:&stru_1F1339A18 table:@"PluralLocalizable"];
            v116 = v147;
            objc_msgSend(v114, "localizedStringWithFormat:", v115, a4, v147);
          }
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v37 = v138;
          v27 = v143;

          goto LABEL_151;
        }
        unint64_t v101 = 0;
        unint64_t v136 = v89;
        id v129 = v19;
        id v131 = v17;
        while (1)
        {
          if (v101)
          {
            unint64_t v102 = v101 + 1;
            v103 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v104 = v103;
            if (v101 + 1 >= v89)
            {
              if (v89 == 2)
              {
                uint64_t v105 = [v103 localizedStringForKey:@"Recurrence rule last item format for a list with two terms.  The last part of a list: X and Y. Here %@ is 'Y'" value:@" and %@" table:0];
                int v107 = 0;
                int v106 = 1;
                v108 = p_cb;
                v109 = v27;
                v133 = (void *)v105;
                v134 = v104;
              }
              else
              {
                uint64_t v105 = [v103 localizedStringForKey:@"Recurrence rule last item format for a list with three or more items.  The last part of a list: X, Y, and Z. Here %@ is 'Z'", @", and %@", 0 value table];
                int v106 = 0;
                int v107 = 1;
                v108 = p_cb;
                v109 = v27;
                v132 = v104;
                v127 = (void *)v105;
              }
            }
            else
            {
              uint64_t v105 = [v103 localizedStringForKey:@", %@", &stru_1F1339A18, 0 value table];
              int v106 = 0;
              int v107 = 0;
              v108 = (uint32_t *)v104;
              v109 = (void *)v105;
            }
            v111 = objc_opt_class();
            v112 = [v144 objectAtIndex:v101];
            v113 = objc_msgSend(v111, "_dayOfMonthAsString:", objc_msgSend(v112, "integerValue"));
            objc_msgSend(v147, "appendFormat:", v105, v113);

            if (v107)
            {
            }
            id v18 = v145;
            id v19 = v129;
            if (v106)
            {
            }
            p_cb = v108;
            v27 = v109;
            unint64_t v89 = v136;
            id v17 = v131;
            if (v102 >= v136) {
              goto LABEL_121;
            }
          }
          else
          {
            v110 = objc_opt_class();
            v108 = [v144 objectAtIndex:0];
            v109 = objc_msgSend(v110, "_dayOfMonthAsString:", -[uint32_t integerValue](v108, "integerValue"));
            [v147 appendString:v109];
            unint64_t v102 = 1;
          }

          v108 = p_cb;
          v109 = v27;
LABEL_121:
          v27 = v109;
          p_cb = v108;
          unint64_t v101 = v102;
          if (v102 == v89) {
            goto LABEL_122;
          }
        }
      }
      if ([v143 count])
      {
        v74 = objc_opt_class();
        v75 = [v143 objectAtIndex:0];
        v76 = objc_msgSend(v74, "_weekDayPositionAsString:", objc_msgSend(v75, "integerValue"));

        v77 = NSString;
        if (a4 == 1)
        {
          v78 = [v142 localizedStringForKey:@"Event will occur every month on the %@ %@." value:&stru_1F1339A18 table:0];
          v79 = [(id)objc_opt_class() _orDaysOfWeekString:v17];
          objc_msgSend(v77, "localizedStringWithFormat:", v78, v76, v79, v125);
        }
        else
        {
          v78 = [v142 localizedStringForKey:@"Event will occur every %lu months on the %@ %@." value:&stru_1F1339A18 table:@"PluralLocalizable"];
          v79 = [(id)objc_opt_class() _orDaysOfWeekString:v17];
          objc_msgSend(v77, "localizedStringWithFormat:", v78, a4, v76, v79);
        }
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      v95 = [v17 objectAtIndex:0];
      uint64_t v96 = [v95 weekNumber];

      v82 = NSString;
      if (!v96)
      {
        int64_t v97 = a4;
        v38 = v142;
        if (a4 == 1)
        {
          v98 = @"Event will occur every month on %@.";
          v99 = &stru_1F1339A18;
          goto LABEL_140;
        }
        v83 = @"Event will occur every %lu months on %@.";
        v84 = &stru_1F1339A18;
LABEL_156:
        v85 = v38;
        int64_t v81 = v97;
LABEL_80:
        v39 = [v85 localizedStringForKey:v83 value:v84 table:@"PluralLocalizable"];
        v65 = [(id)objc_opt_class() _andDaysOfWeekString:v17];
        objc_msgSend(v82, "localizedStringWithFormat:", v39, v81, v65);
        goto LABEL_81;
      }
      int64_t v97 = a4;
      if (a4 != 1)
      {
        v83 = @"Event will occur every %lu months on the %@-XX01.";
        v84 = @"Event will occur every %lu months on the %@.";
        v38 = v142;
        goto LABEL_156;
      }
      v98 = @"Event will occur every month on the %@-XX01.";
      v99 = @"Event will occur every month on the %@.";
      v38 = v142;
LABEL_140:
      v39 = [v38 localizedStringForKey:v98 value:v99 table:0];
      v65 = [(id)objc_opt_class() _andDaysOfWeekString:v17];
      objc_msgSend(v82, "localizedStringWithFormat:", v39, v65, v124);
      uint64_t v66 = LABEL_81:;
LABEL_82:
      v36 = (__CFString *)v66;

LABEL_74:
LABEL_75:
      v37 = v138;
LABEL_152:

      return v36;
    case 3:
      goto LABEL_15;
    case 4:
      v28 = NSString;
      int64_t v29 = a4;
      if (a4 != 1)
      {
        v63 = @"Event will occur every %lu hours.";
        goto LABEL_72;
      }
      v30 = @"Event will occur every hour.";
LABEL_21:
      v38 = v142;
      v39 = [v142 localizedStringForKey:v30 value:&stru_1F1339A18 table:0];
      goto LABEL_73;
    default:
      goto LABEL_17;
  }
}

+ (id)_readableWeekDays
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [v2 standaloneWeekdaySymbols];
  v4 = (void *)[v3 copy];

  if ([v4 count] != 7)
  {
    NSLog(&cfstr_Nsdateformatte.isa);
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", 0);

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)_readableMonths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [v2 standaloneMonthSymbols];
  v4 = (void *)[v3 copy];

  if ([v4 count] != 12)
  {
    NSLog(&cfstr_Nsdateformatte_0.isa);
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", 0);

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)_andDaysOfWeekString:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v3 objectAtIndex:v6];
      if (v6)
      {
        if (v6 == [v3 count] - 1)
        {
          if ([v3 count] == 2)
          {
            v8 = v5;
            v9 = @"the last part of a list of two items: X and Y. Here %@ is 'Y'";
            v10 = @" and %@";
          }
          else
          {
            v8 = v5;
            v9 = @"the last part of a list of three or more items: X, Y, and Z. Here %@ is 'Z'";
            v10 = @", and %@";
          }
        }
        else
        {
          v8 = v5;
          v9 = @", %@-XX01";
          v10 = @", %@";
        }
        v11 = [v8 localizedStringForKey:v9 value:v10 table:0];
        v12 = [(id)objc_opt_class() _numberedWeekDayString:v7];
        objc_msgSend(v4, "appendFormat:", v11, v12);
      }
      else
      {
        v11 = [(id)objc_opt_class() _numberedWeekDayString:v7];
        [v4 appendString:v11];
      }

      ++v6;
    }
    while (v6 < [v3 count]);
  }

  return v4;
}

+ (id)_numberedWeekDayString:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _daysOfWeek];
  uint64_t v5 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "dayOfTheWeek"));

  if ([v3 weekNumber])
  {
    unint64_t v6 = objc_msgSend((id)objc_opt_class(), "_weekDayPositionAsString:", objc_msgSend(v3, "weekNumber"));
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = NSString;
    v9 = [v7 localizedStringForKey:@"%@ %@" value:&stru_1F1339A18 table:0];
    objc_msgSend(v8, "stringWithFormat:", v9, v6, v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (id)_daysOfWeek
{
  id v3 = (void *)_daysOfWeek_sDaysOfWeek;
  if (!_daysOfWeek_sDaysOfWeek)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    unint64_t v6 = [v5 standaloneWeekdaySymbols];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if ([v7 count] == 7)
    {
      [v7 insertObject:&stru_1F1339A18 atIndex:0];
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
    }
    else
    {
      NSLog(&cfstr_Nsdateformatte.isa);
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &stru_1F1339A18, @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", 0);
    }
    v9 = (void *)_daysOfWeek_sDaysOfWeek;
    _daysOfWeek_sDaysOfWeek = v8;

    objc_sync_exit(v4);
    id v3 = (void *)_daysOfWeek_sDaysOfWeek;
  }

  return v3;
}

+ (id)_dayOfMonthAsString:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  unint64_t v6 = &stru_1F1339A18;
  switch(a3)
  {
    case -1:
      uint64_t v7 = @"last day";
      uint64_t v8 = &stru_1F1339A18;
      goto LABEL_34;
    case 1:
      uint64_t v7 = @"1st-XX01";
      uint64_t v8 = @"1st";
      goto LABEL_34;
    case 2:
      uint64_t v7 = @"2nd-XX01";
      uint64_t v8 = @"2nd";
      goto LABEL_34;
    case 3:
      uint64_t v7 = @"3rd-XX01";
      uint64_t v8 = @"3rd";
      goto LABEL_34;
    case 4:
      uint64_t v7 = @"4th-XX01";
      uint64_t v8 = @"4th";
      goto LABEL_34;
    case 5:
      uint64_t v7 = @"5th-XX01";
      uint64_t v8 = @"5th";
      goto LABEL_34;
    case 6:
      uint64_t v7 = @"6th-XX01";
      uint64_t v8 = @"6th";
      goto LABEL_34;
    case 7:
      uint64_t v7 = @"7th-XX01";
      uint64_t v8 = @"7th";
      goto LABEL_34;
    case 8:
      uint64_t v7 = @"8th-XX01";
      uint64_t v8 = @"8th";
      goto LABEL_34;
    case 9:
      uint64_t v7 = @"9th-XX01";
      uint64_t v8 = @"9th";
      goto LABEL_34;
    case 10:
      uint64_t v7 = @"10th-XX01";
      uint64_t v8 = @"10th";
      goto LABEL_34;
    case 11:
      uint64_t v7 = @"11th-XX01";
      uint64_t v8 = @"11th";
      goto LABEL_34;
    case 12:
      uint64_t v7 = @"12th-XX01";
      uint64_t v8 = @"12th";
      goto LABEL_34;
    case 13:
      uint64_t v7 = @"13th-XX01";
      uint64_t v8 = @"13th";
      goto LABEL_34;
    case 14:
      uint64_t v7 = @"14th-XX01";
      uint64_t v8 = @"14th";
      goto LABEL_34;
    case 15:
      uint64_t v7 = @"15th-XX01";
      uint64_t v8 = @"15th";
      goto LABEL_34;
    case 16:
      uint64_t v7 = @"16th-XX01";
      uint64_t v8 = @"16th";
      goto LABEL_34;
    case 17:
      uint64_t v7 = @"17th-XX01";
      uint64_t v8 = @"17th";
      goto LABEL_34;
    case 18:
      uint64_t v7 = @"18th-XX01";
      uint64_t v8 = @"18th";
      goto LABEL_34;
    case 19:
      uint64_t v7 = @"19th-XX01";
      uint64_t v8 = @"19th";
      goto LABEL_34;
    case 20:
      uint64_t v7 = @"20th-XX01";
      uint64_t v8 = @"20th";
      goto LABEL_34;
    case 21:
      uint64_t v7 = @"21st-XX01";
      uint64_t v8 = @"21st";
      goto LABEL_34;
    case 22:
      uint64_t v7 = @"22nd-XX01";
      uint64_t v8 = @"22nd";
      goto LABEL_34;
    case 23:
      uint64_t v7 = @"23rd-XX01";
      uint64_t v8 = @"23rd";
      goto LABEL_34;
    case 24:
      uint64_t v7 = @"24th-XX01";
      uint64_t v8 = @"24th";
      goto LABEL_34;
    case 25:
      uint64_t v7 = @"25th-XX01";
      uint64_t v8 = @"25th";
      goto LABEL_34;
    case 26:
      uint64_t v7 = @"26th-XX01";
      uint64_t v8 = @"26th";
      goto LABEL_34;
    case 27:
      uint64_t v7 = @"27th-XX01";
      uint64_t v8 = @"27th";
      goto LABEL_34;
    case 28:
      uint64_t v7 = @"28th-XX01";
      uint64_t v8 = @"28th";
      goto LABEL_34;
    case 29:
      uint64_t v7 = @"29th-XX01";
      uint64_t v8 = @"29th";
      goto LABEL_34;
    case 30:
      uint64_t v7 = @"30th-XX01";
      uint64_t v8 = @"30th";
      goto LABEL_34;
    case 31:
      uint64_t v7 = @"31st-XX01";
      uint64_t v8 = @"31st";
LABEL_34:
      unint64_t v6 = [v4 localizedStringForKey:v7 value:v8 table:0];
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_weekDayPositionAsString:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  unint64_t v6 = &stru_1F1339A18;
  switch(a3)
  {
    case -1:
      uint64_t v7 = @"last";
      uint64_t v8 = &stru_1F1339A18;
      goto LABEL_56;
    case 1:
      uint64_t v7 = @"1st-XX02";
      uint64_t v8 = @"1st";
      goto LABEL_56;
    case 2:
      uint64_t v7 = @"2nd-XX02";
      uint64_t v8 = @"2nd";
      goto LABEL_56;
    case 3:
      uint64_t v7 = @"3rd-XX02";
      uint64_t v8 = @"3rd";
      goto LABEL_56;
    case 4:
      uint64_t v7 = @"4th-XX02";
      uint64_t v8 = @"4th";
      goto LABEL_56;
    case 5:
      uint64_t v7 = @"5th-XX02";
      uint64_t v8 = @"5th";
      goto LABEL_56;
    case 6:
      uint64_t v7 = @"6th-XX02";
      uint64_t v8 = @"6th";
      goto LABEL_56;
    case 7:
      uint64_t v7 = @"7th-XX02";
      uint64_t v8 = @"7th";
      goto LABEL_56;
    case 8:
      uint64_t v7 = @"8th-XX02";
      uint64_t v8 = @"8th";
      goto LABEL_56;
    case 9:
      uint64_t v7 = @"9th-XX02";
      uint64_t v8 = @"9th";
      goto LABEL_56;
    case 10:
      uint64_t v7 = @"10th-XX02";
      uint64_t v8 = @"10th";
      goto LABEL_56;
    case 11:
      uint64_t v7 = @"11th-XX02";
      uint64_t v8 = @"11th";
      goto LABEL_56;
    case 12:
      uint64_t v7 = @"12th-XX02";
      uint64_t v8 = @"12th";
      goto LABEL_56;
    case 13:
      uint64_t v7 = @"13th-XX02";
      uint64_t v8 = @"13th";
      goto LABEL_56;
    case 14:
      uint64_t v7 = @"14th-XX02";
      uint64_t v8 = @"14th";
      goto LABEL_56;
    case 15:
      uint64_t v7 = @"15th-XX02";
      uint64_t v8 = @"15th";
      goto LABEL_56;
    case 16:
      uint64_t v7 = @"16th-XX02";
      uint64_t v8 = @"16th";
      goto LABEL_56;
    case 17:
      uint64_t v7 = @"17th-XX02";
      uint64_t v8 = @"17th";
      goto LABEL_56;
    case 18:
      uint64_t v7 = @"18th-XX02";
      uint64_t v8 = @"18th";
      goto LABEL_56;
    case 19:
      uint64_t v7 = @"19th-XX02";
      uint64_t v8 = @"19th";
      goto LABEL_56;
    case 20:
      uint64_t v7 = @"20th-XX02";
      uint64_t v8 = @"20th";
      goto LABEL_56;
    case 21:
      uint64_t v7 = @"21st-XX02";
      uint64_t v8 = @"21st";
      goto LABEL_56;
    case 22:
      uint64_t v7 = @"22nd-XX02";
      uint64_t v8 = @"22nd";
      goto LABEL_56;
    case 23:
      uint64_t v7 = @"23rd-XX02";
      uint64_t v8 = @"23rd";
      goto LABEL_56;
    case 24:
      uint64_t v7 = @"24th-XX02";
      uint64_t v8 = @"24th";
      goto LABEL_56;
    case 25:
      uint64_t v7 = @"25th-XX02";
      uint64_t v8 = @"25th";
      goto LABEL_56;
    case 26:
      uint64_t v7 = @"26th-XX02";
      uint64_t v8 = @"26th";
      goto LABEL_56;
    case 27:
      uint64_t v7 = @"27th-XX02";
      uint64_t v8 = @"27th";
      goto LABEL_56;
    case 28:
      uint64_t v7 = @"28th-XX02";
      uint64_t v8 = @"28th";
      goto LABEL_56;
    case 29:
      uint64_t v7 = @"29th-XX02";
      uint64_t v8 = @"29th";
      goto LABEL_56;
    case 30:
      uint64_t v7 = @"30th-XX02";
      uint64_t v8 = @"30th";
      goto LABEL_56;
    case 31:
      uint64_t v7 = @"31st-XX02";
      uint64_t v8 = @"31st";
      goto LABEL_56;
    case 32:
      uint64_t v7 = @"32nd-XX02";
      uint64_t v8 = @"32nd";
      goto LABEL_56;
    case 33:
      uint64_t v7 = @"33rd-XX02";
      uint64_t v8 = @"33rd";
      goto LABEL_56;
    case 34:
      uint64_t v7 = @"34th-XX02";
      uint64_t v8 = @"34th";
      goto LABEL_56;
    case 35:
      uint64_t v7 = @"35th-XX02";
      uint64_t v8 = @"35th";
      goto LABEL_56;
    case 36:
      uint64_t v7 = @"36th-XX02";
      uint64_t v8 = @"36th";
      goto LABEL_56;
    case 37:
      uint64_t v7 = @"37th-XX02";
      uint64_t v8 = @"37th";
      goto LABEL_56;
    case 38:
      uint64_t v7 = @"38th-XX02";
      uint64_t v8 = @"38th";
      goto LABEL_56;
    case 39:
      uint64_t v7 = @"39th-XX02";
      uint64_t v8 = @"39th";
      goto LABEL_56;
    case 40:
      uint64_t v7 = @"40th-XX02";
      uint64_t v8 = @"40th";
      goto LABEL_56;
    case 41:
      uint64_t v7 = @"41st-XX02";
      uint64_t v8 = @"41st";
      goto LABEL_56;
    case 42:
      uint64_t v7 = @"42nd-XX02";
      uint64_t v8 = @"42nd";
      goto LABEL_56;
    case 43:
      uint64_t v7 = @"43rd-XX02";
      uint64_t v8 = @"43rd";
      goto LABEL_56;
    case 44:
      uint64_t v7 = @"44th-XX02";
      uint64_t v8 = @"44th";
      goto LABEL_56;
    case 45:
      uint64_t v7 = @"45th-XX02";
      uint64_t v8 = @"45th";
      goto LABEL_56;
    case 46:
      uint64_t v7 = @"46th-XX02";
      uint64_t v8 = @"46th";
      goto LABEL_56;
    case 47:
      uint64_t v7 = @"47th-XX02";
      uint64_t v8 = @"47th";
      goto LABEL_56;
    case 48:
      uint64_t v7 = @"48th-XX02";
      uint64_t v8 = @"48th";
      goto LABEL_56;
    case 49:
      uint64_t v7 = @"49th-XX02";
      uint64_t v8 = @"49th";
      goto LABEL_56;
    case 50:
      uint64_t v7 = @"50th-XX02";
      uint64_t v8 = @"50th";
      goto LABEL_56;
    case 51:
      uint64_t v7 = @"51st-XX02";
      uint64_t v8 = @"51st";
      goto LABEL_56;
    case 52:
      uint64_t v7 = @"52nd-XX02";
      uint64_t v8 = @"52nd";
      goto LABEL_56;
    case 53:
      uint64_t v7 = @"53rd-XX02";
      uint64_t v8 = @"53rd";
LABEL_56:
      unint64_t v6 = [v4 localizedStringForKey:v7 value:v8 table:0];
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_orDaysOfWeekString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [(id)objc_opt_class() _customDayCombinationDescription:v3];
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28E78] string];
    if ([v3 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v3 objectAtIndex:v8];
        if (v8)
        {
          if (v8 == [v3 count] - 1)
          {
            id v10 = @" or %@";
            v11 = &stru_1F1339A18;
          }
          else
          {
            id v10 = @", %@-XX02";
            v11 = @", %@";
          }
          v12 = [v4 localizedStringForKey:v10 value:v11 table:0];
          v13 = [(id)objc_opt_class() _numberedWeekDayString:v9];
          objc_msgSend(v7, "appendFormat:", v12, v13);
        }
        else
        {
          v12 = [(id)objc_opt_class() _numberedWeekDayString:v9];
          [v7 appendString:v12];
        }

        ++v8;
      }
      while (v8 < [v3 count]);
    }
  }

  return v7;
}

+ (id)_customDayCombinationDescription:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [(id)objc_opt_class() daysTypeForDayArray:v4];

  switch(v6)
  {
    case 3:
      id v7 = @"weekend day";
LABEL_7:
      unint64_t v8 = &stru_1F1339A18;
      goto LABEL_8;
    case 2:
      id v7 = @"weekday";
      goto LABEL_7;
    case 1:
      id v7 = @"day-XX02";
      unint64_t v8 = @"day";
LABEL_8:
      v9 = [v5 localizedStringForKey:v7 value:v8 table:0];
      goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

+ (int64_t)daysTypeForDayArray:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 != 2)
  {
    if (v4 == 7)
    {
      int64_t v5 = 1;
      unint64_t v17 = 1;
      while (1)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v18 = v3;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (!v19) {
          break;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
LABEL_25:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * v22) dayOfTheWeek] == v17) {
            break;
          }
          if (v20 == ++v22)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v20) {
              goto LABEL_25;
            }
            goto LABEL_35;
          }
        }

        BOOL v12 = v17++ >= 7;
        if (v12) {
          goto LABEL_37;
        }
      }
    }
    else
    {
      if (v4 != 5)
      {
LABEL_36:
        int64_t v5 = 0;
        goto LABEL_37;
      }
      int64_t v5 = 2;
      unint64_t v6 = 2;
      while (1)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = v3;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (!v8) {
          break;
        }
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v25;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v24 + 1) + 8 * v11) dayOfTheWeek] == v6) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v9) {
              goto LABEL_7;
            }
            goto LABEL_35;
          }
        }

        BOOL v12 = v6++ >= 6;
        if (v12) {
          goto LABEL_37;
        }
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  v13 = [v3 objectAtIndex:0];
  uint64_t v14 = [v13 dayOfTheWeek];

  v15 = [v3 objectAtIndex:1];
  uint64_t v16 = [v15 dayOfTheWeek];

  if ((v14 != 7 || v16 != 1) && (v14 != 1 || v16 != 7)) {
    goto LABEL_36;
  }
  int64_t v5 = 3;
LABEL_37:

  return v5;
}

+ (id)shortNaturalLanguageDescriptionForRecurrenceRule:(id)a3 date:(id)a4 timeZone:(id)a5 lowercase:(BOOL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v11 frequency];
  uint64_t v13 = [v11 interval];
  uint64_t v14 = [v11 daysOfTheWeek];
  v15 = [v11 daysOfTheMonth];
  uint64_t v16 = [v11 monthsOfTheYear];
  unint64_t v17 = [v11 setPositions];

  LOBYTE(v20) = a6;
  id v18 = [a1 shortNaturalLanguageDescriptionForFrequency:v12 interval:v13 daysOfTheWeek:v14 daysOfTheMonth:v15 monthsOfTheYear:v16 setPositions:v17 date:v10 timeZone:v9 lowercase:v20];

  return v18;
}

+ (id)shortNaturalLanguageDescriptionForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 setPositions:(id)a8 date:(id)a9 timeZone:(id)a10 lowercase:(BOOL)a11
{
  v244[1] = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v229 = a6;
  id v17 = a7;
  id v18 = a8;
  id v231 = a9;
  id v19 = a10;
  uint64_t v230 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v237 = a1;
  uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v234 = [v20 localizedStringForKey:@", and %@", &stru_1F1339A18, 0 value table];
  v233 = [v20 localizedStringForKey:@" and %@" value:&stru_1F1339A18 table:0];
  uint64_t v21 = [v20 localizedStringForKey:@"Monthly" value:&stru_1F1339A18 table:0];
  v232 = v20;
  uint64_t v22 = [v20 localizedStringForKey:@"Custom Repeat" value:&stru_1F1339A18 table:0];
  if (shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase__onceToken != -1) {
    dispatch_once(&shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase__onceToken, &__block_literal_global_5);
  }
  uint64_t v23 = v17;
  v227 = v18;
  v226 = (void *)v21;
  uint64_t v24 = a11;
  switch(a3)
  {
    case 0:
      if (a4 >= 2)
      {
        id v223 = v17;
        long long v25 = v22;
        long long v26 = v16;
        id v27 = v19;
        long long v28 = @"Every %u days";
        goto LABEL_28;
      }
      long long v26 = v16;
      v54 = @"Daily";
      goto LABEL_54;
    case 1:
      v219 = v22;
      id v32 = v16;
      uint64_t v33 = [v32 count];
      id v224 = v17;
      if (!v33
        || (unint64_t v34 = v33, v35 = v33 - 1, v33 == 1)
        && recurrenceDateMatchesAnyDaySpecifiedInByDayList(v32, v231, v19))
      {
        long long v26 = v16;
        if (a4 == 1)
        {
          long long v30 = (void *)v230;
          v36 = [v232 localizedStringForKey:@"SINGULAR_WEEKLY_RECURRENCE" value:@"Weekly" table:0];
          id v31 = v36;
          v37 = v22;
          long long v29 = v229;
          if (!a11)
          {
            uint64_t v23 = v224;
            uint64_t v24 = (uint64_t)v226;
            goto LABEL_166;
          }
          id v38 = [v36 lowercaseStringWithLocale:v230];
        }
        else
        {
          id v31 = [v232 localizedStringForKey:@"Every %u weeks" value:&stru_1F1339A18 table:@"PluralLocalizable"];
          v99 = objc_msgSend(NSString, "localizedStringWithFormat:", v31, a4);
          id v38 = v99;
          v37 = v22;
          long long v30 = (void *)v230;
          if (a11)
          {
            uint64_t v100 = objc_msgSend(v99, "lowercaseStringWithLocale:");

            id v38 = (id)v100;
          }
          long long v29 = v229;
        }
        uint64_t v22 = v37;
        uint64_t v23 = v224;
        uint64_t v24 = (uint64_t)v226;
LABEL_165:

        id v31 = v38;
LABEL_166:

        goto LABEL_320;
      }
      id v212 = v16;
      id v31 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      unint64_t v55 = 0;
      int v56 = 0;
      int v57 = 0;
      do
      {
        uint64_t v58 = [v32 objectAtIndex:v55];
        uint64_t v59 = objc_msgSend(v237, "_stringForDayOfWeek:", objc_msgSend(v58, "dayOfTheWeek") - 1);
        v60 = (void *)v59;
        if (v55)
        {
          if (v55 >= v35)
          {
            if (v34 < 3) {
              objc_msgSend(v31, "appendFormat:", v233, v59);
            }
            else {
              objc_msgSend(v31, "appendFormat:", v234, v59);
            }
          }
          else
          {
            [v31 appendFormat:@", %@", v59];
          }
        }
        else
        {
          [v31 appendString:v59];
        }
        if ([v58 dayOfTheWeek] == 1 || objc_msgSend(v58, "dayOfTheWeek") == 7)
        {
          ++v57;
        }
        else if ([v58 dayOfTheWeek] > 1)
        {
          ++v56;
        }

        ++v55;
      }
      while (v34 != v55);
      if (a4 == 1 && !v57 && v56 == 5)
      {
        uint64_t v61 = [v232 localizedStringForKey:@"Weekdays" value:&stru_1F1339A18 table:0];
        id v38 = v61;
        if (a11)
        {
          long long v30 = (void *)v230;
          uint64_t v62 = objc_msgSend(v61, "lowercaseStringWithLocale:");
          long long v26 = v212;
          long long v29 = v229;
        }
        else
        {
          id v38 = v61;
          uint64_t v62 = (uint64_t)v38;
          long long v26 = v212;
          long long v29 = v229;
          long long v30 = (void *)v230;
        }
        uint64_t v23 = v224;
      }
      else
      {
        if (a4 == 1 && v57 == 2 && !v56)
        {
          unint64_t v101 = [v232 localizedStringForKey:@"Weekends" value:&stru_1F1339A18 table:0];
          id v38 = v101;
          uint64_t v24 = (uint64_t)v226;
          if (a11)
          {
            long long v30 = (void *)v230;
            uint64_t v62 = objc_msgSend(v101, "lowercaseStringWithLocale:");
            long long v26 = v212;
            long long v29 = v229;
          }
          else
          {
            id v38 = v101;
            uint64_t v62 = (uint64_t)v38;
            long long v26 = v212;
            long long v29 = v229;
            long long v30 = (void *)v230;
          }
          uint64_t v23 = v224;
          goto LABEL_163;
        }
        if (a4 == 1)
        {
          v122 = [v232 localizedStringForKey:@"Every week on %@" value:&stru_1F1339A18 table:0];
          objc_msgSend(NSString, "localizedStringWithFormat:", v122, v31, v199);
        }
        else
        {
          v122 = [v232 localizedStringForKey:@"Every %u weeks on %@" value:&stru_1F1339A18 table:@"PluralLocalizable"];
          objc_msgSend(NSString, "localizedStringWithFormat:", v122, a4, v31);
        }
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        long long v26 = v212;
        long long v29 = v229;
        long long v30 = (void *)v230;
        uint64_t v23 = v224;

        if (!a11)
        {
          uint64_t v24 = (uint64_t)v226;
          goto LABEL_164;
        }
        uint64_t v62 = [v38 lowercaseStringWithLocale:v230];
      }
      uint64_t v24 = (uint64_t)v226;
LABEL_163:

      id v38 = (id)v62;
LABEL_164:
      uint64_t v22 = v219;
      goto LABEL_165;
    case 2:
      id v39 = v16;
      uint64_t v40 = [v39 count];
      v210 = v39;
      if ([v17 count])
      {
        LOBYTE(v200) = a11;
        id v31 = [v237 shortNaturalLanguageDescriptionForFrequency:3 interval:a4 daysOfTheWeek:v39 daysOfTheMonth:v229 monthsOfTheYear:v17 setPositions:v18 date:v231 timeZone:v19 lowercase:v200];
        goto LABEL_15;
      }
      if (v40)
      {
        if (v40 == 7)
        {
          if ([v18 count])
          {
            uint64_t v66 = v22;
            v67 = [v18 objectAtIndex:0];
            int v68 = [v67 intValue];

            if (v68 != 1)
            {
              uint64_t v22 = v66;
              if (v68 == -1)
              {
                if (a4 >= 2)
                {
                  id v69 = v19;
                  v70 = @"Every %u months on the last day";
LABEL_265:
                  v178 = [v232 localizedStringForKey:v70 value:&stru_1F1339A18 table:0];
                  v179 = v178;
                  v180 = NSString;
                  v181 = v178;
                  if (a11)
                  {
                    v181 = [v178 lowercaseStringWithLocale:v230];
                  }
                  objc_msgSend(v180, "localizedStringWithFormat:", v181, a4);
                  id v31 = (id)objc_claimAutoreleasedReturnValue();
                  if (a11) {

                  }
                  int v41 = 0;
                  id v19 = v69;
                  goto LABEL_270;
                }
                v168 = @"Every month on the last day";
                goto LABEL_282;
              }
              goto LABEL_155;
            }
            if (a4 >= 2)
            {
              id v69 = v19;
              v70 = @"Every %u months on the first day";
              goto LABEL_265;
            }
            v169 = @"Every month on the first day";
LABEL_287:
            v185 = [v232 localizedStringForKey:v169 value:&stru_1F1339A18 table:0];
            v183 = v185;
            if (a11)
            {
              id v186 = [v185 lowercaseStringWithLocale:v230];
            }
            else
            {
              id v186 = v185;
            }
            id v31 = v186;
            uint64_t v22 = v66;
            goto LABEL_291;
          }
          goto LABEL_155;
        }
        if ([v39 isEqualToArray:shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray])
        {
          if ([v18 count])
          {
            uint64_t v66 = v22;
            int64_t v120 = [v18 objectAtIndex:0];
            int v121 = [v120 intValue];

            if (v121 == 1)
            {
              if (a4 >= 2)
              {
                id v69 = v19;
                v70 = @"Every %u months on the first weekday";
                goto LABEL_265;
              }
              v169 = @"Every month on the first weekday";
              goto LABEL_287;
            }
            uint64_t v22 = v66;
            if (v121 == -1)
            {
              if (a4 >= 2)
              {
                id v69 = v19;
                v70 = @"Every %u months on the last weekday";
                goto LABEL_265;
              }
              v168 = @"Every month on the last weekday";
              goto LABEL_282;
            }
          }
          goto LABEL_155;
        }
        if ([v39 isEqualToArray:shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray])
        {
          if ([v18 count])
          {
            uint64_t v66 = v22;
            uint64_t v126 = [v18 objectAtIndex:0];
            int v127 = [v126 intValue];

            if (v127 != 1)
            {
              uint64_t v22 = v66;
              if (v127 == -1)
              {
                if (a4 >= 2)
                {
                  id v69 = v19;
                  v70 = @"Every %u months on the last weekend day";
                  goto LABEL_265;
                }
                v168 = @"Every month on the last weekend day";
LABEL_282:
                v182 = [v232 localizedStringForKey:v168 value:&stru_1F1339A18 table:0];
                v183 = v182;
                if (a11)
                {
                  id v184 = [v182 lowercaseStringWithLocale:v230];
                }
                else
                {
                  id v184 = v182;
                }
                id v31 = v184;
LABEL_291:

                int v41 = 0;
                goto LABEL_16;
              }
              goto LABEL_155;
            }
            if (a4 >= 2)
            {
              id v69 = v19;
              v70 = @"Every %u months on the first weekend day";
              goto LABEL_265;
            }
            v169 = @"Every month on the first weekend day";
            goto LABEL_287;
          }
LABEL_155:
          id v123 = v22;
LABEL_156:
          id v31 = v123;
          goto LABEL_157;
        }
        v150 = v39;
        uint64_t v66 = v22;
        v151 = [v150 objectAtIndex:0];
        v152 = [v237 _stringForByDayOfWeek:v151 setPositions:v18];

        if (!v152)
        {
          id v31 = 0;
LABEL_251:

          int v41 = 1;
LABEL_270:
          uint64_t v22 = v66;
          goto LABEL_16;
        }
        id v218 = v19;
        if (a4 < 2)
        {
          v171 = [v232 localizedStringForKey:@"Every month on the %@" value:&stru_1F1339A18 table:0];
          v154 = v171;
          v172 = NSString;
          v156 = v171;
          if (a11)
          {
            v156 = [v171 lowercaseStringWithLocale:v230];
          }
          objc_msgSend(v172, "localizedStringWithFormat:", v156, v152);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          if (!a11) {
            goto LABEL_250;
          }
        }
        else
        {
          v153 = [v232 localizedStringForKey:@"Every %u months on the %@" value:&stru_1F1339A18 table:0];
          v154 = v153;
          v155 = NSString;
          v156 = v153;
          if (a11)
          {
            v156 = [v153 lowercaseStringWithLocale:v230];
          }
          objc_msgSend(v155, "localizedStringWithFormat:", v156, a4, v152);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          if (!a11) {
            goto LABEL_250;
          }
        }

LABEL_250:
        id v19 = v218;
        goto LABEL_251;
      }
      id v106 = v229;
      unint64_t v107 = [v106 count];
      if ([v18 count])
      {
        v108 = [v18 objectAtIndex:0];
        v109 = v22;
        int v110 = [v108 intValue];

        BOOL v111 = v110 == -1;
        uint64_t v22 = v109;
        if (v111)
        {
          LODWORD(v24) = a11;
          if (recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v106, v231, v19))
          {
            if (a4 < 2)
            {
              if (a11)
              {
                id v177 = [v226 lowercaseStringWithLocale:v230];
              }
              else
              {
                id v177 = v226;
              }
              id v31 = v177;
            }
            else
            {
              id v157 = v19;
              v158 = [v232 localizedStringForKey:@"Every %u months" value:&stru_1F1339A18 table:0];
              v159 = v158;
              v160 = NSString;
              v161 = v158;
              if (a11)
              {
                v161 = [v158 lowercaseStringWithLocale:v230];
              }
              objc_msgSend(v160, "localizedStringWithFormat:", v161, a4);
              id v31 = (id)objc_claimAutoreleasedReturnValue();
              if (a11) {

              }
              id v19 = v157;
              uint64_t v22 = v109;
            }
          }
          else
          {
            id v31 = 0;
          }
          goto LABEL_244;
        }
      }
      if (!v107 || v107 == 1 && (recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v106, v231, v19) & 1) != 0)
      {
        v112 = v22;
        v113 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        id v114 = v19;
        [v113 setTimeZone:v19];
        v115 = [v113 components:16 fromDate:v231];
        uint64_t v116 = [v115 day];

        LODWORD(v24) = a11;
        if ((unint64_t)(v116 - 29) > 2)
        {
          id v31 = 0;
          id v19 = v114;
          uint64_t v22 = v112;
LABEL_243:

          goto LABEL_244;
        }
        v221 = v112;
        if (a4 < 2)
        {
          v170 = [v232 localizedStringForKey:@"Every month that has %u days" value:&stru_1F1339A18 table:0];
          v118 = v170;
          uint64_t v24 = NSString;
          v119 = v170;
          if (a11)
          {
            v119 = [v170 lowercaseStringWithLocale:v230];
          }
          objc_msgSend((id)v24, "localizedStringWithFormat:", v119, v116);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = a11;
          if (!a11) {
            goto LABEL_242;
          }
        }
        else
        {
          v117 = [v232 localizedStringForKey:@"Every %u months that have %u days" value:&stru_1F1339A18 table:0];
          v118 = v117;
          uint64_t v24 = NSString;
          v119 = v117;
          if (a11)
          {
            v119 = [v117 lowercaseStringWithLocale:v230];
          }
          objc_msgSend((id)v24, "localizedStringWithFormat:", v119, a4, v116);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = a11;
          if (!a11) {
            goto LABEL_242;
          }
        }

LABEL_242:
        id v19 = v114;
        uint64_t v22 = v221;
        goto LABEL_243;
      }
      v236 = 0;
      uint64_t v128 = 0;
      id v214 = v16;
      id v217 = v19;
      v222 = v22;
      v225 = v23;
      id v209 = v106;
      do
      {
        id v129 = v22;
        v130 = [v106 objectAtIndex:v128];
        int v131 = [v130 intValue];

        if (v131 < 1)
        {
          uint64_t v22 = v129;
          goto LABEL_186;
        }
        if (!v236)
        {
          uint64_t v22 = v129;
          id v137 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          id v138 = [v237 _dayOfMonthAsString:v131];
          v236 = v137;
          [v137 appendString:v138];
LABEL_184:

          goto LABEL_186;
        }
        v132 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v133 = v132;
        if (v128 + 1 >= v107)
        {
          if (v107 == 2)
          {
            uint64_t v134 = [v132 localizedStringForKey:@"Recurrence rule last item format for a list with two terms.  The last part of a list: X and Y. Here %@ is 'Y'" value:@" and %@" table:0];
            int v136 = 0;
            int v135 = 1;
            v203 = v133;
            v204 = (void *)v134;
          }
          else
          {
            uint64_t v134 = [v132 localizedStringForKey:@"Recurrence rule last item format for a list with three or more items.  The last part of a list: X, Y, and Z. Here %@ is 'Z'", @", and %@", 0 value table];
            int v135 = 0;
            int v136 = 1;
            v201 = v133;
            v202 = (void *)v134;
          }
        }
        else
        {
          uint64_t v134 = [v132 localizedStringForKey:@", %@", &stru_1F1339A18, 0 value table];
          int v135 = 0;
          int v136 = 0;
          v205 = v133;
          v206 = (void *)v134;
        }
        v139 = [v237 _dayOfMonthAsString:v131];
        objc_msgSend(v236, "appendFormat:", v134, v139);

        id v16 = v214;
        if (v136)
        {
        }
        if (v135)
        {
        }
        uint64_t v23 = v225;
        if (v128 + 1 < v107)
        {

          id v138 = v205;
          id v19 = v217;
          uint64_t v22 = v222;
          id v106 = v209;
          goto LABEL_184;
        }
        id v19 = v217;
        uint64_t v22 = v222;
        id v106 = v209;
LABEL_186:
        ++v128;
      }
      while (v107 != v128);
      if (v236)
      {
        id v140 = v22;
        id v141 = v19;
        LODWORD(v24) = a11;
        if (a4 >= 2)
        {
          v142 = [v232 localizedStringForKey:@"Every %u months, each %@", &stru_1F1339A18, 0 value table];
          id v143 = v142;
          id v144 = NSString;
          v145 = v142;
          if (a11)
          {
            v145 = [v142 lowercaseStringWithLocale:v230];
          }
          objc_msgSend(v144, "localizedStringWithFormat:", v145, a4, v236);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          if (!a11) {
            goto LABEL_229;
          }
LABEL_228:

          goto LABEL_229;
        }
        v165 = [v232 localizedStringForKey:@"Every month, each %@", &stru_1F1339A18, 0 value table];
        id v143 = v165;
        v166 = NSString;
        v145 = v165;
        if (a11)
        {
          v145 = [v165 lowercaseStringWithLocale:v230];
        }
        objc_msgSend(v166, "localizedStringWithFormat:", v145, v236);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        if (a11) {
          goto LABEL_228;
        }
LABEL_229:

        id v19 = v141;
        uint64_t v22 = v140;
      }
      else
      {
        id v31 = 0;
        LODWORD(v24) = a11;
      }

LABEL_244:
LABEL_15:
      int v41 = 1;
LABEL_16:
      if (v31) {
        goto LABEL_157;
      }
      if (!v41) {
        goto LABEL_155;
      }
      if (a4 < 2)
      {
        if (v24)
        {
          id v123 = [v226 lowercaseStringWithLocale:v230];
        }
        else
        {
          id v123 = v226;
        }
        goto LABEL_156;
      }
      v42 = v22;
      id v43 = v19;
      unint64_t v44 = [v232 localizedStringForKey:@"Every %u months" value:&stru_1F1339A18 table:0];
      uint64_t v45 = v44;
      v46 = NSString;
      v47 = v44;
      if (v24)
      {
        v47 = [v44 lowercaseStringWithLocale:v230];
      }
      objc_msgSend(v46, "localizedStringWithFormat:", v47, a4);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (v24) {

      }
      id v19 = v43;
      uint64_t v22 = v42;
LABEL_157:
      long long v26 = v16;
      long long v30 = (void *)v230;

      long long v29 = v229;
LABEL_158:
      uint64_t v24 = (uint64_t)v226;
LABEL_320:
      id v197 = v31;

      return v197;
    case 3:
      id v48 = v16;
      v211 = v48;
      if ([v48 count])
      {
        v49 = [v48 objectAtIndex:0];
        v235 = [v237 _stringForByDayOfWeek:v49 setPositions:v18];
      }
      else
      {
        v235 = 0;
      }
      v220 = v22;
      id v71 = v17;
      id v216 = v19;
      if (![v71 count])
      {
        v72 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        [v72 setTimeZone:v19];
        v73 = v71;
        v74 = NSNumber;
        v75 = [v72 components:8 fromDate:v231];
        v76 = objc_msgSend(v74, "numberWithInteger:", objc_msgSend(v75, "month"));
        v244[0] = v76;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v244 count:1];

        id v71 = (id)v24;
        LODWORD(v24) = a11;
      }
      long long v26 = v16;
      long long v30 = (void *)v230;
      v208 = v71;
      if (!v235
        && (unint64_t)[v71 count] <= 1
        && (recurrenceMonthMatchesAnyMonthSpecifiedInByMonthList(v71, v231, v19) & 1) != 0)
      {
        goto LABEL_93;
      }
      uint64_t v77 = [v71 count];
      long long v239 = 0u;
      long long v240 = 0u;
      long long v241 = 0u;
      long long v242 = 0u;
      id v78 = v71;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v239 objects:v243 count:16];
      if (!v79)
      {

LABEL_93:
        int64_t v81 = 0;
        uint64_t v22 = v220;
        goto LABEL_306;
      }
      uint64_t v80 = v79;
      id v213 = v16;
      int64_t v81 = 0;
      uint64_t v82 = *(void *)v240;
      do
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v240 != v82) {
            objc_enumerationMutation(v78);
          }
          uint64_t v84 = objc_msgSend(v237, "_stringForMonthNumber:", (int)objc_msgSend(*(id *)(*((void *)&v239 + 1) + 8 * i), "intValue"));
          v85 = (void *)v84;
          if (v81)
          {
            if (v77 - 1 == i)
            {
              if ([v78 count] == 2) {
                objc_msgSend(v81, "appendFormat:", v233, v85);
              }
              else {
                objc_msgSend(v81, "appendFormat:", v234, v85);
              }
            }
            else
            {
              [v81 appendFormat:@", %@", v84];
            }
          }
          else
          {
            id v86 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            int64_t v81 = v86;
            if (!v235) {
              [v86 appendString:v85];
            }
          }
        }
        v77 -= v80;
        uint64_t v80 = [v78 countByEnumeratingWithState:&v239 objects:v243 count:16];
      }
      while (v80);

      if (v81 && !v235)
      {
        uint64_t v87 = v213;
        uint64_t v22 = v220;
        uint64_t v88 = (void *)v230;
        if (a4 < 2)
        {
          unint64_t v102 = [v232 localizedStringForKey:@"Every year in %@" value:&stru_1F1339A18 table:0];
          v103 = v102;
          v104 = NSString;
          int64_t v92 = v102;
          if (v24)
          {
            int64_t v92 = [v102 lowercaseStringWithLocale:v230];
          }
          v238 = v103;
          objc_msgSend(v104, "localizedStringWithFormat:", v92, v81, v199);
        }
        else
        {
          unint64_t v89 = [v232 localizedStringForKey:@"Every %u years in %@" value:&stru_1F1339A18 table:0];
          v90 = v89;
          uint64_t v91 = NSString;
          int64_t v92 = v89;
          if (v24)
          {
            int64_t v92 = [v89 lowercaseStringWithLocale:v230];
          }
          v238 = v90;
          objc_msgSend(v91, "localizedStringWithFormat:", v92, a4, v81);
        }
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        int v105 = 1;
        if ((v24 & 1) == 0) {
          goto LABEL_303;
        }
        goto LABEL_302;
      }
      uint64_t v87 = v213;
      uint64_t v22 = v220;
      uint64_t v88 = (void *)v230;
      if (!v235 || !v81)
      {
        long long v26 = v213;
        long long v30 = (void *)v230;
        goto LABEL_306;
      }
      v93 = [v78 objectAtIndexedSubscript:0];
      uint64_t v94 = [v237 _localizedOfMonthStringForMonth:v93];

      int64_t v92 = objc_msgSend(NSString, "localizedStringWithFormat:", v94, v81);
      v238 = (void *)v94;
      if ([v211 count] == 7)
      {
        if (![v227 count]) {
          goto LABEL_202;
        }
        v95 = v220;
        uint64_t v96 = [v227 objectAtIndex:0];
        int v97 = [v96 intValue];

        if (v97 != 1)
        {
          uint64_t v22 = v220;
          if (v97 == -1)
          {
            if (a4 >= 2)
            {
              v98 = @"Every %u years on the last day %@";
              goto LABEL_200;
            }
            v175 = @"Every year on the last day %@";
LABEL_293:
            uint64_t v187 = [v232 localizedStringForKey:v175 value:&stru_1F1339A18 table:0];
            v188 = NSString;
            v207 = (void *)v187;
            if (!v24) {
              goto LABEL_298;
            }
            goto LABEL_297;
          }
LABEL_202:
          int v105 = 0;
          id v31 = 0;
LABEL_302:

LABEL_303:
          long long v26 = v87;

          long long v30 = v88;
          if (v31)
          {
            id v19 = v216;
LABEL_317:
            long long v29 = v229;
            goto LABEL_318;
          }
          id v19 = v216;
          if (!v105)
          {
            id v31 = v22;
            goto LABEL_317;
          }
LABEL_306:
          if (a4 >= 2)
          {
            v215 = v26;
            id v189 = v19;
            v190 = [v232 localizedStringForKey:@"Every %u years" value:&stru_1F1339A18 table:0];
            v191 = v190;
            v192 = NSString;
            v193 = v190;
            if (v24)
            {
              v193 = [v190 lowercaseStringWithLocale:v30];
            }
            objc_msgSend(v192, "localizedStringWithFormat:", v193, a4);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            if (v24) {

            }
            id v19 = v189;
            uint64_t v24 = (uint64_t)v226;
            uint64_t v22 = v220;
            long long v26 = v215;
            long long v29 = v229;
LABEL_319:

            goto LABEL_320;
          }
          v194 = [v232 localizedStringForKey:@"Yearly" value:&stru_1F1339A18 table:0];
          v195 = v194;
          if (v24)
          {
            id v196 = [v194 lowercaseStringWithLocale:v30];
          }
          else
          {
            id v196 = v194;
          }
          id v31 = v196;
          long long v29 = v229;

LABEL_318:
          uint64_t v24 = (uint64_t)v226;
          goto LABEL_319;
        }
        if (a4 >= 2)
        {
          v167 = @"Every %u years on the first day %@";
          goto LABEL_275;
        }
        v176 = @"Every year on the first day %@";
LABEL_296:
        uint64_t v187 = [v232 localizedStringForKey:v176 value:&stru_1F1339A18 table:0];
        v207 = (void *)v187;
        v188 = NSString;
        uint64_t v22 = v95;
        if (!v24)
        {
LABEL_298:
          v164 = (void *)v187;
          objc_msgSend(v188, "localizedStringWithFormat:", v187, v92, v199);
LABEL_299:
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          int v105 = 0;
          if ((v24 & 1) == 0)
          {
LABEL_301:

            goto LABEL_302;
          }
LABEL_300:

          goto LABEL_301;
        }
LABEL_297:
        uint64_t v187 = [v207 lowercaseStringWithLocale:v230];
        goto LABEL_298;
      }
      if ([v211 isEqualToArray:shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray])
      {
        if (![v227 count]) {
          goto LABEL_202;
        }
        v95 = v220;
        v124 = [v227 objectAtIndex:0];
        int v125 = [v124 intValue];

        if (v125 != 1)
        {
          uint64_t v22 = v220;
          if (v125 != -1) {
            goto LABEL_202;
          }
          if (a4 < 2)
          {
            v175 = @"Every year on the last weekday %@";
            goto LABEL_293;
          }
          v98 = @"Every %u years on the last weekday %@";
LABEL_200:
          uint64_t v148 = [v232 localizedStringForKey:v98 value:&stru_1F1339A18 table:0];
          v149 = NSString;
          v207 = (void *)v148;
          if (!v24) {
            goto LABEL_277;
          }
          goto LABEL_276;
        }
        if (a4 < 2)
        {
          v176 = @"Every year on the first weekday %@";
          goto LABEL_296;
        }
        v167 = @"Every %u years on the first weekday %@";
      }
      else
      {
        if (![v211 isEqualToArray:shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray])
        {
          if (a4 < 2)
          {
            v173 = [v232 localizedStringForKey:@"Every year on the %@ %@" value:&stru_1F1339A18 table:0];
            v174 = NSString;
            v207 = v173;
            if (v24)
            {
              v173 = [v173 lowercaseStringWithLocale:v230];
            }
            v164 = v173;
            objc_msgSend(v174, "localizedStringWithFormat:", v173, v235, v92);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            int v105 = 1;
            if (!v24) {
              goto LABEL_301;
            }
          }
          else
          {
            v162 = [v232 localizedStringForKey:@"Every %u years on the %@ %@" value:&stru_1F1339A18 table:0];
            v163 = NSString;
            v207 = v162;
            if (v24)
            {
              v162 = [v162 lowercaseStringWithLocale:v230];
            }
            v164 = v162;
            objc_msgSend(v163, "localizedStringWithFormat:", v162, a4, v235, v92);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            int v105 = 1;
            if ((v24 & 1) == 0) {
              goto LABEL_301;
            }
          }
          goto LABEL_300;
        }
        if (![v227 count]) {
          goto LABEL_202;
        }
        v95 = v220;
        v146 = [v227 objectAtIndex:0];
        int v147 = [v146 intValue];

        if (v147 != 1)
        {
          uint64_t v22 = v220;
          if (v147 != -1) {
            goto LABEL_202;
          }
          if (a4 < 2)
          {
            v175 = @"Every year on the last weekend day %@";
            goto LABEL_293;
          }
          v98 = @"Every %u years on the last weekend day %@";
          goto LABEL_200;
        }
        if (a4 < 2)
        {
          v176 = @"Every year on the first weekend day %@";
          goto LABEL_296;
        }
        v167 = @"Every %u years on the first weekend day %@";
      }
LABEL_275:
      uint64_t v148 = [v232 localizedStringForKey:v167 value:&stru_1F1339A18 table:0];
      v207 = (void *)v148;
      v149 = NSString;
      uint64_t v22 = v95;
      if (!v24)
      {
LABEL_277:
        v164 = (void *)v148;
        objc_msgSend(v149, "localizedStringWithFormat:", v148, a4, v92);
        goto LABEL_299;
      }
LABEL_276:
      uint64_t v148 = [v207 lowercaseStringWithLocale:v230];
      goto LABEL_277;
    case 4:
      if (a4 >= 2)
      {
        id v223 = v17;
        long long v25 = v22;
        long long v26 = v16;
        id v27 = v19;
        long long v28 = @"Every %u hours";
LABEL_28:
        int64_t v50 = [v232 localizedStringForKey:v28 value:&stru_1F1339A18 table:0];
        int v51 = v50;
        int v52 = NSString;
        v53 = v50;
        if (a11)
        {
          v53 = [v50 lowercaseStringWithLocale:v230];
        }
        long long v30 = (void *)v230;
        objc_msgSend(v52, "localizedStringWithFormat:", v53, a4);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        if (a11) {

        }
        id v19 = v27;
        long long v29 = v229;
        uint64_t v22 = v25;
        uint64_t v23 = v223;
        uint64_t v24 = (uint64_t)v226;
        goto LABEL_320;
      }
      long long v26 = v16;
      v54 = @"Hourly";
LABEL_54:
      v63 = [v232 localizedStringForKey:v54 value:&stru_1F1339A18 table:0];
      v64 = v63;
      long long v30 = (void *)v230;
      if (a11)
      {
        objc_msgSend(v63, "lowercaseStringWithLocale:");
        id v65 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v65 = v63;
      }
      id v31 = v65;
      long long v29 = v229;

      goto LABEL_158;
    default:
      long long v26 = v16;
      long long v29 = v229;
      long long v30 = (void *)v230;
      id v31 = 0;
      goto LABEL_320;
  }
}

void __165__REMRecurrenceRuleFormatter_shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C978];
  v1 = +[REMRecurrenceDayOfWeek dayOfWeek:2];
  id v2 = +[REMRecurrenceDayOfWeek dayOfWeek:3];
  id v3 = +[REMRecurrenceDayOfWeek dayOfWeek:4];
  uint64_t v4 = +[REMRecurrenceDayOfWeek dayOfWeek:5];
  int64_t v5 = +[REMRecurrenceDayOfWeek dayOfWeek:6];
  uint64_t v6 = objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, v4, v5, 0);
  id v7 = (void *)shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray;
  shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray = v6;

  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v12 = +[REMRecurrenceDayOfWeek dayOfWeek:1];
  id v9 = +[REMRecurrenceDayOfWeek dayOfWeek:7];
  uint64_t v10 = objc_msgSend(v8, "arrayWithObjects:", v12, v9, 0);
  id v11 = (void *)shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray;
  shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray = v10;
}

+ (id)_stringForDayOfWeek:(int64_t)a3
{
  uint64_t v4 = [a1 _readableWeekDays];
  int64_t v5 = v4;
  if (a3 < 0 || [v4 count] <= a3)
  {
    uint64_t v6 = @"???";
  }
  else
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

+ (id)_stringForMonthNumber:(int64_t)a3
{
  uint64_t v4 = [a1 _readableMonths];
  int64_t v5 = v4;
  if (a3 >= 1 && [v4 count] >= a3)
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:a3 - 1];
  }
  else
  {
    uint64_t v6 = @"???";
  }

  return v6;
}

+ (id)_byDayOfWeekOrdinalStrings
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"last" value:&stru_1F1339A18 table:0];
  v11[0] = v3;
  uint64_t v4 = [v2 localizedStringForKey:@"first" value:&stru_1F1339A18 table:0];
  v11[1] = v4;
  int64_t v5 = [v2 localizedStringForKey:@"second" value:&stru_1F1339A18 table:0];
  v11[2] = v5;
  uint64_t v6 = [v2 localizedStringForKey:@"third" value:&stru_1F1339A18 table:0];
  v11[3] = v6;
  id v7 = [v2 localizedStringForKey:@"fourth" value:&stru_1F1339A18 table:0];
  v11[4] = v7;
  uint64_t v8 = [v2 localizedStringForKey:@"fifth" value:&stru_1F1339A18 table:0];
  v11[5] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

+ (id)_customByDayItemFormatLocalizedString
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Custom by-day item format" value:@"%@ %@" table:0];

  return v3;
}

+ (id)_stringForByDayOfWeek:(id)a3 setPositions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _byDayOfWeekOrdinalStrings];
  if (![v6 weekNumber])
  {
    if ([v7 count])
    {
      uint64_t v10 = [v7 objectAtIndex:0];
      unsigned int v11 = [v10 intValue];

      if (v11 == -1) {
        goto LABEL_12;
      }
      if (v11 - 1 < 5)
      {
        uint64_t v9 = v11;
        goto LABEL_13;
      }
    }
LABEL_11:
    id v12 = 0;
    goto LABEL_14;
  }
  if ([v6 weekNumber] == -1)
  {
LABEL_12:
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  if ([v6 weekNumber] > 5) {
    goto LABEL_11;
  }
  if ([v6 weekNumber] <= 0) {
    goto LABEL_11;
  }
  uint64_t v9 = [v6 weekNumber];
  if (v9 < 0) {
    goto LABEL_11;
  }
LABEL_13:
  id v12 = [v8 objectAtIndex:v9];
LABEL_14:
  uint64_t v13 = objc_msgSend(a1, "_stringForDayOfWeek:", objc_msgSend(v6, "dayOfTheWeek", v9) - 1);
  uint64_t v14 = NSString;
  v15 = [a1 _customByDayItemFormatLocalizedString];
  id v16 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v12, v13);

  return v16;
}

+ (id)_localizedOfMonthStringForMonth:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  int64_t v5 = [v3 bundleForClass:objc_opt_class()];
  int v6 = [v4 intValue];

  if ((v6 - 1) > 0xB)
  {
    id v7 = &stru_1F1339A18;
  }
  else
  {
    id v7 = [v5 localizedStringForKey:off_1E61DCB38[v6 - 1] value:&stru_1F1339A18 table:0];
  }

  return v7;
}

+ (int64_t)repeatTypeForRecurrenceRules:(id)a3 recurrenceDate:(id)a4 recurrenceTimeZone:(id)a5 getRepeatEnd:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 count];
  int64_t v14 = v13;
  if (!v13)
  {
    id v21 = 0;
    if (!a6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v13 == 1)
  {
    [v10 objectAtIndex:0];
    v15 = id v27 = a1;
    uint64_t v26 = [v15 frequency];
    uint64_t v25 = [v15 interval];
    uint64_t v24 = [v15 daysOfTheWeek];
    uint64_t v23 = [v15 daysOfTheMonth];
    [v15 monthsOfTheYear];
    v16 = id v29 = v12;
    [v15 weeksOfTheYear];
    id v17 = v28 = a6;
    id v18 = [v15 daysOfTheYear];
    id v19 = [v15 setPositions];
    uint64_t v20 = [v15 recurrenceEnd];
    id v30 = 0;
    int64_t v14 = [v27 repeatTypeForFrequency:v26 interval:v25 daysOfTheWeek:v24 daysOfTheMonth:v23 monthsOfTheYear:v16 weeksOfTheYear:v17 daysOfTheYear:v18 setPositions:v19 end:v20 recurrenceDate:v11 recurrenceTimeZone:v29 getRepeatEnd:&v30];
    id v21 = v30;

    a6 = v28;
    id v12 = v29;

    if (!v28) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v21 = 0;
  int64_t v14 = 11;
  if (a6) {
LABEL_8:
  }
    *a6 = v21;
LABEL_9:

  return v14;
}

+ (int64_t)repeatTypeForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11 recurrenceDate:(id)a12 recurrenceTimeZone:(id)a13 getRepeatEnd:(id *)a14
{
  id v17 = a5;
  id v62 = a6;
  id v18 = a7;
  id v19 = a8;
  id v60 = a9;
  id v61 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  uint64_t v23 = [v20 occurrenceCount];
  id v24 = v18;
  if (v23)
  {
    int64_t v25 = 11;
    uint64_t v26 = v17;
    id v27 = v19;
    long long v28 = a14;
    if (v20) {
      goto LABEL_3;
    }
LABEL_60:
    id v29 = 0;
    if (!v28) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v31 = v17;
  uint64_t v32 = [v31 count];
  v54 = v31;
  uint64_t v33 = v32;
  switch(a3)
  {
    case 0:
      int64_t v25 = 11;
      id v27 = v19;
      uint64_t v26 = v17;
      if (a4 != 1) {
        goto LABEL_55;
      }
      long long v28 = a14;
      if (!v32)
      {
        if ([v24 count]) {
          goto LABEL_54;
        }
        if ([v62 count]) {
          int64_t v25 = 11;
        }
        else {
          int64_t v25 = 2;
        }
      }
      goto LABEL_59;
    case 1:
      id v27 = v19;
      if ((unint64_t)(a4 - 1) > 1)
      {
        int64_t v25 = 11;
LABEL_57:
        long long v28 = a14;
      }
      else
      {
        long long v28 = a14;
        if ([v24 count] || objc_msgSend(v61, "count")) {
          goto LABEL_19;
        }
        if (!v33 || v33 == 1 && recurrenceDateMatchesAnyDaySpecifiedInByDayList(v31, v21, v22))
        {
          if (a4 == 1) {
            int64_t v25 = 5;
          }
          else {
            int64_t v25 = 6;
          }
        }
        else
        {
          if (a4 != 1)
          {
LABEL_19:
            int64_t v25 = 11;
            goto LABEL_58;
          }
          uint64_t v50 = [(id)objc_opt_class() daysTypeForDayArray:v31];
          uint64_t v51 = 11;
          if (v50 == 2) {
            uint64_t v51 = 3;
          }
          if (v50 == 3) {
            int64_t v25 = 4;
          }
          else {
            int64_t v25 = v51;
          }
        }
      }
LABEL_58:
      uint64_t v26 = v17;
      goto LABEL_59;
    case 2:
      BOOL v34 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4 == 6;
      int64_t v25 = 11;
      id v27 = v19;
      uint64_t v26 = v17;
      if (!v34) {
        goto LABEL_55;
      }
      long long v28 = a14;
      if (v32) {
        goto LABEL_59;
      }
      if ([v24 count]) {
        goto LABEL_54;
      }
      id v35 = v62;
      uint64_t v36 = [v35 count];
      id v59 = v35;
      int v37 = recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v35, v21, v22);
      int v38 = v37;
      uint64_t v56 = v36;
      if (v36 == 1) {
        int v39 = v37;
      }
      else {
        int v39 = 0;
      }
      id v40 = v61;
      if (![v40 count]) {
        goto LABEL_33;
      }
      int v52 = v38;
      int v53 = v39;
      int v41 = [v40 objectAtIndex:0];
      uint64_t v42 = [v41 integerValue];

      if (v42 == -1)
      {
        if (v52) {
          goto LABEL_72;
        }
LABEL_38:
        int64_t v25 = 11;
        goto LABEL_77;
      }
      int v39 = v53;
      if (v42) {
        goto LABEL_38;
      }
LABEL_33:
      if (v56) {
        int v43 = v39;
      }
      else {
        int v43 = 1;
      }
      if (v43 != 1) {
        goto LABEL_38;
      }
      unint64_t v44 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [v44 setTimeZone:v22];
      uint64_t v45 = [v44 components:16 fromDate:v21];
      uint64_t v57 = [v45 day];

      if ((unint64_t)(v57 - 29) < 3) {
        goto LABEL_38;
      }
LABEL_72:
      uint64_t v49 = 7;
      if (a4 == 6) {
        uint64_t v49 = 9;
      }
      if (a4 == 3) {
        int64_t v25 = 8;
      }
      else {
        int64_t v25 = v49;
      }
LABEL_77:
      id v47 = v59;

LABEL_78:
LABEL_59:

      if (!v20) {
        goto LABEL_60;
      }
LABEL_3:
      id v29 = [v20 endDate];

      if (v29)
      {
        id v29 = [v20 endDate];
      }
      if (v28) {
LABEL_6:
      }
        id *v28 = v29;
LABEL_7:

      return v25;
    case 3:
      uint64_t v46 = [v24 count];
      int64_t v25 = 11;
      id v27 = v19;
      uint64_t v26 = v17;
      if (a4 != 1) {
        goto LABEL_55;
      }
      long long v28 = a14;
      if (v33) {
        goto LABEL_59;
      }
      if (v46 && (v46 != 1 || !recurrenceMonthMatchesAnyMonthSpecifiedInByMonthList(v24, v21, v22))
        || [v60 count]
        || [v61 count]
        || [v27 count])
      {
        goto LABEL_54;
      }
      id v47 = v62;
      uint64_t v48 = [v47 count];
      if (!v48 || v48 == 1 && recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v47, v21, v22)) {
        int64_t v25 = 10;
      }
      else {
        int64_t v25 = 11;
      }
      goto LABEL_78;
    case 4:
      int64_t v25 = 11;
      id v27 = v19;
      uint64_t v26 = v17;
      if (a4 == 1)
      {
        long long v28 = a14;
        if (!v32)
        {
          if ([v24 count])
          {
LABEL_54:
            int64_t v25 = 11;
          }
          else if ([v62 count])
          {
            int64_t v25 = 11;
          }
          else
          {
            int64_t v25 = 1;
          }
        }
      }
      else
      {
LABEL_55:
        long long v28 = a14;
      }
      goto LABEL_59;
    default:
      int64_t v25 = 11;
      id v27 = v19;
      goto LABEL_57;
  }
}

+ (id)localizedDescriptionForRepeatType:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int64_t v5 = v4;
  switch(a3)
  {
    case 0:
      int v6 = @"Never";
      goto LABEL_13;
    case 1:
      int v6 = @"Hourly";
      goto LABEL_13;
    case 2:
      int v6 = @"Daily";
      goto LABEL_13;
    case 3:
      int v6 = @"Weekdays";
      goto LABEL_13;
    case 4:
      int v6 = @"Weekends";
      goto LABEL_13;
    case 5:
      int v6 = @"Weekly";
      goto LABEL_13;
    case 6:
      int v6 = @"Biweekly";
      goto LABEL_13;
    case 7:
      int v6 = @"Monthly";
      goto LABEL_13;
    case 8:
      int v6 = @"Every 3 Months";
      goto LABEL_13;
    case 9:
      int v6 = @"Every 6 Months";
      goto LABEL_13;
    case 10:
      int v6 = @"Yearly";
LABEL_13:
      id v7 = &stru_1F1339A18;
      goto LABEL_14;
    case 11:
      int v6 = @"LOCALIZED_CUSTOM_REPEAT_TYPE_DESCRIPTION";
      id v7 = @"Custom";
LABEL_14:
      uint64_t v8 = [v4 localizedStringForKey:v6 value:v7 table:0];
      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

@end