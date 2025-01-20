@interface DiskSupport
+ (id)sharedInstance;
- (BOOL)dryRunOnly;
- (BOOL)removeFSItem:(id)a3 error:(id *)a4;
- (BOOL)traverseFolderAndRemoveItems:(id)a3 exceptions:(id)a4;
- (DiskSupport)init;
- (void)setDryRunOnly:(BOOL)a3;
@end

@implementation DiskSupport

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005FB0;
  block[3] = &unk_100024BB8;
  block[4] = a1;
  if (qword_100028D28 != -1) {
    dispatch_once(&qword_100028D28, block);
  }
  return (id)qword_100028D20;
}

- (DiskSupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)DiskSupport;
  result = [(DiskSupport *)&v3 init];
  if (result) {
    result->_dryRunOnly = 0;
  }
  return result;
}

- (BOOL)traverseFolderAndRemoveItems:(id)a3 exceptions:(id)a4
{
  unsigned int v6 = [[objc_msgSend(a4, "objectForKeyedSubscript:", off_1000286C8) isEqualToString:@"remove"]
  obj = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a3 error:0];
  v7 = &AKSIdentityCreateFirst_ptr;
  v8 = "Keeping";
  unsigned int v157 = v6;
  if (v6) {
    v8 = "Removing";
  }
  v9 = +[NSString stringWithFormat:@"%s the contents of '%@' (exceptionList: %@)", v8, a3, a4];
  CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%@", v9);
  if (v10)
  {
    CFStringRef v11 = v10;
    CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
    if (CStringPtr) {
      v13 = CStringPtr;
    }
    else {
      v13 = "<error getting string>";
    }
    sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v13);
    CFRelease(v11);
  }
  else
  {
    sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
  }
  free(v9);
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v163 = [(NSArray *)obj countByEnumeratingWithState:&v199 objects:v212 count:16];
  if (!v163) {
    return 1;
  }
  v14 = &AKSIdentityCreateFirst_ptr;
  uint64_t v162 = *(void *)v200;
  id v167 = a3;
  while (2)
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v200 != v162) {
        objc_enumerationMutation(obj);
      }
      uint64_t v168 = v15;
      v16 = *(void **)(*((void *)&v199 + 1) + 8 * v15);
      id v169 = [v7[329] pathWithComponents:[v14[325] arrayWithObjects:a3, v16, 0]];
      v17 = (__CFString *)[a4 objectForKeyedSubscript:v16];
      if (v17)
      {
LABEL_42:
        id v37 = [v7[329] stringWithFormat:@"Found exception '%@' for '%@'", v17, v16, v156];
      }
      else
      {
        long long v197 = 0u;
        long long v198 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        id v18 = [a4 countByEnumeratingWithState:&v195 objects:v211 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v196;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v196 != v20) {
                objc_enumerationMutation(a4);
              }
              v22 = *(void **)(*((void *)&v195 + 1) + 8 * i);
              if (![v22 rangeOfString:objc_msgSend(v7[329], "stringWithFormat:", @"%@/", v16)])
              {
                id v31 = [v7[329] stringWithFormat:@"==> auto-traverse due to '%@'", [v22 substringWithRange:v23, [v22 length] - v23]];
                CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"%@", v31);
                if (v32)
                {
                  CFStringRef v33 = v32;
                  v34 = CFStringGetCStringPtr(v32, 0x8000100u);
                  v35 = "<error getting string>";
                  if (v34) {
                    v35 = v34;
                  }
                  sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v35);
                  CFRelease(v33);
                }
                else
                {
                  sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
                }
                free(v31);
                v17 = @"traverse";
                goto LABEL_42;
              }
            }
            id v19 = [a4 countByEnumeratingWithState:&v195 objects:v211 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
        long long v193 = 0u;
        long long v194 = 0u;
        long long v191 = 0u;
        long long v192 = 0u;
        id v24 = [a4 countByEnumeratingWithState:&v191 objects:v210 count:16];
        if (!v24)
        {
LABEL_31:
          a3 = v167;
          v14 = &AKSIdentityCreateFirst_ptr;
          id v30 = v169;
          if ((v157 & 1) == 0) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }
        id v25 = v24;
        uint64_t v26 = *(void *)v192;
LABEL_25:
        uint64_t v27 = 0;
        while (1)
        {
          if (*(void *)v192 != v26) {
            objc_enumerationMutation(a4);
          }
          uint64_t v28 = *(void *)(*((void *)&v191 + 1) + 8 * v27);
          -[NSRegularExpression rangeOfFirstMatchInString:options:range:](+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v28, 0, 0), "rangeOfFirstMatchInString:options:range:", v16, 0, 0, [v16 length]);
          if (v29 == [v16 length]) {
            break;
          }
          if (v25 == (id)++v27)
          {
            id v25 = [a4 countByEnumeratingWithState:&v191 objects:v210 count:16];
            if (v25) {
              goto LABEL_25;
            }
            goto LABEL_31;
          }
        }
        v36 = (__CFString *)[a4 objectForKeyedSubscript:v28];
        if (!v36)
        {
          a3 = v167;
          v14 = &AKSIdentityCreateFirst_ptr;
          id v30 = v169;
          if (v157) {
            goto LABEL_68;
          }
          goto LABEL_69;
        }
        v17 = v36;
        if (!v28) {
          goto LABEL_42;
        }
        id v37 = [v7[329] stringWithFormat:@"Found regexp-exception '%@' for '%@', regexp '%@'", v36, v16, v28];
      }
      v38 = v37;
      CFStringRef v39 = CFStringCreateWithFormat(0, 0, @"%@", v37);
      if (v39)
      {
        CFStringRef v40 = v39;
        v41 = CFStringGetCStringPtr(v39, 0x8000100u);
        v42 = "<error getting string>";
        if (v41) {
          v42 = v41;
        }
        sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v42);
        CFRelease(v40);
      }
      else
      {
        sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
      }
      free(v38);
      unsigned __int8 v43 = [(__CFString *)v17 isEqualToString:@"remove"];
      v44 = "removed";
      if (v43) {
        goto LABEL_61;
      }
      unsigned __int8 v45 = [(__CFString *)v17 isEqualToString:@"keep"];
      v44 = "kept";
      if (v45) {
        goto LABEL_61;
      }
      if ([(__CFString *)v17 isEqualToString:@"traverse"])
      {
        unsigned __int8 v164 = v43;
        id v46 = objc_alloc_init((Class)NSMutableDictionary);
        id v47 = [a4 objectForKeyedSubscript:off_1000286C8];
        [v46 setObject:v47 forKey:off_1000286C8];
        long long v189 = 0u;
        long long v190 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        id v48 = [a4 countByEnumeratingWithState:&v187 objects:v209 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v188;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v188 != v50) {
                objc_enumerationMutation(a4);
              }
              v52 = *(void **)(*((void *)&v187 + 1) + 8 * (void)j);
              if (!objc_msgSend(v52, "rangeOfString:", objc_msgSend(v16, "stringByAppendingString:", @"/"))) {
                [v46 setObject:[a4 objectForKeyedSubscript:v52] forKey:[v52 substringWithRange:v53, (char *)[v52 length] - v53]];
              }
            }
            id v49 = [a4 countByEnumeratingWithState:&v187 objects:v209 count:16];
          }
          while (v49);
        }
        [+[DiskSupport sharedInstance] traverseFolderAndRemoveItems:v169 exceptions:v46];
        v44 = "kept";
        v7 = &AKSIdentityCreateFirst_ptr;
        unsigned __int8 v43 = v164;
