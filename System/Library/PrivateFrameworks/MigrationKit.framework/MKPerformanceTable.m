@interface MKPerformanceTable
- (MKAnalytics)analytics;
- (MKPerformanceTable)initWithJSONFile:(id)a3 analytics:(id)a4;
- (NSString)basePath;
- (id)createNumberFormatterWithLocale:(id)a3;
- (id)createSizeFormatter;
- (id)createThroughputFormatter;
- (id)createTimeFormatterWithLocale:(id)a3;
- (id)displayNamesByDataClass;
- (id)importTimesByDataClass;
- (void)generateTableFromJSONFile:(id)a3;
- (void)setAnalytics:(id)a3;
- (void)setBasePath:(id)a3;
- (void)writeToDisk;
@end

@implementation MKPerformanceTable

- (MKPerformanceTable)initWithJSONFile:(id)a3 analytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPerformanceTable;
  v8 = [(MKTable *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(MKPerformanceTable *)v8 setAnalytics:v7];
    v10 = [v6 stringByDeletingLastPathComponent];
    [(MKPerformanceTable *)v9 setBasePath:v10];

    [(MKPerformanceTable *)v9 generateTableFromJSONFile:v6];
  }

  return v9;
}

- (void)generateTableFromJSONFile:(id)a3
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v5 contentsAtPath:v4];

  if (v6)
  {
    id v181 = 0;
    id v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v181];
    v8 = v181;
    if (v8)
    {
      p_super = +[MKLog log];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[MKPerformanceTable generateTableFromJSONFile:]();
      }
    }
    else
    {
      id v107 = v4;
      v10 = [[MKPerformanceData alloc] initWithDictionary:v7];
      uint64_t v11 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
      v111 = [(MKPerformanceTable *)self createNumberFormatterWithLocale:v11];
      v104 = (void *)v11;
      v114 = [(MKPerformanceTable *)self createTimeFormatterWithLocale:v11];
      v113 = [(MKPerformanceTable *)self createSizeFormatter];
      v112 = [(MKPerformanceTable *)self createThroughputFormatter];
      long long v177 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      objc_super v12 = [(MKPerformanceData *)v10 dataClasses];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v177 objects:v188 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        unint64_t v15 = 0;
        uint64_t v16 = *(void *)v178;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v178 != v16) {
              objc_enumerationMutation(v12);
            }
            v15 += [*(id *)(*((void *)&v177 + 1) + 8 * i) size];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v177 objects:v188 count:16];
        }
        while (v14);
      }
      else
      {
        unint64_t v15 = 0;
      }

      v18 = [(MKPerformanceTable *)self analytics];
      v19 = [v18 payload];
      uint64_t v20 = [v19 elapsedTime];

      v106 = v6;
      v105 = v7;
      v108 = v10;
      if (v20)
      {
        v21 = [(MKPerformanceTable *)self analytics];
        v22 = [v21 payload];
        double v23 = (double)v15 / (double)(unint64_t)[v22 elapsedTime];
      }
      else
      {
        double v23 = 0.0;
      }
      v153 = NSString;
      v168 = [(MKPerformanceTable *)self analytics];
      v163 = [v168 payload];
      v148 = [v163 androidBrand];
      v158 = [(MKPerformanceTable *)self analytics];
      v24 = [v158 payload];
      v25 = [v24 androidModel];
      [(MKPerformanceTable *)self analytics];
      v26 = v115 = self;
      v27 = [v26 payload];
      v28 = [v27 androidAPILevel];
      v29 = [(MKPerformanceTable *)self analytics];
      v30 = [v29 payload];
      v31 = [v30 androidVersion];
      uint64_t v32 = [v153 stringWithFormat:@"%@ %@ - API %@ - M2iOS %@ ", v148, v25, v28, v31];

      v103 = (void *)v32;
      v33 = +[MKTableRow rowWithTitle:v32];
      [(MKTable *)v115 addRow:v33];

      v34 = +[MKTableRow separatorRow];
      [(MKTable *)v115 addRow:v34];

      v169 = [NSString string];
      v164 = +[MKTableCell cellWithValue:v169 formatter:0];
      v187[0] = v164;
      v159 = [NSString string];
      v154 = +[MKTableCell cellWithValue:v159 formatter:0];
      v187[1] = v154;
      v149 = +[MKTableCell cellWithValue:@"Size" formatter:0 alignment:1];
      v187[2] = v149;
      v144 = [NSString string];
      v139 = +[MKTableCell cellWithValue:v144 formatter:0];
      v187[3] = v139;
      v137 = [NSString string];
      v134 = +[MKTableCell cellWithValue:v137 formatter:0];
      v187[4] = v134;
      v131 = [NSString string];
      v128 = +[MKTableCell cellWithValue:v131 formatter:0];
      v187[5] = v128;
      v35 = [NSString string];
      v36 = +[MKTableCell cellWithValue:v35 formatter:0];
      v187[6] = v36;
      v37 = [NSString string];
      v38 = +[MKTableCell cellWithValue:v37 formatter:0];
      v187[7] = v38;
      v39 = +[MKTableCell cellWithValue:@"Duration" formatter:0 alignment:1];
      v187[8] = v39;
      v40 = +[MKTableCell cellWithValue:@"Throughput (MB/s)" formatter:0 columnSpan:2 alignment:1];
      v187[9] = v40;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v187 count:10];
      v42 = +[MKTableRow rowWithCells:v41];
      [(MKTable *)v115 addRow:v42];

      v43 = +[MKTableRow separatorRow];
      [(MKTable *)v115 addRow:v43];

      v170 = +[MKTableCell cellWithValue:@"Whole Migration" formatter:0];
      v186[0] = v170;
      v165 = [NSString string];
      v160 = +[MKTableCell cellWithValue:v165 formatter:0];
      v186[1] = v160;
      v155 = [NSNumber numberWithUnsignedLong:v15];
      v150 = +[MKTableCell cellWithValue:v155 formatter:v113 alignment:2];
      v186[2] = v150;
      v145 = [NSString string];
      v141 = +[MKTableCell cellWithValue:v145 formatter:0];
      v186[3] = v141;
      v140 = [NSString string];
      v135 = +[MKTableCell cellWithValue:v140 formatter:0];
      v186[4] = v135;
      v132 = [NSString string];
      v129 = +[MKTableCell cellWithValue:v132 formatter:0];
      v186[5] = v129;
      v126 = [NSString string];
      v124 = +[MKTableCell cellWithValue:v126 formatter:0];
      v186[6] = v124;
      v122 = [NSString string];
      v120 = +[MKTableCell cellWithValue:v122 formatter:0];
      v186[7] = v120;
      v44 = NSNumber;
      v45 = [(MKAnalytics *)v115->_analytics payload];
      v46 = objc_msgSend(v44, "numberWithUnsignedLongLong:", objc_msgSend(v45, "elapsedTime"));
      v47 = +[MKTableCell cellWithValue:v46 formatter:v114 alignment:2];
      v186[8] = v47;
      v48 = [NSString string];
      v49 = +[MKTableCell cellWithValue:v48 formatter:0];
      v186[9] = v49;
      v50 = [NSNumber numberWithDouble:v23];
      v51 = +[MKTableCell cellWithValue:v50 formatter:v112 alignment:2];
      v186[10] = v51;
      v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:11];
      v53 = +[MKTableRow rowWithCells:v52];
      [(MKTable *)v115 addRow:v53];

      v54 = +[MKTableRow separatorRow];
      [(MKTable *)v115 addRow:v54];

      v55 = +[MKTableCell cellWithValue:@"Data Class" formatter:0];
      v185[0] = v55;
      v56 = +[MKTableCell cellWithValue:@"Item Count" formatter:0 alignment:1];
      v185[1] = v56;
      v57 = +[MKTableCell cellWithValue:@"Size" formatter:0 alignment:1];
      v185[2] = v57;
      v58 = +[MKTableCell cellWithValue:@"Phase Duration" formatter:0 columnSpan:6 alignment:1];
      v185[3] = v58;
      v59 = +[MKTableCell cellWithValue:@"Throughput (MB/s)" formatter:0 columnSpan:2 alignment:1];
      v185[4] = v59;
      v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v185 count:5];
      v61 = +[MKTableRow rowWithCells:v60];
      [(MKTable *)v115 addRow:v61];

      v171 = [NSString string];
      v166 = +[MKTableCell cellWithValue:v171 formatter:0];
      v184[0] = v166;
      v161 = [NSString string];
      v156 = +[MKTableCell cellWithValue:v161 formatter:0];
      v184[1] = v156;
      v151 = [NSString string];
      v146 = +[MKTableCell cellWithValue:v151 formatter:0];
      v184[2] = v146;
      v142 = +[MKTableCell cellWithValue:@"Prep" formatter:0 alignment:1];
      v184[3] = v142;
      v62 = +[MKTableCell cellWithValue:@"Export" formatter:0 alignment:1];
      v184[4] = v62;
      v63 = +[MKTableCell cellWithValue:@"Queue" formatter:0 alignment:1];
      v184[5] = v63;
      v64 = +[MKTableCell cellWithValue:@"Transfer" formatter:0 alignment:1];
      v184[6] = v64;
      v65 = +[MKTableCell cellWithValue:@"Import" formatter:0 alignment:1];
      v184[7] = v65;
      v66 = +[MKTableCell cellWithValue:@"Total" formatter:0 alignment:1];
      v184[8] = v66;
      v67 = +[MKTableCell cellWithValue:@"Transfer" formatter:0 alignment:1];
      v184[9] = v67;
      v68 = +[MKTableCell cellWithValue:@"Total" formatter:0 alignment:1];
      v184[10] = v68;
      v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:v184 count:11];
      v70 = +[MKTableRow rowWithCells:v69];
      [(MKTable *)v115 addRow:v70];

      v71 = +[MKTableRow separatorRow];
      [(MKTable *)v115 addRow:v71];

      v117 = [(MKPerformanceTable *)v115 displayNamesByDataClass];
      v110 = [(MKPerformanceTable *)v115 importTimesByDataClass];
      long long v173 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      obuint64_t j = [(MKPerformanceData *)v108 dataClasses];
      uint64_t v118 = [obj countByEnumeratingWithState:&v173 objects:v183 count:16];
      if (v118)
      {
        uint64_t v116 = *(void *)v174;
        do
        {
          for (uint64_t j = 0; j != v118; ++j)
          {
            if (*(void *)v174 != v116) {
              objc_enumerationMutation(obj);
            }
            v73 = *(void **)(*((void *)&v173 + 1) + 8 * j);
            v74 = [v73 name];
            v75 = [v117 objectForKey:v74];

            if (v75)
            {
              v76 = [v73 name];
              v77 = [v110 objectForKey:v76];

              [v73 preparationTime];
              double v79 = v78;
              [v73 exportTime];
              double v81 = v79 + v80;
              [v73 networkQueueTime];
              double v83 = v81 + v82;
              [v73 transferTime];
              double v85 = v83 + v84;
              [v77 doubleValue];
              double v87 = v85 + v86;
              double v88 = 0.0;
              if (v87 > 0.0) {
                double v88 = (double)(unint64_t)[v73 size] / v87;
              }
              v167 = +[MKTableCell cellWithValue:v75 formatter:0];
              v172 = v75;
              v182[0] = v167;
              v162 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v73, "itemCount"));
              v157 = +[MKTableCell cellWithValue:v162 formatter:v111 alignment:2];
              v182[1] = v157;
              v152 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v73, "size"));
              v147 = +[MKTableCell cellWithValue:v152 formatter:v113 alignment:2];
              v182[2] = v147;
              v89 = NSNumber;
              [v73 preparationTime];
              v143 = objc_msgSend(v89, "numberWithDouble:");
              v138 = +[MKTableCell cellWithValue:v143 formatter:v114 alignment:2];
              v182[3] = v138;
              v90 = NSNumber;
              [v73 exportTime];
              v136 = objc_msgSend(v90, "numberWithDouble:");
              v133 = +[MKTableCell cellWithValue:v136 formatter:v114 alignment:2];
              v182[4] = v133;
              v91 = NSNumber;
              [v73 networkQueueTime];
              v130 = objc_msgSend(v91, "numberWithDouble:");
              v127 = +[MKTableCell cellWithValue:v130 formatter:v114 alignment:2];
              v182[5] = v127;
              v92 = NSNumber;
              [v73 transferTime];
              v123 = objc_msgSend(v92, "numberWithDouble:");
              v121 = +[MKTableCell cellWithValue:v123 formatter:v114 alignment:2];
              v182[6] = v121;
              v119 = +[MKTableCell cellWithValue:v77 formatter:v114 alignment:2];
              v182[7] = v119;
              v93 = [NSNumber numberWithDouble:v87];
              v94 = +[MKTableCell cellWithValue:v93 formatter:v114 alignment:2];
              v182[8] = v94;
              v125 = v77;
              v95 = NSNumber;
              [v73 transferSpeed];
              v96 = objc_msgSend(v95, "numberWithDouble:");
              v97 = +[MKTableCell cellWithValue:v96 formatter:v112 alignment:2];
              v182[9] = v97;
              v98 = [NSNumber numberWithDouble:v88];
              v99 = +[MKTableCell cellWithValue:v98 formatter:v112 alignment:2];
              v182[10] = v99;
              v100 = [MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:11];
              v101 = +[MKTableRow rowWithCells:v100];
              [(MKTable *)v115 addRow:v101];

              v75 = v172;
              [v73 size];
            }
          }
          uint64_t v118 = [obj countByEnumeratingWithState:&v173 objects:v183 count:16];
        }
        while (v118);
      }

      v102 = +[MKTableRow separatorRow];
      [(MKTable *)v115 addRow:v102];

      id v6 = v106;
      id v4 = v107;
      id v7 = v105;
      v8 = 0;
      p_super = &v108->super;
    }
  }
  else
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKPerformanceTable generateTableFromJSONFile:]();
    }
  }
}

