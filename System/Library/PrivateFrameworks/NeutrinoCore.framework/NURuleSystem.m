@interface NURuleSystem
+ (BOOL)supportsSecureCoding;
- (BOOL)enableLogging;
- (NSArray)agenda;
- (NSArray)executed;
- (NSArray)rules;
- (NSDictionary)constants;
- (NSDictionary)facts;
- (NSDictionary)state;
- (NSString)runLog;
- (NURuleSystem)init;
- (NURuleSystem)initWithCoder:(id)a3;
- (double)gradeForFact:(id)a3;
- (double)maximumGradeForFacts:(id)a3;
- (double)minimumGradeForFacts:(id)a3;
- (id)debugDescription;
- (id)debugQuickLookObject;
- (void)_addRuleToAgenda:(id)a3;
- (void)addRule:(id)a3;
- (void)addRulesFromArray:(id)a3;
- (void)assertFact:(id)a3;
- (void)assertFact:(id)a3 grade:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate;
- (void)removeAllRules;
- (void)reset;
- (void)resetAndEvaluateWithInitialState:(id)a3;
- (void)retractFact:(id)a3;
- (void)retractFact:(id)a3 grade:(double)a4;
- (void)setConstants:(id)a3;
- (void)setEnableLogging:(BOOL)a3;
- (void)setStateObject:(id)a3 forKey:(id)a4;
@end