LABEL_61:
        id v54 = [v7[329] stringWithFormat:@"According to rules, '%@' will be %s", v16, v44];
        CFStringRef v55 = CFStringCreateWithFormat(0, 0, @"%@", v54);
        id v30 = v169;
        if (v55)
        {
          CFStringRef v56 = v55;
          v57 = CFStringGetCStringPtr(v55, 0x8000100u);
          if (v57) {
            v58 = v57;
          }
          else {
            v58 = "<error getting string>";
          }
          sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v58);
          CFRelease(v56);
        }
        else
        {
          sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
        }
        a3 = v167;
        v14 = &AKSIdentityCreateFirst_ptr;
        free(v54);
        if ((v43 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_68:
        uint64_t v170 = 0;
        if (![(DiskSupport *)self removeFSItem:v30 error:&v170])
        {
          id v143 = [v7[329] stringWithFormat:@"Error: Failed to delete '%@' with error %@!", v30, v170];
          CFStringRef v144 = CFStringCreateWithFormat(0, 0, @"%@", v143);
          if (!v144) {
            goto LABEL_160;
          }
          CFStringRef v145 = v144;
          v146 = CFStringGetCStringPtr(v144, 0x8000100u);
          if (v146) {
            v147 = v146;
          }
          else {
            v147 = "<error getting string>";
          }
LABEL_152:
          sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v147);
LABEL_159:
          CFRelease(v145);
          goto LABEL_161;
        }
        goto LABEL_69;
      }
      if ([(__CFString *)v17 hasPrefix:@"removeExcept /"])
      {
        id v59 = objc_alloc_init((Class)NSMutableDictionary);
        v60 = +[NSRegularExpression regularExpressionWithPattern:@"/([^/]+)/[ \t]*([^ \t/]*)" options:0 error:0];
        id v61 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", [@"removeExcept " length]);
        id v62 = v59;
        [v59 setObject:@"remove" forKey:off_1000286C8];
        long long v185 = 0u;
        long long v186 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        v63 = v61;
        v159 = -[NSRegularExpression matchesInString:options:range:](v60, "matchesInString:options:range:", v61, 0, 0, [v61 length]);
        id v64 = [(NSArray *)v159 countByEnumeratingWithState:&v183 objects:v208 count:16];
        if (v64)
        {
          id v65 = v64;
          uint64_t v165 = *(void *)v184;
          while (2)
          {
            for (k = 0; k != v65; k = (char *)k + 1)
            {
              if (*(void *)v184 != v165) {
                objc_enumerationMutation(v159);
              }
              v67 = *(void **)(*((void *)&v183 + 1) + 8 * (void)k);
              [v67 rangeAtIndex:2];
              if (v68)
              {
                v139 = v7[329];
                id v140 = [v67 rangeAtIndex:2];
                id v142 = [v139 stringWithFormat:@"Exception '%@' for '%@' is ill-formatted - found extra string '%@' or missing '/'!", v63, v16, [v63 substringWithRange:v140, v141]];
                goto LABEL_154;
              }
              id v69 = [v67 rangeAtIndex:1];
              id v71 = [v63 substringWithRange:v69, v70];
              CFStringRef v72 = (const __CFString *)[a4 objectForKeyedSubscript:[v7[329] stringWithFormat:@"%@/%@", v16, v71]];
              if (v72)
              {
                CFStringRef v73 = v72;
                CFStringRef v156 = v72;
                id v74 = [v7[329] stringWithFormat:@"==> removeExcept for '%@/%@' has rule '%@', using it instead of 'keep'", v16, v71];
                CFStringRef v75 = CFStringCreateWithFormat(0, 0, @"%@", v74);
                if (v75)
                {
                  CFStringRef v76 = v75;
                  v77 = CFStringGetCStringPtr(v75, 0x8000100u);
                  if (v77) {
                    v78 = v77;
                  }
                  else {
                    v78 = "<error getting string>";
                  }
                  sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v78);
                  CFRelease(v76);
                }
                else
                {
                  sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
                }
                free(v74);
                v7 = &AKSIdentityCreateFirst_ptr;
              }
              else
              {
                CFStringRef v73 = @"keep";
              }
              [v62 setObject:v73 forKey:v71];
            }
            id v65 = [(NSArray *)v159 countByEnumeratingWithState:&v183 objects:v208 count:16];
            if (v65) {
              continue;
            }
            break;
          }
        }
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v79 = [a4 countByEnumeratingWithState:&v179 objects:v207 count:16];
        if (v79)
        {
          id v80 = v79;
          uint64_t v81 = *(void *)v180;
          do
          {
            for (m = 0; m != v80; m = (char *)m + 1)
            {
              if (*(void *)v180 != v81) {
                objc_enumerationMutation(a4);
              }
              v83 = *(void **)(*((void *)&v179 + 1) + 8 * (void)m);
              if (![v83 rangeOfString:objc_msgSend(v7[329], "stringWithFormat:", @"%@/", v16)])
              {
                uint64_t v85 = v84;
                v86 = (char *)[v83 length] - v84;
                id v87 = [a4 objectForKeyedSubscript:v83];
                v88 = v86;
                v7 = &AKSIdentityCreateFirst_ptr;
                [v62 setObject:v87 forKey:[v83 substringWithRange:v85, v88]];
              }
            }
            id v80 = [a4 countByEnumeratingWithState:&v179 objects:v207 count:16];
          }
          while (v80);
        }
