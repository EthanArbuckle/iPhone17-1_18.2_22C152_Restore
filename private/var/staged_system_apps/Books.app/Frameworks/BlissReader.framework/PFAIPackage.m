@interface PFAIPackage
+ (BOOL)readWithState:(id)a3;
@end

@implementation PFAIPackage

+ (BOOL)readWithState:(id)a3
{
  id v3 = [a3 archive];
  v174[0] = PFXCommonApubMimeType;
  v174[1] = PFXCommonEpubMimeType;
  BOOL v4 = +[PFAXPackage validateMimetypeInArchive:validMimetypes:](PFAXPackage, "validateMimetypeInArchive:validMimetypes:", v3, +[NSArray arrayWithObjects:v174 count:2]);
  if (v4)
  {
    v5 = +[PFAXPackage opfXmlUriFromPackage:v3];
    if (v5)
    {
      [a3 setOpfEntryUri:v5];
      if (![(NSString *)v5 hasPrefix:@"/"]) {
        v5 = +[NSString stringWithFormat:@"/%@", v5];
      }
      v140 = +[NSURL URLWithString:v5];
      id v137 = objc_alloc_init((Class)NSAutoreleasePool);
      v6 = (xmlTextReader *)objc_msgSend(objc_msgSend(v3, "entryWithName:", v5), "xmlReader");
      v7 = v6;
      if (v6)
      {
        int v141 = xmlTextReaderDepth(v6);
        long long v171 = 0uLL;
        v172 = 0;
        long long v169 = 0uLL;
        v170 = 0;
        long long v167 = 0uLL;
        v168 = 0;
        v165[1] = 0;
        v165[0] = 0;
        v166 = 0;
        id v139 = +[NSMutableArray array];
        v133 = v3;
        id v138 = +[NSMutableDictionary dictionary];
        uint64_t v134 = 0;
        v136 = 0;
        memset(v163, 0, sizeof(v163));
        int v164 = 1065353216;
        memset(v161, 0, sizeof(v161));
        int v162 = 1065353216;
        long long v158 = 0u;
        long long v159 = 0u;
        int v160 = 1065353216;
        long long v155 = 0u;
        long long v156 = 0u;
        int v157 = 1065353216;
        __p = 0;
        v153 = 0;
        v154 = 0;
        double v8 = -1.0;
        uint64_t v142 = v141 + 1;
        uint64_t v145 = v141 + 2;
        uint64_t v135 = -1;
        while (1)
        {
LABEL_7:
          if (xmlTextReaderRead(v7) != 1)
          {
LABEL_218:
            uint64_t v104 = HIBYTE(v172);
            if (SHIBYTE(v172) < 0) {
              uint64_t v104 = *((void *)&v171 + 1);
            }
            if (v104)
            {
              v105 = sub_1F9368(v161, (unsigned __int8 *)&v171);
              if (v105)
              {
                v106 = v105 + 40;
                if ((char)v105[63] < 0) {
                  v106 = (void *)*v106;
                }
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setSearchIndexEntry:", -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v106), v140), "path"));
              }
            }
            uint64_t v107 = HIBYTE(v170);
            if (SHIBYTE(v170) < 0) {
              uint64_t v107 = *((void *)&v169 + 1);
            }
            if (v107)
            {
              v108 = sub_1F9368(v161, (unsigned __int8 *)&v169);
              if (v108)
              {
                v109 = v108 + 40;
                if ((char)v108[63] < 0) {
                  v109 = (void *)*v109;
                }
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setSearchRefTextEntry:", -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v109), v140), "path"));
              }
            }
            uint64_t v110 = HIBYTE(v168);
            if (SHIBYTE(v168) < 0) {
              uint64_t v110 = *((void *)&v167 + 1);
            }
            if (v110)
            {
              v111 = sub_1F9368(v161, (unsigned __int8 *)&v167);
              if (v111)
              {
                v112 = v111 + 40;
                if ((char)v111[63] < 0) {
                  v112 = (void *)*v112;
                }
                v113 = +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:v112], v140);
                if (v113) {
                  objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setEquationEnvironmentEntry:", -[NSURL path](v113, "path"));
                }
              }
            }
            v114 = (void *)HIBYTE(v166);
            if (SHIBYTE(v166) < 0) {
              v114 = v165[1];
            }
            if (v114)
            {
              v115 = sub_1F9368(v163, (unsigned __int8 *)v165);
              BOOL v116 = v115 && std::string::compare((const std::string *)(v115 + 40), 0, 6uLL, "video/") == 0;
              v117 = sub_1F9368(v161, (unsigned __int8 *)v165);
              if (v117)
              {
                v118 = v117 + 40;
                if ((char)v117[63] < 0) {
                  v118 = (void *)*v118;
                }
                v119 = [+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:v118], v140) path];
                if ([(NSString *)v119 hasPrefix:@"/"]) {
                  v119 = [(NSString *)v119 substringFromIndex:1];
                }
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setIntroMediaUrl:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "zipPackage"), "URLByAppendingPathComponent:", v119));
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setIntroMediaIsVideo:", v116);
              }
            }
            if (*((void *)&v159 + 1))
            {
              id v120 = objc_alloc_init((Class)NSMutableDictionary);
              for (i = (uint64_t *)v159; i; i = (uint64_t *)*i)
              {
                id v122 = objc_alloc((Class)NSString);
                v123 = i + 2;
                if (*((char *)i + 39) < 0) {
                  v123 = (void *)*v123;
                }
                id v124 = [v122 initWithXmlString:v123];
                [v120 setObject:[NSValue valueWithCGSize:*((double *)i + 5), *((double *)i + 6)] forKey:[PFXCommon absolutePathWithUrl:v124 relativeToFile:[a3 opfEntryUri]]];
              }
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setOriginalAssetSizes:", v120);
            }
            if (*((void *)&v156 + 1))
            {
              id v125 = objc_alloc_init((Class)NSMutableDictionary);
              for (j = (uint64_t *)v156; j; j = (uint64_t *)*j)
              {
                id v127 = objc_alloc((Class)NSString);
                v128 = j + 2;
                if (*((char *)j + 39) < 0) {
                  v128 = (void *)*v128;
                }
                id v129 = [v127 initWithXmlString:v128];
                objc_msgSend(v125, "setObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", *((double *)j + 5), *((double *)j + 6)), objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v129, objc_msgSend(a3, "opfEntryUri")), "stringByRemovingPercentEncoding"));
              }
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setThinnedAssetSizes:", v125);
            }
            [a3 setRequiredVersion:v135];
            [a3 setSpineEntries:v139];
            [a3 setSpineURLToCfi:v138];
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setWasThinned:", v134 & 1);
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setIsPreview:", BYTE4(v134) & 1);
            if (v8 > 0.0) {
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setApplePubVersion:", v8);
            }
            if (v136) {
              v130 = [[THBookVersion alloc] initWithString:v136];
            }
            else {
              v130 = +[THBookVersion newUnversionedBookVersion];
            }
            v131 = v130;
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setBookVersion:", v130);
            objc_msgSend(objc_msgSend(a3, "archive"), "setBookVersion:", v131);

            xmlFreeTextReader(v7);
            if (__p)
            {
              v153 = (char *)__p;
              operator delete(__p);
            }
            sub_1F946C((uint64_t)&v155);
            sub_1F946C((uint64_t)&v158);
            sub_2108CC((uint64_t)v161);
            sub_2108CC((uint64_t)v163);
            if (SHIBYTE(v166) < 0) {
              operator delete(v165[0]);
            }
            if (SHIBYTE(v168) < 0) {
              operator delete((void *)v167);
            }
            if (SHIBYTE(v170) < 0) {
              operator delete((void *)v169);
            }
            if (SHIBYTE(v172) < 0) {
              operator delete((void *)v171);
            }
            LODWORD(v7) = 0;
            break;
          }
          int v146 = xmlTextReaderDepth(v7);
          int v9 = xmlTextReaderNodeType(v7);
          if (v9 == 1)
          {
            if (xmlTextReaderIsEmptyElement(v7)) {
              goto LABEL_29;
            }
            v10 = v153;
            if (v153 >= v154)
            {
              v12 = (char *)__p;
              uint64_t v13 = (v153 - (unsigned char *)__p) >> 3;
              unint64_t v14 = v13 + 1;
              if ((unint64_t)(v13 + 1) >> 61) {
                sub_3D1D0();
              }
              uint64_t v15 = v154 - (unsigned char *)__p;
              if ((v154 - (unsigned char *)__p) >> 2 > v14) {
                unint64_t v14 = v15 >> 2;
              }
              if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v16 = v14;
              }
              if (v16)
              {
                v17 = (char *)sub_4374C((uint64_t)&v154, v16);
                v12 = (char *)__p;
                v10 = v153;
              }
              else
              {
                v17 = 0;
              }
              v18 = &v17[8 * v13];
              *(void *)v18 = 0;
              v11 = v18 + 8;
              while (v10 != v12)
              {
                uint64_t v19 = *((void *)v10 - 1);
                v10 -= 8;
                *((void *)v18 - 1) = v19;
                v18 -= 8;
              }
              __p = v18;
              v153 = v11;
              v154 = &v17[8 * v16];
              if (v12) {
                operator delete(v12);
              }
            }
            else
            {
              *(void *)v153 = 0;
              v11 = v10 + 8;
            }
            v153 = v11;
          }
          if (v146 == v141 && v9 == 15) {
            goto LABEL_218;
          }