@implementation NURuleSystem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLog, 0);
  objc_storeStrong((id *)&self->_gradeByFact, 0);
  objc_storeStrong((id *)&self->_executed, 0);
  objc_storeStrong((id *)&self->_agenda, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_constants, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setEnableLogging:(BOOL)a3
{
  self->_enableLogging = a3;
}

- (BOOL)enableLogging
{
  return self->_enableLogging;
}

- (NSDictionary)state
{
  return &self->_state->super;
}

- (id)debugQuickLookObject
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 appendString:@"<html>"];
  [v3 appendString:@"<body>"];
  [v3 appendString:@"<style>"];
  [v3 appendString:@"body { background-color: white; } "];
  [v3 appendString:@"h1 { color: black; margin-left: 2px; } "];
  [v3 appendString:@"h2 { color: black; margin-left: 1px; } "];
  [v3 appendString:@"table { color: black; margin-left: 0px; border: 0px solid white; } "];
  [v3 appendString:@"td { color: black; } "];
  [v3 appendString:@"p, pre { color: black; } "];
  [v3 appendString:@"</style>"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<h1>%@</h1>", v5];

  [v3 appendString:@"<h2>Constants</h2>"];
  [v3 appendString:@"<table>"];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = self->_constants;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v78 objects:v87 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v79 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        [v3 appendString:@"<tr>"];
        v12 = [(NSMutableDictionary *)self->_constants objectForKeyedSubscript:v11];
        [v3 appendFormat:@"<td>%d.</td><td>%@</td><td>%@</td>", v8 + i, v11, v12];

        [v3 appendString:@"</tr>"];
      }
      uint64_t v8 = (v8 + i);
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v7);
  }

  [v3 appendString:@"</table><br />"];
  [v3 appendString:@"<h2>State</h2>"];
  [v3 appendString:@"<table>"];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obja = self->_state;
  uint64_t v13 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v75 != v16) {
          objc_enumerationMutation(obja);
        }
        uint64_t v18 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        [v3 appendString:@"<tr>"];
        v19 = [(NSMutableDictionary *)self->_state objectForKeyedSubscript:v18];
        [v3 appendFormat:@"<td>%d.</td><td>%@</td><td>%@</td>", v15 + j, v18, v19];

        [v3 appendString:@"</tr>"];
      }
      uint64_t v15 = (v15 + j);
      uint64_t v14 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v14);
  }

  [v3 appendString:@"</table><br />"];
  [v3 appendString:@"<h2>Rules</h2>"];
  [v3 appendString:@"<table>"];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  objb = self->_rules;
  uint64_t v20 = [(NSMutableArray *)objb countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(objb);
        }
        v25 = *(void **)(*((void *)&v70 + 1) + 8 * k);
        [v3 appendString:@"<tr>"];
        v26 = [v25 debugDescription];
        [v3 appendFormat:@"<td>%d.</td><td>%@</td>", v22 + k, v26];

        [v3 appendString:@"</tr>"];
      }
      uint64_t v22 = (v22 + k);
      uint64_t v21 = [(NSMutableArray *)objb countByEnumeratingWithState:&v70 objects:v85 count:16];
    }
    while (v21);
  }

  [v3 appendString:@"</table><br />"];
  [v3 appendString:@"<h2>Facts</h2>"];
  [v3 appendString:@"<table>"];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id objc = [(NSMapTable *)self->_gradeByFact keyEnumerator];
  uint64_t v27 = [objc countByEnumeratingWithState:&v66 objects:v84 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)v67;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v67 != v30) {
          objc_enumerationMutation(objc);
        }
        uint64_t v32 = *(void *)(*((void *)&v66 + 1) + 8 * m);
        [v3 appendString:@"<tr>"];
        v33 = [(NSMapTable *)self->_gradeByFact objectForKey:v32];
        [v3 appendFormat:@"<td>%d.</td><td>%@</td><td>%@</td>", v29 + m, v32, v33];

        [v3 appendString:@"</tr>"];
      }
      uint64_t v29 = (v29 + m);
      uint64_t v28 = [objc countByEnumeratingWithState:&v66 objects:v84 count:16];
    }
    while (v28);
  }

  [v3 appendString:@"</table><br />"];
  [v3 appendString:@"<h2>Agenda</h2>"];
  [v3 appendString:@"<table>"];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  objd = self->_agenda;
  uint64_t v34 = [(NSMutableArray *)objd countByEnumeratingWithState:&v62 objects:v83 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v63;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(objd);
        }
        v38 = *(void **)(*((void *)&v62 + 1) + 8 * n);
        uint64_t v39 = [(NSMutableArray *)self->_rules indexOfObject:v38];
        [v3 appendString:@"<tr>"];
        v40 = [v38 debugDescription];
        [v3 appendFormat:@"<td>%d.</td><td>%@</td>", v39, v40];

        [v3 appendString:@"</tr>"];
      }
      uint64_t v35 = [(NSMutableArray *)objd countByEnumeratingWithState:&v62 objects:v83 count:16];
    }
    while (v35);
  }

  [v3 appendString:@"</table><br />"];
  [v3 appendString:@"<h2>Executed</h2>"];
  [v3 appendString:@"<table>"];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obje = self->_executed;
  uint64_t v41 = [(NSMutableArray *)obje countByEnumeratingWithState:&v58 objects:v82 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(obje);
        }
        v45 = *(void **)(*((void *)&v58 + 1) + 8 * ii);
        uint64_t v46 = [(NSMutableArray *)self->_rules indexOfObject:v45];
        [v3 appendString:@"<tr>"];
        v47 = [v45 debugDescription];
        [v3 appendFormat:@"<td>%d.</td><td>%@</td>", v46, v47];

        [v3 appendString:@"</tr>"];
      }
      uint64_t v42 = [(NSMutableArray *)obje countByEnumeratingWithState:&v58 objects:v82 count:16];
    }
    while (v42);
  }

  [v3 appendString:@"</table><br />"];
  [v3 appendString:@"<h2>Run Log</h2>"];
  [v3 appendString:@"<pre>"];
  [v3 appendString:self->_runLog];
  [v3 appendString:@"</pre>"];
  [v3 appendString:@"</body>"];
  [v3 appendString:@"</html>"];
  id v48 = objc_alloc(MEMORY[0x1E4F28B18]);
  v49 = [v3 dataUsingEncoding:4];
  v50 = (void *)[v48 initWithData:v49 options:&unk_1F004A348 documentAttributes:0 error:0];

  return v50;
}