- (void)writeToDisk
{
  v18 = NSString;
  double v23 = [(MKPerformanceTable *)self analytics];
  v22 = [v23 payload];
  v21 = [v22 androidBrand];
  v17 = [v21 lowercaseString];
  uint64_t v20 = [(MKPerformanceTable *)self analytics];
  v19 = [v20 payload];
  v3 = [v19 androidModel];
  id v4 = [v3 lowercaseString];
  v5 = [(MKPerformanceTable *)self analytics];
  id v6 = [v5 payload];
  id v7 = [v6 androidAPILevel];
  v8 = [(MKPerformanceTable *)self analytics];
  v9 = [v8 payload];
  v10 = [v9 androidVersion];
  uint64_t v11 = [v18 stringWithFormat:@"perf-results_%@_%@_api-%@_v%@.csv", v17, v4, v7, v10];

  objc_super v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/ "];
  uint64_t v13 = [v11 componentsSeparatedByCharactersInSet:v12];
  uint64_t v14 = [v13 componentsJoinedByString:@"-"];

  unint64_t v15 = [(MKPerformanceTable *)self basePath];
  uint64_t v16 = [v15 stringByAppendingPathComponent:v14];
  v24.receiver = self;
  v24.super_class = (Class)MKPerformanceTable;
  [(MKTable *)&v24 writeToDisk:v16];
}