LABEL_135:
        [+[DiskSupport sharedInstance] traverseFolderAndRemoveItems:v169 exceptions:v62];
        a3 = v167;
        v14 = &AKSIdentityCreateFirst_ptr;
        goto LABEL_69;
      }
      if ([(__CFString *)v17 hasPrefix:@"removeExcept "])
      {
        id v89 = objc_alloc_init((Class)NSMutableDictionary);
        [v89 setObject:@"remove" forKey:off_1000286C8];
        id v90 = [(__CFString *)v17 rangeOfString:@"/"];
        id v91 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", [@"removeExcept " length]);
        id v92 = v91;
        if (v90 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v93 = [v91 componentsSeparatedByString:@"/"];
          v94 = (char *)[v93 count];
          if ((uint64_t)(v94 - 2) >= 0)
          {
            v95 = v94 - 1;
            do
            {
              id v96 = [v7[329] pathWithComponents:[v93 subarrayWithRange:0, v95]];
              v97 = v7[329];
              v206[0] = v167;
              v206[1] = v16;
              v206[2] = v96;
              id v98 = [[v97 pathWithComponents:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v206, 3)];
              [v89 setObject:@"keep" forKey:[v93 objectAtIndexedSubscript:v95]];
              [+[DiskSupport sharedInstance] traverseFolderAndRemoveItems:v98 exceptions:v89];
              [v89 removeObjectForKey:[v93 objectAtIndexedSubscript:v95--]];
            }
            while (v95);
          }
          id v92 = [v93 objectAtIndexedSubscript:0];
        }
        v99 = v89;
        CFStringRef v100 = @"keep";
      }
      else
      {
        if ([(__CFString *)v17 hasPrefix:@"keepExcept /"])
        {
          id v62 = objc_alloc_init((Class)NSMutableDictionary);
          v101 = +[NSRegularExpression regularExpressionWithPattern:@"/([^/]+)/ *" options:0 error:0];
          id v102 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", [@"keepExcept " length]);
          [v62 setObject:@"keep" forKey:off_1000286C8];
          long long v177 = 0u;
          long long v178 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          v166 = v102;
          v103 = -[NSRegularExpression matchesInString:options:range:](v101, "matchesInString:options:range:", v102, 0, 0, [v102 length]);
          id v104 = [(NSArray *)v103 countByEnumeratingWithState:&v175 objects:v205 count:16];
          if (v104)
          {
            id v105 = v104;
            id v160 = *(id *)v176;
LABEL_111:
            uint64_t v106 = 0;
            while (1)
            {
              if (*(id *)v176 != v160) {
                objc_enumerationMutation(v103);
              }
              v107 = *(void **)(*((void *)&v175 + 1) + 8 * v106);
              [v107 rangeAtIndex:2];
              if (v108) {
                break;
              }
              id v109 = [v107 rangeAtIndex:1];
              id v111 = [v166 substringWithRange:v109, v110];
              CFStringRef v112 = (const __CFString *)[a4 objectForKeyedSubscript:[v7[329] stringWithFormat:@"%@/%@", v16, v111]];
              if (v112)
              {
                CFStringRef v113 = v112;
                CFStringRef v156 = v112;
                id v114 = [v7[329] stringWithFormat:@"==> keepExcept for '%@/%@' has rule '%@', using it instead of 'remove'", v16, v111];
                CFStringRef v115 = CFStringCreateWithFormat(0, 0, @"%@", v114);
                if (v115)
                {
                  CFStringRef v116 = v115;
                  v117 = CFStringGetCStringPtr(v115, 0x8000100u);
                  if (v117) {
                    v118 = v117;
                  }
                  else {
                    v118 = "<error getting string>";
                  }
                  sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v118);
                  CFRelease(v116);
                }
                else
                {
                  sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
                }
                free(v114);
                v7 = &AKSIdentityCreateFirst_ptr;
              }
              else
              {
                CFStringRef v113 = @"remove";
              }
              [v62 setObject:v113 forKey:v111];
              if (v105 == (id)++v106)
              {
                id v105 = [(NSArray *)v103 countByEnumeratingWithState:&v175 objects:v205 count:16];
                if (v105) {
                  goto LABEL_111;
                }
                goto LABEL_126;
              }
            }
            v148 = v7[329];
            id v149 = [v107 rangeAtIndex:2];
            id v142 = [v148 stringWithFormat:@"Exception '%@' for '%@' is ill-formatted - found extra string '%@' or missing '/'!", v166, v16, [v166 substringWithRange:v149, v150]];
LABEL_154:
            id v143 = v142;
            CFStringRef v151 = CFStringCreateWithFormat(0, 0, @"%@", v142);
            if (v151)
            {
              CFStringRef v145 = v151;
              v152 = CFStringGetCStringPtr(v151, 0x8000100u);
              if (v152) {
                v153 = v152;
              }
              else {
                v153 = "<error getting string>";
              }
              sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v153);
              goto LABEL_159;
            }
            goto LABEL_160;
          }