- (id)debugDescription
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@, %p>\n", v5, self];

  [v3 appendString:@".constants {\n"];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_constants allKeys];
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_25898];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_constants objectForKeyedSubscript:v12];
        [v3 appendFormat:@"%@ = %@,\n", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v9);
  }

  [v3 appendString:@"}\n"];
  [v3 appendString:@".state {\n"];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v14 = [(NSMutableDictionary *)self->_state allKeys];
  uint64_t v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_25898];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v65 + 1) + 8 * j);
        uint64_t v21 = [(NSMutableDictionary *)self->_state objectForKeyedSubscript:v20];
        [v3 appendFormat:@"%@ = %@,\n", v20, v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v17);
  }

  [v3 appendString:@"}\n"];
  [v3 appendString:@".rules {\n"];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v22 = self->_rules;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v61 objects:v76 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v62 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = [*(id *)(*((void *)&v61 + 1) + 8 * k) debugDescription];
        [v3 appendFormat:@"%d: %@,\n", v25 + k, v28];
      }
      uint64_t v25 = (v25 + k);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v61 objects:v76 count:16];
    }
    while (v24);
  }

  [v3 appendString:@"}\n"];
  [v3 appendString:@".facts {\n"];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v29 = [(NSMapTable *)self->_gradeByFact keyEnumerator];
  uint64_t v30 = [v29 allObjects];
  v31 = [v30 sortedArrayUsingComparator:&__block_literal_global_25898];

  uint64_t v32 = [v31 countByEnumeratingWithState:&v57 objects:v75 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v57 + 1) + 8 * m);
        v37 = [(NSMapTable *)self->_gradeByFact objectForKey:v36];
        [v3 appendFormat:@"%@ = %@,\n", v36, v37];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v57 objects:v75 count:16];
    }
    while (v33);
  }

  [v3 appendString:@"}\n"];
  [v3 appendString:@".agenda { "];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v38 = self->_agenda;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v53 objects:v74 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t n = 0; n != v40; ++n)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(v38);
        }
        [v3 appendFormat:@"%d, ", -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", *(void *)(*((void *)&v53 + 1) + 8 * n))];
      }
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v53 objects:v74 count:16];
    }
    while (v40);
  }

  [v3 appendString:@"}\n"];
  [v3 appendString:@".executed { "];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v43 = self->_executed;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v49 objects:v73 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v50;
    do
    {
      for (iuint64_t i = 0; ii != v45; ++ii)
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(v43);
        }
        [v3 appendFormat:@"%d, ", -[NSMutableArray indexOfObject:](self->_rules, "indexOfObject:", *(void *)(*((void *)&v49 + 1) + 8 * ii))];
      }
      uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v49 objects:v73 count:16];
    }
    while (v45);
  }

  [v3 appendString:@"}\n"];
  [v3 appendString:@".runlog {\n"];
  [v3 appendString:self->_runLog];
  [v3 appendString:@"}\n"];

  return v3;
}

uint64_t __32__NURuleSystem_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)runLog
{
  return (NSString *)[NSString stringWithString:self->_runLog];
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_agenda removeAllObjects];
  [(NSMutableArray *)self->_executed removeAllObjects];
  [(NSMapTable *)self->_gradeByFact removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_rules;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NURuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  -[NSMutableString deleteCharactersInRange:](self->_runLog, "deleteCharactersInRange:", 0, [(NSMutableString *)self->_runLog length]);
}

- (void)retractFact:(id)a3 grade:(double)a4
{
  id v12 = a3;
  uint64_t v6 = -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:");
  [v6 doubleValue];
  double v8 = v7;

  if (v8 != 0.0)
  {
    double v9 = fmax(v8 - a4, 0.0);
    if (self->_enableLogging) {
      [(NSMutableString *)self->_runLog appendFormat:@"retracted '%@' by -%.2f to %.2f\n", v12, *(void *)&a4, *(void *)&v9];
    }
    if (v9 != v8)
    {
      gradeByFact = self->_gradeByFact;
      long long v11 = [NSNumber numberWithDouble:v9];
      [(NSMapTable *)gradeByFact setObject:v11 forKey:v12];

      [(NURuleSystem *)self evaluate];
    }
  }
}