- (id)createNumberFormatterWithLocale:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08A30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setLocale:v4];

  [v5 setNumberStyle:1];
  [v5 setMaximumFractionDigits:1];
  [v5 setRoundingMode:6];
  return v5;
}

- (id)createTimeFormatterWithLocale:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MKTimeFormatter);
  [(MKTimeFormatter *)v4 setLocale:v3];

  return v4;
}

- (id)createSizeFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F086F0]);
  [v2 setCountStyle:0];
  [v2 setAllowsNonnumericFormatting:0];
  [v2 setZeroPadsFractionDigits:1];
  [v2 setAllowedUnits:12];
  return v2;
}

- (id)createThroughputFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F086F0]);
  [v2 setCountStyle:0];
  [v2 setAllowedUnits:12];
  [v2 setIncludesUnit:0];
  [v2 setZeroPadsFractionDigits:1];
  return v2;
}

- (id)displayNamesByDataClass
{
  return &unk_26DF7B208;
}

- (id)importTimesByDataClass
{
  v46[12] = *MEMORY[0x263EF8340];
  v45[0] = @"accessibility_settings";
  v44 = [(MKPerformanceTable *)self analytics];
  v43 = [v44 payload];
  v42 = [v43 accessibilitySettings];
  v41 = [v42 importElapsedTime];
  v46[0] = v41;
  v45[1] = @"accounts";
  v40 = [(MKPerformanceTable *)self analytics];
  v39 = [v40 payload];
  v38 = [v39 accounts];
  v37 = [v38 importElapsedTime];
  v46[1] = v37;
  v46[2] = &unk_26DF7ADD0;
  v45[2] = @"application";
  v45[3] = @"calendars";
  v36 = [(MKPerformanceTable *)self analytics];
  v35 = [v36 payload];
  v34 = [v35 calendars];
  v33 = [v34 importElapsedTime];
  v46[3] = v33;
  v45[4] = @"contacts";
  uint64_t v32 = [(MKPerformanceTable *)self analytics];
  v31 = [v32 payload];
  v30 = [v31 contacts];
  v29 = [v30 importElapsedTime];
  v46[4] = v29;
  v45[5] = @"display_settings";
  v28 = [(MKPerformanceTable *)self analytics];
  v27 = [v28 payload];
  v26 = [v27 displaySettings];
  v25 = [v26 importElapsedTime];
  v46[5] = v25;
  v45[6] = @"files";
  objc_super v24 = [(MKPerformanceTable *)self analytics];
  double v23 = [v24 payload];
  v22 = [v23 files];
  v21 = [v22 importElapsedTime];
  v46[6] = v21;
  v45[7] = @"messages";
  uint64_t v20 = [(MKPerformanceTable *)self analytics];
  v19 = [v20 payload];
  v18 = [v19 messages];
  v17 = [v18 importElapsedTime];
  v46[7] = v17;
  v45[8] = @"photos";
  uint64_t v16 = [(MKPerformanceTable *)self analytics];
  unint64_t v15 = [v16 payload];
  id v3 = [v15 photos];
  id v4 = [v3 importElapsedTime];
  v46[8] = v4;
  v45[9] = @"videos";
  id v5 = [(MKPerformanceTable *)self analytics];
  id v6 = [v5 payload];
  id v7 = [v6 videos];
  v8 = [v7 importElapsedTime];
  v46[9] = v8;
  v45[10] = @"whatsapp_container";
  v9 = [(MKPerformanceTable *)self analytics];
  v10 = [v9 payload];
  uint64_t v11 = [v10 whatsapp];
  objc_super v12 = [v11 importElapsedTime];
  v45[11] = @"whatsapp_placeholder";
  v46[10] = v12;
  v46[11] = &unk_26DF7ADD0;
  id v14 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:12];

  return v14;
}

- (MKAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (NSString)basePath
{
  return self->_basePath;
}

- (void)setBasePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

- (void)generateTableFromJSONFile:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "%@: Failed to read performance data from %@");
}

- (void)generateTableFromJSONFile:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "%@: Failed to deserialize JSON data. error=%@");
}

@end