LABEL_126:
          long long v173 = 0u;
          long long v174 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          id v119 = [a4 countByEnumeratingWithState:&v171 objects:v204 count:16];
          if (v119)
          {
            id v120 = v119;
            uint64_t v121 = *(void *)v172;
            do
            {
              for (n = 0; n != v120; n = (char *)n + 1)
              {
                if (*(void *)v172 != v121) {
                  objc_enumerationMutation(a4);
                }
                v123 = *(void **)(*((void *)&v171 + 1) + 8 * (void)n);
                if (![v123 rangeOfString:objc_msgSend(v7[329], "stringWithFormat:", @"%@/", v16)])
                {
                  uint64_t v125 = v124;
                  v126 = (char *)[v123 length] - v124;
                  id v127 = [a4 objectForKeyedSubscript:v123];
                  v128 = v126;
                  v7 = &AKSIdentityCreateFirst_ptr;
                  [v62 setObject:v127 forKey:[v123 substringWithRange:v125, v128]];
                }
              }
              id v120 = [a4 countByEnumeratingWithState:&v171 objects:v204 count:16];
            }
            while (v120);
          }
          goto LABEL_135;
        }
        if (![(__CFString *)v17 hasPrefix:@"keepExcept "])
        {
          id v143 = [v7[329] stringWithFormat:@"Exception '%@' for '%@' is ill-formatted!", v17, v16];
          CFStringRef v154 = CFStringCreateWithFormat(0, 0, @"%@", v143);
          if (v154)
          {
            CFStringRef v145 = v154;
            v155 = CFStringGetCStringPtr(v154, 0x8000100u);
            v147 = "<error getting string>";
            if (v155) {
              v147 = v155;
            }
            goto LABEL_152;
          }
LABEL_160:
          sub_100002D6C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
LABEL_161:
          free(v143);
          return 0;
        }
        id v89 = objc_alloc_init((Class)NSMutableDictionary);
        [v89 setObject:@"keep" forKey:off_1000286C8];
        id v129 = [(__CFString *)v17 rangeOfString:@"/"];
        id v130 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", [@"keepExcept " length]);
        id v92 = v130;
        if (v129 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v131 = [v130 componentsSeparatedByString:@"/"];
          v132 = (char *)[v131 count];
          if ((uint64_t)(v132 - 2) >= 0)
          {
            v133 = v132 - 1;
            do
            {
              id v134 = [v7[329] pathWithComponents:[v131 subarrayWithRange:0, v133]];
              v135 = v7[329];
              v203[0] = v167;
              v203[1] = v16;
              v203[2] = v134;
              id v136 = [v135 pathWithComponents:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v203, 3)];
              [v89 setObject:@"remove" forKey:[v131 objectAtIndexedSubscript:v133]];
              [+[DiskSupport sharedInstance] traverseFolderAndRemoveItems:v136 exceptions:v89];
              [v89 removeObjectForKey:[v131 objectAtIndexedSubscript:v133--]];
            }
            while (v133);
          }
          id v92 = [v131 objectAtIndexedSubscript:0];
        }
        v99 = v89;
        CFStringRef v100 = @"remove";
      }
      [v99 setObject:v100 forKey:v92];
      [+[DiskSupport sharedInstance] traverseFolderAndRemoveItems:v169 exceptions:v89];
      a3 = v167;
      v14 = &AKSIdentityCreateFirst_ptr;