- (void)retractFact:(id)a3
{
}

- (void)assertFact:(id)a3 grade:(double)a4
{
  id v12 = a3;
  uint64_t v6 = -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:");
  [v6 doubleValue];
  double v8 = v7;

  if (v8 + a4 <= 1.0) {
    double v9 = v8 + a4;
  }
  else {
    double v9 = 1.0;
  }
  if (self->_enableLogging) {
    [(NSMutableString *)self->_runLog appendFormat:@"asserted '%@' by +%.2f to %.2f\n", v12, *(void *)&a4, *(void *)&v9];
  }
  if (v9 != v8)
  {
    gradeByFact = self->_gradeByFact;
    long long v11 = [NSNumber numberWithDouble:v9];
    [(NSMapTable *)gradeByFact setObject:v11 forKey:v12];

    [(NURuleSystem *)self evaluate];
  }
}

- (void)assertFact:(id)a3
{
}

- (double)maximumGradeForFacts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [(NSMapTable *)self->_gradeByFact objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v10 doubleValue];
        double v12 = v11;

        if (v12 > v8) {
          double v8 = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)minimumGradeForFacts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    double v8 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [(NSMapTable *)self->_gradeByFact objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v10 doubleValue];
        double v12 = v11;

        if (v12 < v8) {
          double v8 = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 1.0;
  }

  return v8;
}

- (double)gradeForFact:(id)a3
{
  v3 = [(NSMapTable *)self->_gradeByFact objectForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NSDictionary)facts
{
  return [(NSMapTable *)self->_gradeByFact dictionaryRepresentation];
}

- (void)removeAllRules
{
  [(NSMutableArray *)self->_rules removeAllObjects];
  [(NSMutableArray *)self->_agenda removeAllObjects];
  executed = self->_executed;

  [(NSMutableArray *)executed removeAllObjects];
}

- (void)addRulesFromArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableArray *)self->_rules addObjectsFromArray:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NURuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addRule:(id)a3
{
  rules = self->_rules;
  id v5 = a3;
  [(NSMutableArray *)rules addObject:v5];
  [(NURuleSystem *)self _addRuleToAgenda:v5];
}

- (void)_addRuleToAgenda:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_agenda;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "salience", (void)v13);
        if (v12 < [v4 salience])
        {
          uint64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_12:

  [(NSMutableArray *)self->_agenda insertObject:v4 atIndex:v11];
}

- (NSArray)executed
{
  return (NSArray *)self->_executed;
}

- (NSArray)agenda
{
  return (NSArray *)self->_agenda;
}

- (NSArray)rules
{
  return (NSArray *)self->_rules;
}

- (void)setConstants:(id)a3
{
}

- (NSDictionary)constants
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_constants];
}

- (void)setStateObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_enableLogging)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_state valueForKey:v6];
    runLog = self->_runLog;
    if (v7) {
      [(NSMutableString *)runLog appendFormat:@"replacing state for key '%@' of value '%@' to new value '%@'\n", v6, v7, v10];
    }
    else {
      [(NSMutableString *)runLog appendFormat:@"setting state for key '%@' to value '%@'\n", v6, v10, v9];
    }
  }
  [(NSMutableDictionary *)self->_state setObject:v10 forKey:v6];
}

- (void)resetAndEvaluateWithInitialState:(id)a3
{
  id v4 = a3;
  [(NURuleSystem *)self reset];
  [(NSMutableDictionary *)self->_state setDictionary:v4];

  [(NURuleSystem *)self evaluate];
}