LABEL_29:
          if (v142 == v146 && v9 == 1)
          {
            v20 = xmlTextReaderConstLocalName(v7);
            *((void *)__p + v141) += 2;
            if (xmlStrEqual(v20, (const xmlChar *)"manifest"))
            {
              while (xmlTextReaderRead(v7) == 1)
              {
                int v21 = xmlTextReaderDepth(v7);
                int v22 = xmlTextReaderNodeType(v7);
                if (v21 == v146 && v22 == 15) {
                  goto LABEL_217;
                }
                if (v145 == v21 && v22 == 1)
                {
                  v23 = xmlTextReaderConstLocalName(v7);
                  if (xmlStrEqual(v23, (const xmlChar *)"item"))
                  {
                    int Attribute = xmlTextReaderMoveToFirstAttribute(v7);
                    v25 = 0;
                    v26 = 0;
                    v27 = 0;
                    v28 = 0;
                    v29 = 0;
                    v30 = 0;
                    str = 0;
                    while (Attribute == 1)
                    {
                      v31 = xmlTextReaderConstLocalName(v7);
                      v32 = xmlTextReaderConstValue(v7);
                      if (xmlStrEqual(v31, (const xmlChar *)"id"))
                      {
                        v25 = (char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"href"))
                      {
                        v26 = (char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"media-type"))
                      {
                        v27 = (char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"original-width"))
                      {
                        v28 = (const char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"original-height"))
                      {
                        v29 = (const char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"width-1x"))
                      {
                        v30 = (const char *)v32;
                      }
                      else
                      {
                        int v33 = xmlStrEqual(v31, (const xmlChar *)"height-1x");
                        v34 = str;
                        if (v33) {
                          v34 = (xmlChar *)v32;
                        }
                        str = v34;
                      }
                      int Attribute = xmlTextReaderMoveToNextAttribute(v7);
                    }
                    if (xmlStrlen((const xmlChar *)v25) >= 1 && xmlStrlen((const xmlChar *)v26) >= 1)
                    {
                      sub_1F43C0(__endptr, v25);
                      sub_1F43C0(&__str, v26);
                      *(void *)&long long v147 = __endptr;
                      v35 = sub_21094C((uint64_t)v161, (unsigned __int8 *)__endptr, (uint64_t)&std::piecewise_construct, (long long **)&v147);
                      std::string::operator=((std::string *)(v35 + 40), &__str);
                      if (xmlStrlen((const xmlChar *)v27) >= 1)
                      {
                        sub_1F43C0(&v147, v27);
                        v173 = __endptr;
                        v36 = sub_21094C((uint64_t)v163, (unsigned __int8 *)__endptr, (uint64_t)&std::piecewise_construct, (long long **)&v173);
                        v37 = v36 + 40;
                        if ((char)v36[63] < 0) {
                          operator delete(*(void **)v37);
                        }
                        *(_OWORD *)v37 = v147;
                        *((void *)v37 + 2) = v148;
                      }
                      if (xmlStrlen((const xmlChar *)v28) >= 1 && xmlStrlen((const xmlChar *)v29) >= 1)
                      {
                        double v38 = atof(v28);
                        double v39 = atof(v29);
                        *(void *)&long long v147 = &__str;
                        v40 = sub_210D84((uint64_t)&v158, (unsigned __int8 *)&__str, (uint64_t)&std::piecewise_construct, (long long **)&v147);
                        *((double *)v40 + 5) = v38;
                        *((double *)v40 + 6) = v39;
                      }
                      if (xmlStrlen((const xmlChar *)v30) >= 1 && xmlStrlen(str) >= 1)
                      {
                        double v41 = atof(v30);
                        double v42 = atof((const char *)str);
                        *(void *)&long long v147 = &__str;
                        v43 = sub_210D84((uint64_t)&v155, (unsigned __int8 *)&__str, (uint64_t)&std::piecewise_construct, (long long **)&v147);
                        *((double *)v43 + 5) = v41;
                        *((double *)v43 + 6) = v42;
                      }
                      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
                        operator delete(__str.__r_.__value_.__l.__data_);
                      }
                      if (SHIBYTE(v151) < 0) {
                        operator delete(__endptr[0]);
                      }
                    }
                  }
                }
              }
            }
            else
            {
              if (xmlStrEqual(v20, (const xmlChar *)"spine"))
              {
                for (int k = xmlTextReaderMoveToFirstAttribute(v7); ; int k = xmlTextReaderMoveToNextAttribute(v7))
                {
                  if (k != 1) {
                    goto LABEL_172;
                  }
                  v45 = xmlTextReaderConstLocalName(v7);
                  if (xmlStrEqual(v45, (const xmlChar *)"toc")) {
                    break;
                  }
                }
                v54 = (char *)xmlTextReaderConstValue(v7);
                sub_1F43C0(__endptr, v54);
                v55 = sub_1F9368(v161, (unsigned __int8 *)__endptr);
                if (v55)
                {
                  v56 = v55 + 40;
                  if ((char)v55[63] < 0) {
                    v56 = (void *)*v56;
                  }
                  [a3 setNcxEntryUri:[NSURL URLWithString:[NSString stringWithXmlString:v56] relativeToURL:[NSURL path:+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v56), v140)]]];
                }
                if (SHIBYTE(v151) < 0)
                {
                  v57 = __endptr[0];
                }
                else
                {
                  while (1)
                  {
LABEL_172:
                    if (xmlTextReaderRead(v7) != 1) {
                      goto LABEL_7;
                    }
                    int v79 = xmlTextReaderDepth(v7);
                    int v80 = xmlTextReaderNodeType(v7);
                    if (v79 == v146 && v80 == 15) {
                      goto LABEL_217;
                    }
                    if (v145 == v79 && v80 == 1)
                    {
                      *((void *)__p + v142) += 2;
                      v81 = xmlTextReaderConstLocalName(v7);
                      if (xmlStrEqual(v81, (const xmlChar *)"itemref"))
                      {
                        int v82 = xmlTextReaderMoveToFirstAttribute(v7);
                        v83 = 0;
                        v84 = 0;
                        v85 = 0;
                        while (v82 == 1)
                        {
                          v86 = xmlTextReaderConstLocalName(v7);
                          v87 = xmlTextReaderConstValue(v7);
                          if (xmlStrEqual(v86, (const xmlChar *)"idref"))
                          {
                            v83 = (char *)v87;
                          }
                          else if (xmlStrEqual(v86, (const xmlChar *)"linear"))
                          {
                            v84 = v87;
                          }
                          else if (xmlStrEqual(v86, (const xmlChar *)"id"))
                          {
                            v85 = v87;
                          }
                          int v82 = xmlTextReaderMoveToNextAttribute(v7);
                        }
                        if (xmlStrEqual(v84, (const xmlChar *)"yes") && xmlStrlen((const xmlChar *)v83) >= 1)
                        {
                          sub_1F43C0(__endptr, v83);
                          v88 = sub_1F9368(v161, (unsigned __int8 *)__endptr);
                          if (SHIBYTE(v151) < 0) {
                            operator delete(__endptr[0]);
                          }
                          if (v88)
                          {
                            id v89 = objc_alloc((Class)NSString);
                            v90 = v88 + 40;
                            if ((char)v88[63] < 0) {
                              v90 = (void *)*v90;
                            }
                            id v91 = [v89 initWithXmlString:v90];
                            id v92 = [objc_alloc((Class)NSURL) initWithString:v91 relativeToURL:v140];
                            id v93 = [v92 path];
                            [v139 addObject:v93];
                            __endptr[0] = 0;
                            __endptr[1] = 0;
                            v151 = 0;
                            if (v79 >= 1)
                            {
                              v94 = 0;
                              uint64_t v95 = 0;
                              do
                              {
                                if (v94 >= v151)
                                {
                                  uint64_t v96 = (v94 - __endptr[0]) >> 3;
                                  if ((unint64_t)(v96 + 1) >> 61) {
                                    sub_3D1D0();
                                  }
                                  unint64_t v97 = (v151 - __endptr[0]) >> 2;
                                  if (v97 <= v96 + 1) {
                                    unint64_t v97 = v96 + 1;
                                  }
                                  if ((unint64_t)(v151 - __endptr[0]) >= 0x7FFFFFFFFFFFFFF8) {
                                    unint64_t v98 = 0x1FFFFFFFFFFFFFFFLL;
                                  }
                                  else {
                                    unint64_t v98 = v97;
                                  }
                                  if (v98) {
                                    v99 = (char *)sub_4374C((uint64_t)&v151, v98);
                                  }
                                  else {
                                    v99 = 0;
                                  }
                                  v100 = &v99[8 * v96];
                                  *(void *)v100 = 0;
                                  v94 = v100 + 8;
                                  v102 = __endptr[0];
                                  v101 = __endptr[1];
                                  if (__endptr[1] != __endptr[0])
                                  {
                                    do
                                    {
                                      uint64_t v103 = *((void *)v101 - 1);
                                      v101 -= 8;
                                      *((void *)v100 - 1) = v103;
                                      v100 -= 8;
                                    }
                                    while (v101 != v102);
                                    v101 = __endptr[0];
                                  }
                                  __endptr[0] = v100;
                                  __endptr[1] = v94;
                                  v151 = &v99[8 * v98];
                                  if (v101) {
                                    operator delete(v101);
                                  }
                                }
                                else
                                {
                                  *(void *)v94 = 0;
                                  v94 += 8;
                                }
                                __endptr[1] = v94;
                                ++v95;
                              }
                              while (v95 != v145);
                            }
                            if (v85) {
                              *(void *)&__endptr[0][8 * v142] = v85;
                            }
                            [v138 setObject:[PFXCommon cfiPathToNodeWithDepth:v145 nodeArray:&__p idArray:__endptr] forKey:v93];

                            v57 = __endptr[0];
                            if (__endptr[0]) {
                              break;
                            }
                          }
                        }
                      }
                    }
                  }
                  __endptr[1] = __endptr[0];
                }
                operator delete(v57);
                goto LABEL_172;
              }
              if (xmlStrEqual(v20, (const xmlChar *)"guide"))
              {
                while (xmlTextReaderRead(v7) == 1)
                {
                  int v46 = xmlTextReaderDepth(v7);
                  int v47 = xmlTextReaderNodeType(v7);
                  if (v46 == v146 && v47 == 15) {
                    goto LABEL_217;
                  }
                  if (v145 == v46 && v47 == 1)
                  {
                    v48 = xmlTextReaderConstLocalName(v7);
                    if (xmlStrEqual(v48, (const xmlChar *)"reference"))
                    {
                      int v49 = xmlTextReaderMoveToFirstAttribute(v7);
                      v50 = 0;
                      v51 = 0;
                      while (v49 == 1)
                      {
                        v52 = xmlTextReaderConstLocalName(v7);
                        v53 = xmlTextReaderConstValue(v7);
                        if (xmlStrEqual(v52, (const xmlChar *)"type"))
                        {
                          v50 = v53;
                        }
                        else if (xmlStrEqual(v52, (const xmlChar *)"href"))
                        {
                          v51 = v53;
                        }
                        int v49 = xmlTextReaderMoveToNextAttribute(v7);
                      }
                      if (xmlStrEqual(v50, (const xmlChar *)"glossary") && xmlStrlen(v51) >= 1) {
                        [a3 setGlossaryEntryUri:[NSURL URLWithString:relativeToURL:[[NSString stringWithXmlString:] path]];
                      }
                      goto LABEL_7;
                    }
                  }
                }
              }
              else if (xmlStrEqual(v20, (const xmlChar *)"metadata"))
              {
                while (1)
                {
                  while (1)
                  {
                    do
                    {
LABEL_98:
                      if (xmlTextReaderRead(v7) != 1) {
                        goto LABEL_7;
                      }
                      int v58 = xmlTextReaderDepth(v7);
                      int v59 = xmlTextReaderNodeType(v7);
                      if (v58 == v146 && v59 == 15)
                      {
LABEL_217:
                        v153 -= 8;
                        goto LABEL_7;
                      }
                    }
                    while (v145 != v58 || v59 != 1);
                    v60 = xmlTextReaderConstLocalName(v7);
                    if (xmlStrEqual(v60, (const xmlChar *)"meta")) {
                      break;
                    }
                    if (xmlStrEqual(v60, (const xmlChar *)"language"))
                    {
                      v67 = xmlTextReaderConstNamespaceUri(v7);
                      if (xmlStrEqual(v67, (const xmlChar *)PFXCommonDublinCoreMetadataNS[0]))
                      {
                        while (xmlTextReaderRead(v7) == 1)
                        {
                          int v68 = xmlTextReaderDepth(v7);
                          int v69 = xmlTextReaderNodeType(v7);
                          if (v68 == v58 && v69 == 15) {
                            break;
                          }
                          if (v141 + 3 == v68 && v69 == 3)
                          {
                            v70 = +[NSString stringWithXmlString:xmlTextReaderConstValue(v7)];
                            if (v70)
                            {
                              id v71 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v70];
                              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setBookLocale:", v71);

                              goto LABEL_98;
                            }
                          }
                        }
                      }
                    }
                  }
                  int v61 = xmlTextReaderMoveToFirstAttribute(v7);
                  v62 = 0;
                  v63 = 0;
                  v64 = 0;
                  while (1)
                  {
                    if (v61 != 1) {
                      goto LABEL_98;
                    }
                    v65 = xmlTextReaderConstLocalName(v7);
                    v66 = xmlTextReaderConstValue(v7);
                    if (xmlStrEqual(v65, (const xmlChar *)"name"))
                    {
                      v62 = v66;
                      if (!v63) {
                        goto LABEL_126;
                      }
                      goto LABEL_108;
                    }
                    if (!xmlStrEqual(v65, (const xmlChar *)"content")) {
                      break;
                    }
                    v63 = (char *)v66;
                    if (!v66) {
                      goto LABEL_126;
                    }
LABEL_108:
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:searchIndex") && *v63)
                    {
                      sub_1F43C0(__endptr, v63);
                      if (SHIBYTE(v172) < 0) {
                        operator delete((void *)v171);
                      }
                      long long v171 = *(_OWORD *)__endptr;
                      v172 = v151;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:searchReferenceText") && *v63)
                    {
                      sub_1F43C0(__endptr, v63);
                      if (SHIBYTE(v170) < 0) {
                        operator delete((void *)v169);
                      }
                      long long v169 = *(_OWORD *)__endptr;
                      v170 = v151;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:equationEnvironment") && *v63)
                    {
                      sub_1F43C0(__endptr, v63);
                      if (SHIBYTE(v168) < 0) {
                        operator delete((void *)v167);
                      }
                      long long v167 = *(_OWORD *)__endptr;
                      v168 = v151;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:introMedia") && *v63)
                    {
                      if (([v133 isEPUB] & 1) == 0)
                      {
                        sub_1F43C0(__endptr, v63);
                        if (SHIBYTE(v166) < 0) {
                          operator delete(v165[0]);
                        }
                        *(_OWORD *)v165 = *(_OWORD *)__endptr;
                        v166 = v151;
                      }
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:requiredVersion") && *v63)
                    {
                      __endptr[0] = 0;
                      uint64_t v76 = strtol(v63, __endptr, 10);
                      uint64_t v77 = v135;
                      if (__endptr[0] != v63) {
                        uint64_t v77 = v76;
                      }
                      uint64_t v135 = v77;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:currentVersion") && *v63)
                    {
                      __endptr[0] = 0;
                      double v78 = strtod(v63, __endptr);
                      if (__endptr[0] != v63) {
                        double v8 = v78;
                      }
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:thinningversion") && *v63)
                    {
                      LOBYTE(v134) = 1;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:preview"))
                    {
                      BYTE4(v134) = [+[NSString stringWithUTF8String:v63] BOOLValue];
                      goto LABEL_98;
                    }
LABEL_128:
                    int v61 = xmlTextReaderMoveToNextAttribute(v7);
                  }
                  if (xmlStrEqual(v65, (const xmlChar *)"property")) {
                    v64 = v66;
                  }
                  if (v63) {
                    goto LABEL_108;
                  }
LABEL_126:
                  if (xmlStrEqual(v64, (const xmlChar *)"ibooks:version"))
                  {
                    InnerXml = xmlTextReaderReadInnerXml(v7);
                    v136 = +[NSString stringWithXmlString:InnerXml];
                    if (!InnerXml) {
                      goto LABEL_98;
                    }
LABEL_152:
                    xmlFree(InnerXml);
                    goto LABEL_98;
                  }
                  if (!xmlStrEqual(v64, (const xmlChar *)"dcterms:modified")) {
                    goto LABEL_128;
                  }
                  InnerXml = xmlTextReaderReadInnerXml(v7);
                  v73 = +[NSString stringWithXmlString:InnerXml];
                  if ([(NSString *)v73 length])
                  {
                    id v74 = objc_alloc_init((Class)NSDateFormatter);
                    id v75 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
                    [v74 setLocale:v75];

                    [v74 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
                    [v74 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                    objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setModificationDate:", objc_msgSend(v74, "dateFromString:", v73));
                  }
                  if (InnerXml) {
                    goto LABEL_152;
                  }
                }
              }
            }
          }
        }
      }

      if (v7) {
        objc_exception_rethrow();
      }
      LOBYTE(v4) = [a3 ncxEntryUri] != 0;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

@end