LABEL_69:
      uint64_t v15 = v168 + 1;
    }
    while ((id)(v168 + 1) != v163);
    id v137 = [(NSArray *)obj countByEnumeratingWithState:&v199 objects:v212 count:16];
    BOOL result = 1;
    id v163 = v137;
    if (v137) {
      continue;
    }
    return result;
  }
}

- (BOOL)removeFSItem:(id)a3 error:(id *)a4
{
  v7 = +[NSString stringWithFormat:@"Deleting FS item '%@'", a3];
  CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"%@", v7);
  if (v8)
  {
    CFStringRef v9 = v8;
    CStringPtr = CFStringGetCStringPtr(v8, 0x8000100u);
    CFStringRef v11 = "<error getting string>";
    if (CStringPtr) {
      CFStringRef v11 = CStringPtr;
    }
    sub_100002D6C(1, "%s: %s", "-[DiskSupport removeFSItem:error:]", v11);
    CFRelease(v9);
  }
  else
  {
    sub_100002D6C(1, "%s: %s", "-[DiskSupport removeFSItem:error:]", "<error getting string>");
  }
  free(v7);
  if ([(DiskSupport *)self dryRunOnly]) {
    return 1;
  }
  v13 = +[NSFileManager defaultManager];

  return [(NSFileManager *)v13 removeItemAtPath:a3 error:a4];
}

- (BOOL)dryRunOnly
{
  return self->_dryRunOnly;
}

- (void)setDryRunOnly:(BOOL)a3
{
  self->_dryRunOnly = a3;
}

@end