- (void)evaluate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_agenda;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    while (2)
    {
      uint64_t v6 = *(void *)v11;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if ([v8 evaluatePredicateWithSystem:self]) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
      id v9 = v8;

      if (v9)
      {
        [(NSMutableArray *)self->_agenda removeObject:v9];
        [(NSMutableArray *)self->_executed addObject:v9];
        if (self->_enableLogging) {
          [(NSMutableString *)self->_runLog appendFormat:@"predicate fired for rule #%d, performing action\n", [(NSMutableArray *)self->_rules indexOfObject:v9]];
        }
        [v9 performActionWithSystem:self];
      }

      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      v3 = self->_agenda;
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void)encodeWithCoder:(id)a3
{
  constants = self->_constants;
  id v6 = a3;
  [v6 encodeObject:constants forKey:@"constants"];
  [v6 encodeObject:self->_state forKey:@"state"];
  [v6 encodeObject:self->_rules forKey:@"rules"];
  [v6 encodeObject:self->_agenda forKey:@"agenda"];
  [v6 encodeObject:self->_executed forKey:@"executed"];
  uint64_t v5 = [(NSMapTable *)self->_gradeByFact dictionaryRepresentation];
  [v6 encodeObject:v5 forKey:@"facts"];

  [v6 encodeObject:self->_runLog forKey:@"runlog"];
}

- (NURuleSystem)initWithCoder:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NURuleSystem *)self init];
  if (NUIsAppleInternal_onceToken != -1) {
    dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_18);
  }
  if (NUIsAppleInternal_isAppleInternal)
  {
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      long long v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
      uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"constants"];
      if (v14) {
        [(NSMutableDictionary *)v5->_constants setDictionary:v14];
      }
      uint64_t v43 = (void *)v14;
      uint64_t v15 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
      Class v22 = NSClassFromString(&cfstr_Pireframesubje.isa);
      if (v22) {
        [v21 addObject:v22];
      }
      uint64_t v23 = [v4 decodeObjectOfClasses:v21 forKey:@"state"];
      if (v23) {
        [(NSMutableDictionary *)v5->_state setDictionary:v23];
      }
      uint64_t v24 = [v4 decodeObjectOfClasses:v13 forKey:@"rules"];
      if (v24) {
        [(NSMutableArray *)v5->_rules setArray:v24];
      }
      uint64_t v25 = [v4 decodeObjectOfClasses:v13 forKey:@"agenda"];
      if (v25) {
        [(NSMutableArray *)v5->_agenda setArray:v25];
      }
      uint64_t v26 = [v4 decodeObjectOfClasses:v13 forKey:@"executed"];
      if (v26) {
        [(NSMutableArray *)v5->_executed setArray:v26];
      }
      uint64_t v27 = [v4 decodeObjectOfClasses:v13 forKey:@"facts"];
      uint64_t v28 = v27;
      if (v27)
      {
        v38 = v26;
        uint64_t v39 = v25;
        uint64_t v40 = v24;
        uint64_t v41 = v23;
        uint64_t v42 = v21;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v29 = [v27 allKeys];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v45 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              uint64_t v35 = [v28 objectForKeyedSubscript:v34];
              [(NSMapTable *)v5->_gradeByFact setObject:v35 forKey:v34];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v31);
        }

        uint64_t v23 = v41;
        uint64_t v21 = v42;
        uint64_t v25 = v39;
        uint64_t v24 = v40;
        uint64_t v26 = v38;
      }
      uint64_t v36 = [v4 decodeObjectOfClasses:v13 forKey:@"runlog"];
      if (v36) {
        [(NSMutableString *)v5->_runLog setString:v36];
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28488] format:@"Decoding NURuleSystem is not supported"];
  }

  return v5;
}

- (NURuleSystem)init
{
  v18.receiver = self;
  v18.super_class = (Class)NURuleSystem;
  v2 = [(NURuleSystem *)&v18 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    state = v2->_state;
    v2->_state = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    constants = v2->_constants;
    v2->_constants = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    rules = v2->_rules;
    v2->_rules = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    agenda = v2->_agenda;
    v2->_agenda = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    executed = v2->_executed;
    v2->_executed = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    gradeByFact = v2->_gradeByFact;
    v2->_gradeByFact = (NSMapTable *)v13;

    uint64_t v15 = objc_opt_new();
    runLog = v2->_runLog;
    v2->_runLog = (NSMutableString *)v15;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end