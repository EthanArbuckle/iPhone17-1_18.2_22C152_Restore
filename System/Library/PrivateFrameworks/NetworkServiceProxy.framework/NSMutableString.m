@interface NSMutableString
- (void)appendPrettyBOOL:(uint64_t)a3 withName:(int)a4 andIndent:(char)a5 options:;
- (void)appendPrettyInt:(uint64_t)a3 withName:(int)a4 andIndent:(char)a5 options:;
- (void)appendPrettyObject:(void *)a3 withName:(int)a4 andIndent:(uint64_t)a5 options:;
@end

@implementation NSMutableString

- (void)appendPrettyObject:(void *)a3 withName:(int)a4 andIndent:(uint64_t)a5 options:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  if (a1 && v8 && (a5 & 0xC) != 4)
  {
    objc_opt_class();
    v71 = a1;
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (id v10 = v8, objc_opt_class(), v11 = objc_opt_isKindOfClass(), v10, (v11 & 1) != 0))
    {
      id v12 = v8;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v14 = ")}";
      }
      else {
        v14 = ")";
      }
      v15 = "{(";
      if ((isKindOfClass & 1) == 0) {
        v15 = "(";
      }
      id v64 = v9;
      uint64_t v68 = (4 * a4 + 4);
      [a1 appendFormat:@"\n%*s%@ = %s", v68, " ", v9, v15];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        v66 = v14;
        id v62 = v8;
        uint64_t v19 = (4 * a4 + 8);
        uint64_t v20 = (a4 + 2);
        uint64_t v21 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v77 != v21) {
              objc_enumerationMutation(v16);
            }
            v23 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v24 = [v23 descriptionWithIndent:v20 options:a5];
              [v71 appendFormat:@"\n%*s{%@", v19, " ", v24];

              objc_msgSend(v71, "appendFormat:", @"\n%*s},", v19, " ", v58);
            }
            else
            {
              id v25 = v23;
              objc_opt_class();
              if (v25 && (char v26 = objc_opt_isKindOfClass(), v25, (a5 & 3) == 3) && (v26 & 1) != 0)
              {
                objc_msgSend(v71, "appendFormat:", @"\n%*s<%lu-char-str>,", v19, " ", objc_msgSend(v25, "length"));
              }
              else
              {
                v27 = [v25 description];
                [v71 appendFormat:@"\n%*s%@,", v19, " ", v27];
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
        }
        while (v18);

        a1 = v71;
        objc_msgSend(v71, "appendFormat:", @"\n%*s", v68, " ");
        id v8 = v62;
        v14 = v66;
      }
      else
      {
      }
      objc_msgSend(a1, "appendFormat:", @"%s", v14);

      id v9 = v64;
    }
    else
    {
      id v28 = v10;
      objc_opt_class();
      char v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) == 0)
      {
        id v49 = v28;
        objc_opt_class();
        char v50 = objc_opt_isKindOfClass();

        if (v50)
        {
          id v51 = [v49 UUIDString];
          [a1 appendFormat:@"\n%*s%@ = %@", (4 * a4 + 4), " ", v9, v51];
        }
        else
        {
          if (isa_nsstring(v49))
          {
            if ((~a5 & 3) != 0) {
              [a1 appendFormat:@"\n%*s%@ = %@", (4 * a4 + 4), " ", v9, v49];
            }
            else {
              [a1 appendFormat:@"\n%*s%@ = <%lu-char-str>", (4 * a4 + 4), " ", v9, objc_msgSend(v49, "length")];
            }
            goto LABEL_28;
          }
          if (isa_nsdata(v49))
          {
            uint64_t v52 = (4 * a4 + 4);
            id v53 = v49;
            uint64_t v54 = [v53 length];
            v55 = [v53 description];

            [a1 appendFormat:@"\n%*s%@ = %u:%@", v52, " ", v9, v54, v55];
            goto LABEL_28;
          }
          id v51 = v49;
          if (objc_opt_respondsToSelector())
          {
            v56 = objc_msgSend(v51, "descriptionWithIndent:options:");
            [a1 appendFormat:@"\n%*s%@ = {%@", (4 * (a4 + 1)), " ", v9, v56];

            objc_msgSend(a1, "appendFormat:", @"\n%*s}", (4 * (a4 + 1)), " ", v59, v60);
          }
          else
          {
            v57 = [v51 description];
            [a1 appendFormat:@"\n%*s%@ = %@", (4 * a4 + 4), " ", v9, v57];
          }
        }

        goto LABEL_28;
      }
      id v30 = v28;
      int v31 = 4 * a4;
      v32 = " ";
      [a1 appendFormat:@"\n%*s%@ = {", (4 * a4 + 4), " ", v9];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v33 = v30;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v72 objects:v80 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v61 = (v31 + 4);
        id v63 = v8;
        id v65 = v9;
        uint64_t v69 = (v31 + 8);
        unsigned int v67 = a4 + 2;
        uint64_t v36 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v73 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v72 + 1) + 8 * j);
            v39 = [v33 objectForKeyedSubscript:v38];
            if (objc_opt_respondsToSelector())
            {
              v40 = [v39 descriptionWithIndent:v67 options:a5];
              [a1 appendFormat:@"\n%*s%@ = {%@", v69, v32, v38, v40];

              objc_msgSend(a1, "appendFormat:", @"\n%*s},", v69, v32);
            }
            else
            {
              id v41 = v33;
              uint64_t v42 = v36;
              uint64_t v43 = v35;
              v44 = v32;
              id v45 = v39;
              objc_opt_class();
              if (v45 && (char v46 = objc_opt_isKindOfClass(), v45, (a5 & 3) == 3) && (v46 & 1) != 0)
              {
                uint64_t v47 = [v45 length];
                v32 = v44;
                a1 = v71;
                [v71 appendFormat:@"\n%*s%@ = <%lu-char-str>", v69, v44, v38, v47];
              }
              else
              {
                v48 = [v45 description];
                v32 = v44;
                a1 = v71;
                [v71 appendFormat:@"\n%*s%@ = %@", v69, v44, v38, v48];
              }
              uint64_t v35 = v43;
              uint64_t v36 = v42;
              id v33 = v41;
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v72 objects:v80 count:16];
        }
        while (v35);

        objc_msgSend(a1, "appendFormat:", @"\n%*s", v61, v32);
        id v8 = v63;
        id v9 = v65;
      }
      else
      {
      }
      [a1 appendString:@"}"];
    }
  }
LABEL_28:
}

- (void)appendPrettyBOOL:(uint64_t)a3 withName:(int)a4 andIndent:(char)a5 options:
{
  if (result && (a5 & 0xC) != 4)
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    return (void *)[result appendFormat:@"\n%*s%@ = %@", (4 * a4 + 4), " ", a3, v7, v5, v6];
  }
  return result;
}

- (void)appendPrettyInt:(uint64_t)a3 withName:(int)a4 andIndent:(char)a5 options:
{
  if (result)
  {
    if ((a5 & 0xC) != 4) {
      return (void *)[result appendFormat:@"\n%*s%@ = %lld", (4 * a4 + 4), " ", a3, a2, v5, v6];
    }
  }
  return result;
}

@end