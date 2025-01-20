void exsltCommonRegister(void)
{
  xsltElemPreCompPtr (__cdecl *v0)(xsltStylesheetPtr, xmlNodePtr, xsltTransformFunction);
  void (__cdecl *v1)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr);
  uint64_t vars8;

  xsltRegisterExtModuleFunction((const xmlChar *)"node-set", (const xmlChar *)"http://exslt.org/common", (xmlXPathFunction)exsltNodeSetFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"object-type", (const xmlChar *)"http://exslt.org/common", (xmlXPathFunction)exsltObjectTypeFunction);
  v0 = (xsltElemPreCompPtr (__cdecl *)(xsltStylesheetPtr, xmlNodePtr, xsltTransformFunction))MEMORY[0x263F8C8D8];
  v1 = (void (__cdecl *)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr))MEMORY[0x263F8C8E0];

  xsltRegisterExtModuleElement((const xmlChar *)"document", (const xmlChar *)"http://exslt.org/common", v0, v1);
}

void exsltNodeSetFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    xmlXPathObjectPtr value = ctxt->value;
    if (value && (value->type | 8) == 9)
    {
      xsltFunctionNodeSet(ctxt, 1);
    }
    else
    {
      xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(ctxt);
      RVT = xsltCreateRVT(TransformContext);
      if (RVT)
      {
        v6 = RVT;
        xsltRegisterLocalRVT(TransformContext, RVT);
        v7 = xmlXPathPopString(ctxt);
        v8 = xmlNewDocText(v6, v7);
        xmlAddChild((xmlNodePtr)v6, v8);
        v9 = xmlXPathNewNodeSet(v8);
        if (!v9)
        {
          xsltTransformError(TransformContext, 0, TransformContext->inst, "exsltNodeSetFunction: Failed to create a node set object.\n");
          TransformContext->state = XSLT_STATE_STOPPED;
        }
        if (v7) {
          ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v7);
        }
        valuePush(ctxt, v9);
      }
      else
      {
        xsltTransformError(TransformContext, 0, TransformContext->inst, "exsltNodeSetFunction: Failed to create a tree fragment.\n");
        TransformContext->state = XSLT_STATE_STOPPED;
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/common.c", 20, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltObjectTypeFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    xmlXPathObjectPtr v3 = valuePop(ctxt);
    unsigned int v4 = v3->type - 1;
    if (v4 < 9 && ((0x18Fu >> v4) & 1) != 0)
    {
      v5 = xmlXPathNewCString((&off_26484EBB0)[v4]);
      xmlXPathFreeObject(v3);
      valuePush(ctxt, v5);
    }
    else
    {
      ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "object-type() invalid arg\n");
      ctxt->error = 11;
      xmlXPathFreeObject(v3);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/common.c", 69, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltDateRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"add", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"add-duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddDurationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"date", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"date-time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateTimeFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayAbbreviationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInMonthFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-in-week", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInWeekFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayNameFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"day-of-week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayOfWeekInMonthFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDifferenceFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDurationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"hour-in-day", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateHourInDayFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"leap-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateLeapYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"minute-in-hour", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMinuteInHourFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"month-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthAbbreviationFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"month-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthInYearFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"month-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthNameFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"second-in-minute", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondInMinuteFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"seconds", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondsFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"sum", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSumFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateTimeFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInMonthFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"week-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInYearFunction);

  xsltRegisterExtModuleFunction((const xmlChar *)"year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateYearFunction);
}

void exsltDateAddFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  if (a2 == 2)
  {
    xmlXPathObjectPtr v3 = xmlXPathPopString(ctxt);
    if (ctxt->error) {
      return;
    }
    unsigned int v4 = v3;
    v5 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v6 = (void (*)(unsigned __int8 *))*MEMORY[0x263F8C880];
      v6(v4);
      return;
    }
    v7 = v5;
    v8 = 0;
    if (!v4) {
      goto LABEL_32;
    }
    if (!v5) {
      goto LABEL_32;
    }
    v9 = (xmlChar *)exsltDateParse(v5);
    v8 = v9;
    if (!v9) {
      goto LABEL_32;
    }
    if ((*(_DWORD *)v9 & 0xFFFFFFF8) != 8 || (v10.n128_f64[0] = exsltDateParseDuration(v4, v10), !v11))
    {
      ((void (*)(xmlChar *, __n128))*MEMORY[0x263F8C880])(v8, v10);
      goto LABEL_31;
    }
    uint64_t v12 = v11;
    uint64_t Date = exsltDateCreateDate(*(_DWORD *)v8);
    uint64_t v14 = Date;
    if (Date)
    {
      uint64_t v15 = *(void *)v12 / 12;
      uint64_t v16 = *(void *)v12 % 12 + (*((_DWORD *)v8 + 4) & 0xF);
      uint64_t v17 = v16 - 12;
      if ((unint64_t)v16 < 0xD) {
        uint64_t v18 = *(void *)v12 / 12;
      }
      else {
        uint64_t v18 = v15 + 1;
      }
      if ((unint64_t)v16 < 0xD) {
        uint64_t v17 = *(void *)v12 % 12 + (*((_DWORD *)v8 + 4) & 0xF);
      }
      uint64_t v19 = v16 + 12;
      uint64_t v20 = v15 - 1;
      BOOL v21 = v16 <= 0;
      uint64_t v22 = v16 <= 0 ? v20 : v18;
      uint64_t v23 = v21 ? v19 : v17;
      int v24 = *(_DWORD *)(Date + 16) & 0xFFFFFFF0 | v23;
      *(_DWORD *)(Date + 16) = v24;
      uint64_t v25 = v22 + 400 * (*(void *)(v12 + 8) / 146097);
      if (v25 < 1)
      {
        uint64_t v26 = *((void *)v8 + 1);
        if (v25) {
          BOOL v29 = v26 < (uint64_t)(0x8000000000000002 - v25);
        }
        else {
          BOOL v29 = 0;
        }
        if (v29) {
          goto LABEL_85;
        }
      }
      else
      {
        uint64_t v26 = *((void *)v8 + 1);
        if (v26 > (v25 ^ 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_85:
          ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v14);
          uint64_t v14 = 0;
          goto LABEL_97;
        }
      }
      uint64_t v30 = v26 + v25;
      *(void *)(Date + 8) = v26 + v25;
      int v31 = *(_WORD *)(Date + 32) & 0xE001 | (2 * ((*((unsigned __int16 *)v8 + 16) >> 1) & 0xFFF));
      *(_WORD *)(Date + 32) = v31;
      *(_WORD *)(Date + 32) = v31 & 0xFFFE | *((_WORD *)v8 + 16) & 1;
      long double v32 = *((double *)v8 + 3) + *(double *)(v12 + 16);
      double v33 = fmod(v32, 60.0);
      *(double *)(v14 + 24) = v33;
      uint64_t v34 = (uint64_t)(v32 / 60.0);
      uint64_t v35 = v34 / 60;
      int64_t v36 = v34 % 60 + (((unint64_t)*((unsigned int *)v8 + 4) >> 14) & 0x3F);
      if (v36 > 59)
      {
        ++v35;
        LOBYTE(v36) = v36 - 60;
      }
      int v37 = v24 & 0xFFF03FFF | ((v36 & 0x3F) << 14);
      *(_DWORD *)(v14 + 16) = v37;
      int64_t v38 = v35 % 24 + (((unint64_t)*((unsigned int *)v8 + 4) >> 9) & 0x1F);
      if (v38 <= 23) {
        uint64_t v39 = v35 / 24;
      }
      else {
        uint64_t v39 = v35 / 24 + 1;
      }
      if (v38 > 23) {
        LOBYTE(v38) = v38 - 24;
      }
      unsigned int v40 = v37 & 0xFFFFC1FF | ((v38 & 0x1F) << 9);
      *(_DWORD *)(v14 + 16) = v40;
      int64_t v41 = ((unint64_t)*((unsigned int *)v8 + 4) >> 4) & 0x1F;
      if ((v30 & 3) != 0)
      {
        int64_t v42 = daysInMonth[v23 - 1];
      }
      else
      {
        uint64_t v43 = v23 - 1;
        if (0x8F5C28F5C28F5C29 * v30 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70 && (v30 & 0xF) != 0) {
          int64_t v42 = daysInMonth[v43];
        }
        else {
          int64_t v42 = daysInMonthLeap[v43];
        }
      }
      if (v42 >= v41)
      {
        if (v41) {
          int64_t v42 = ((unint64_t)*((unsigned int *)v8 + 4) >> 4) & 0x1F;
        }
        else {
          int64_t v42 = 1;
        }
      }
      uint64_t v44 = v39 + v42 + *(void *)(v12 + 8) % 146097;
LABEL_58:
      BOOL v45 = (v30 & 0xF) == 0
         || (unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v30) > 0xA3D70A3D70A3D70;
      BOOL v46 = v45;
      while (1)
      {
        if (v44 <= 0)
        {
          if ((v40 & 0xE) != 0)
          {
            unsigned int v40 = v40 & 0xFFFFFFF0 | (v40 - 1) & 0xF;
            *(_DWORD *)(v14 + 16) = v40;
          }
          else
          {
            if (v30 == 0x8000000000000002) {
              goto LABEL_85;
            }
            unsigned int v40 = v40 & 0xFFFFFFF0 | 0xC;
            *(_DWORD *)(v14 + 16) = v40;
            *(void *)(v14 + 8) = --v30;
          }
          if ((v30 & 3) != 0
            || ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v30) <= 0xA3D70A3D70A3D70
              ? (BOOL v49 = (v30 & 0xF) == 0)
              : (BOOL v49 = 1),
                v50 = daysInMonthLeap,
                !v49))
          {
            v50 = daysInMonth;
          }
          v44 += v50[(v40 & 0xF) - 1];
          goto LABEL_58;
        }
        uint64_t v47 = (v40 & 0xF) - 1;
        if ((v30 & 3) != 0 || !v46) {
          uint64_t v48 = daysInMonth[v47];
        }
        else {
          uint64_t v48 = daysInMonthLeap[v47];
        }
        if (v44 <= v48) {
          break;
        }
        v44 -= v48;
        if ((~v40 & 0xC) == 0)
        {
          if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_85;
          }
          unsigned int v40 = v40 & 0xFFFFFFF0 | 1;
          *(_DWORD *)(v14 + 16) = v40;
          *(void *)(v14 + 8) = ++v30;
          goto LABEL_58;
        }
        unsigned int v40 = v40 & 0xFFFFFFF0 | (v40 + 1) & 0xF;
        *(_DWORD *)(v14 + 16) = v40;
      }
      *(_DWORD *)(v14 + 16) = v40 & 0xFFFFFE0F | (16 * (v44 & 0x1F));
      int v51 = *(_DWORD *)v14;
      if (*(_DWORD *)v14 != 15)
      {
        if ((v40 & 0xFFE00) != 0 || v33 != 0.0)
        {
          int v52 = 15;
          goto LABEL_96;
        }
        if (v51 == 14) {
          goto LABEL_97;
        }
        if ((v44 & 0x1F) != 1)
        {
          int v52 = 14;
          goto LABEL_96;
        }
        if (v51 != 12 && (v40 & 0xF) != 1)
        {
          int v52 = 12;
LABEL_96:
          *(_DWORD *)uint64_t v14 = v52;
        }
      }
    }
LABEL_97:
    v53 = (void (**)(uint64_t))MEMORY[0x263F8C880];
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v8);
    (*v53)(v12);
    if (v14)
    {
      int v54 = *(_DWORD *)v14;
      if (*(_DWORD *)v14 == 1)
      {
        v55 = exsltDateFormatTime(v14);
        goto LABEL_159;
      }
      if (v54 == 14)
      {
        v55 = exsltDateFormatDate(v14);
        goto LABEL_159;
      }
      if (v54 == 15)
      {
        v55 = exsltDateFormatDateTime(v14);
LABEL_159:
        v8 = v55;
        goto LABEL_160;
      }
      if ((v54 & 8) == 0)
      {
        v8 = 0;
LABEL_160:
        (*v53)(v14);
        goto LABEL_32;
      }
      int v87 = 0;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      *(_OWORD *)cur = 0u;
      long long v82 = 0u;
      uint64_t v56 = *(void *)(v14 + 8);
      if (v56 <= 0)
      {
        cur[0] = 45;
        uint64_t v57 = 1;
      }
      else
      {
        uint64_t v57 = 0;
      }
      int v80 = 0;
      unint64_t v58 = 1 - v56;
      if (v56 >= 1) {
        unint64_t v58 = v56;
      }
      memset(v79, 0, sizeof(v79));
      if ((uint64_t)v58 < 1)
      {
        v62 = (char *)v79;
      }
      else
      {
        unint64_t v59 = 0;
        do
        {
          unint64_t v60 = v59 + 1;
          *((unsigned char *)v79 + v59) = (v58 % 0xA) | 0x30;
          if (v58 < 0xA) {
            break;
          }
          v58 /= 0xAuLL;
        }
        while (v59++ < 0x62);
        v62 = (char *)v79 + v60;
      }
      uint64_t v63 = v62 - (char *)v79;
      if (v62 - (char *)v79 <= 3)
      {
        memset(v62, 48, (char *)v79 + 4 - v62);
        v62 = (char *)v79 + 4;
      }
      if (v62 <= (char *)v79)
      {
        if (v54 != 12) {
          goto LABEL_139;
        }
        v68 = (xmlChar *)((unint64_t)cur | v57);
      }
      else
      {
        uint64_t v64 = 4;
        if (v63 > 4) {
          uint64_t v64 = v63;
        }
        v65 = (xmlChar *)v79 + v64 - 1;
        do
        {
          unint64_t v66 = v57++;
          BOOL v21 = v65 > (xmlChar *)v79;
          xmlChar v67 = *v65--;
          cur[v66] = v67;
        }
        while (v21 && v66 < 0x62);
        if (v54 != 12)
        {
LABEL_139:
          v72 = &cur[v57];
          __int16 v73 = *(_WORD *)(v14 + 32);
          if ((v73 & 0x1FFF) != 0)
          {
            __int16 v74 = 8 * v73;
            if ((unsigned __int16)(8 * v73) > 0xFu)
            {
              unsigned int v76 = v74 >> 4;
              if (v74 < 0) {
                unsigned int v76 = -v76;
              }
              if (v57 <= 98)
              {
                if ((*(_WORD *)(v14 + 32) & 0x1000) != 0) {
                  xmlChar v77 = 45;
                }
                else {
                  xmlChar v77 = 43;
                }
                cur[v57] = v77;
                if (v57 != 98)
                {
                  cur[v57 + 1] = (v76 / 0x258 - 10 * ((429496730 * (unint64_t)(v76 / 0x258)) >> 32)) | 0x30;
                  if (v57 <= 96)
                  {
                    cur[v57 + 2] = (v76 / 0x3C - 10 * ((429496730 * (unint64_t)(v76 / 0x3C)) >> 32)) | 0x30;
                    if (v57 != 96)
                    {
                      cur[v57 + 3] = 58;
                      if (v57 < 95)
                      {
                        unsigned __int8 v78 = v76 % 0x3C;
                        cur[v57 + 4] = (v78 / 0xAu) | 0x30;
                        v72 = &cur[v57 + 5];
                        if (v57 == 94) {
                          goto LABEL_158;
                        }
                        char v75 = (v78 % 0xAu) | 0x30;
                        goto LABEL_143;
                      }
                    }
                  }
                }
                uint64_t v57 = 99;
              }
              v72 = &cur[v57];
              goto LABEL_158;
            }
            if (v57 <= 98)
            {
              char v75 = 90;
LABEL_143:
              *v72++ = v75;
            }
          }
LABEL_158:
          xmlChar *v72 = 0;
          v55 = xmlStrdup(cur);
          goto LABEL_159;
        }
        if (v66 > 0x61)
        {
LABEL_133:
          if (v57 <= 98)
          {
            int v69 = *(_DWORD *)(v14 + 16);
            cur[v57] = ((v69 & 0xEu) > 9) | 0x30;
            if (v57 == 98)
            {
              uint64_t v57 = 99;
            }
            else
            {
              v70 = &cur[v57];
              unsigned int v71 = v69 & 0xF;
              if (v71 >= 0xA) {
                LOBYTE(v71) = v71 - 10;
              }
              v57 += 2;
              v70[1] = v71 | 0x30;
            }
          }
          goto LABEL_139;
        }
        v68 = &cur[v57];
      }
      ++v57;
      xmlChar *v68 = 45;
      goto LABEL_133;
    }
LABEL_31:
    v8 = 0;
LABEL_32:
    v27 = (void (**)(unsigned __int8 *))MEMORY[0x263F8C880];
    ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v4);
    (*v27)(v7);
    if (v8) {
      v28 = xmlXPathWrapString(v8);
    }
    else {
      v28 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    }
    valuePush(ctxt, v28);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3629, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

void exsltDateAddDurationFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    xmlXPathObjectPtr v3 = xmlXPathPopString(ctxt);
    if (ctxt->error) {
      return;
    }
    unsigned int v4 = v3;
    v5 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      v7 = (void (*)(unsigned __int8 *))*MEMORY[0x263F8C880];
      v7(v4);
      return;
    }
    v8 = v5;
    v9 = 0;
    if (!v4 || !v5) {
      goto LABEL_21;
    }
    v11.n128_f64[0] = exsltDateParseDuration(v5, v6);
    if (v10)
    {
      uint64_t v12 = v10;
      v13.n128_f64[0] = exsltDateParseDuration(v4, v11);
      v9 = v14;
      if (!v14)
      {
LABEL_19:
        ((void (*)(uint64_t, __n128))*MEMORY[0x263F8C880])(v12, v13);
LABEL_21:
        uint64_t v18 = (void (**)(unsigned __int8 *))MEMORY[0x263F8C880];
        ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v4);
        (*v18)(v8);
        if (v9) {
          uint64_t v19 = xmlXPathWrapString(v9);
        }
        else {
          uint64_t v19 = xmlXPathNewCString((const char *)&unk_228A36E0A);
        }
        valuePush(ctxt, v19);
        return;
      }
      Duration = exsltDateCreateDuration();
      uint64_t v16 = (uint64_t)Duration;
      if (Duration && !_exsltDateAddDurCalc((uint64_t)Duration, v12, (uint64_t)v9))
      {
        ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v16);
        uint64_t v16 = 0;
      }
      uint64_t v17 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
      ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v12);
      (*v17)(v9);
      if (v16)
      {
        v9 = exsltDateFormatDuration(v16);
        uint64_t v12 = v16;
        goto LABEL_19;
      }
    }
    v9 = 0;
    goto LABEL_21;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3666, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

void exsltDateDateFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3183, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1) {
    goto LABEL_12;
  }
  unsigned int v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    int v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3189, 11);
    goto LABEL_7;
  }
  v5 = (const char *)v4;
  if (!v4)
  {
LABEL_12:
    uint64_t v7 = exsltDateCurrent();
    v5 = 0;
    char v8 = 1;
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  __n128 v6 = (_DWORD *)exsltDateParse(v4);
  if (!v6)
  {
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = (uint64_t)v6;
  if ((*v6 & 0xFFFFFFFE) != 0xE)
  {
    ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v6);
    goto LABEL_16;
  }
  char v8 = 0;
LABEL_13:
  v9 = exsltDateFormatDate(v7);
  ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v7);
  if (v9)
  {
    uint64_t v10 = xmlXPathWrapString(v9);
    goto LABEL_18;
  }
LABEL_17:
  ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8E8])(*MEMORY[0x263F8C8F0], "{http://exslt.org/dates-and-times}date: invalid date or format %s\n", v5);
  uint64_t v10 = xmlXPathNewCString((const char *)&unk_228A36E0A);
LABEL_18:
  valuePush(ctxt, v10);
  if ((v8 & 1) == 0)
  {
    __n128 v11 = (void (*)(const char *))*MEMORY[0x263F8C880];
    v11(v5);
  }
}

void exsltDateDateTimeFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3158, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
  else
  {
    uint64_t v3 = exsltDateCurrent();
    if (v3 && (uint64_t v4 = v3, v5 = exsltDateFormatDateTime(v3), ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v4), v5)) {
      __n128 v6 = xmlXPathWrapString(v5);
    }
    else {
      __n128 v6 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    }
    valuePush(ctxt, v6);
  }
}

void exsltDateDayAbbreviationFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3532, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3539, 11);
      goto LABEL_7;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  double v6 = exsltDateDayInWeek(v5);
  if (xmlXPathIsNaN(v6)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 < 1.0;
  }
  LODWORD(v8) = (int)v6;
  BOOL v9 = v7 || v6 > 7.0;
  uint64_t v8 = (int)v8;
  if (v9) {
    uint64_t v8 = 0;
  }
  uint64_t v10 = (const xmlChar *)&exsltDateDayAbbreviation_dayAbbreviations + 4 * v8;
  if (v5) {
    ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
  }
  __n128 v11 = xmlStrdup(v10);
  uint64_t v12 = xmlXPathWrapString(v11);

  valuePush(ctxt, v12);
}

void exsltDateDayInMonthFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3461, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3461, 11);
      goto LABEL_7;
    }
    v5 = v4;
    if (v4)
    {
      double v6 = (_DWORD *)exsltDateParse(v4);
      if (v6)
      {
        if (*v6 <= 0xFu && ((1 << *v6) & 0xC044) != 0)
        {
          char v8 = 0;
          goto LABEL_17;
        }
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      double v9 = *MEMORY[0x263F8C8D0];
LABEL_22:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_23;
    }
  }
  double v6 = (_DWORD *)exsltDateCurrent();
  if (v6)
  {
    v5 = 0;
    char v8 = 1;
LABEL_17:
    double v9 = (double)((v6[4] >> 4) & 0x1F);
    ((void (*)(void))*MEMORY[0x263F8C880])();
    if (v8) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  double v9 = *MEMORY[0x263F8C8D0];
LABEL_23:
  uint64_t v10 = xmlXPathNewFloat(v9);

  valuePush(ctxt, v10);
}

void exsltDateDayInWeekFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3479, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3479, 11);
      goto LABEL_7;
    }
    BOOL v7 = v4;
    double v5 = exsltDateDayInWeek(v4);
    if (v7) {
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v7);
    }
  }
  else
  {
    double v5 = exsltDateDayInWeek(0);
  }
  double v6 = xmlXPathNewFloat(v5);

  valuePush(ctxt, v6);
}

void exsltDateDayInYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3452, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3452, 11);
      goto LABEL_7;
    }
    double v5 = v4;
    if (v4)
    {
      uint64_t v6 = exsltDateParse(v4);
      if (v6)
      {
        if ((*(_DWORD *)v6 & 0xFFFFFFFE) == 0xE)
        {
          char v7 = 0;
LABEL_14:
          uint64_t v8 = *(void *)(v6 + 8);
          if ((v8 & 3) == 0
            && (0x8F5C28F5C28F5C29 * v8 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
              ? (BOOL v9 = (*(void *)(v6 + 8) & 0xFLL) == 0)
              : (BOOL v9 = 1),
                v9))
          {
            uint64_t v10 = &dayInLeapYearByMonth;
          }
          else
          {
            uint64_t v10 = &dayInYearByMonth;
          }
          int64_t v11 = v10[(*(_DWORD *)(v6 + 16) & 0xF) - 1] + (((unint64_t)*(unsigned int *)(v6 + 16) >> 4) & 0x1F);
          ((void (*)(void))*MEMORY[0x263F8C880])();
          double v12 = (double)v11;
          if (v7) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      double v12 = *MEMORY[0x263F8C8D0];
LABEL_27:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_28;
    }
  }
  uint64_t v6 = exsltDateCurrent();
  if (v6)
  {
    double v5 = 0;
    char v7 = 1;
    goto LABEL_14;
  }
  double v12 = *MEMORY[0x263F8C8D0];
LABEL_28:
  __n128 v13 = xmlXPathNewFloat(v12);

  valuePush(ctxt, v13);
}

void exsltDateDayNameFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3495, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3502, 11);
      goto LABEL_7;
    }
    double v5 = v4;
  }
  else
  {
    double v5 = 0;
  }
  double v6 = exsltDateDayInWeek(v5);
  if (xmlXPathIsNaN(v6)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 < 1.0;
  }
  BOOL v8 = v7 || v6 > 7.0;
  uint64_t v9 = (int)v6;
  if (v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (const xmlChar *)&exsltDateDayName_dayNames + 10 * v9;
  if (v5) {
    ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
  }
  int64_t v11 = xmlStrdup(v10);
  double v12 = xmlXPathWrapString(v11);

  valuePush(ctxt, v12);
}

void exsltDateDayOfWeekInMonthFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3470, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3470, 11);
      goto LABEL_7;
    }
    double v5 = v4;
    if (v4)
    {
      double v6 = (_DWORD *)exsltDateParse(v4);
      if (v6)
      {
        if ((*v6 & 0xFFFFFFFE) == 0xE)
        {
          char v7 = 0;
          goto LABEL_14;
        }
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      double v9 = *MEMORY[0x263F8C8D0];
LABEL_19:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_20;
    }
  }
  double v6 = (_DWORD *)exsltDateCurrent();
  if (v6)
  {
    double v5 = 0;
    char v7 = 1;
LABEL_14:
    unsigned int v8 = (((char)((unsigned __int16)(147 * (((v6[4] >> 4) & 0x1F) - 1)) >> 8) >> 2)
                         + ((((unsigned __int16)(147 * (((v6[4] >> 4) & 0x1F) - 1)) >> 8) & 0x80) >> 7)
                         + 1);
    ((void (*)(void))*MEMORY[0x263F8C880])();
    double v9 = (double)v8;
    if (v7) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  double v9 = *MEMORY[0x263F8C8D0];
LABEL_20:
  uint64_t v10 = xmlXPathNewFloat(v9);

  valuePush(ctxt, v10);
}

void exsltDateDifferenceFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    int v3 = xmlXPathPopString(ctxt);
    if (ctxt->error) {
      return;
    }
    uint64_t v4 = v3;
    double v5 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      double v6 = (void (*)(unsigned __int8 *))*MEMORY[0x263F8C880];
      v6(v4);
      return;
    }
    char v7 = v5;
    unsigned int v8 = 0;
    if (!v4 || !v5) {
      goto LABEL_22;
    }
    uint64_t v9 = exsltDateParse(v5);
    if (v9)
    {
      uint64_t v10 = (unsigned int *)v9;
      int64_t v11 = (_DWORD *)exsltDateParse(v4);
      if (!v11)
      {
        unsigned int v8 = 0;
        double v12 = v10;
        goto LABEL_21;
      }
      double v12 = v11;
      if ((*v10 & 0xFFFFFFF8) != 8 || (*v11 & 0xFFFFFFF8) != 8)
      {
        ((void (*)(unsigned int *))*MEMORY[0x263F8C880])(v10);
        unsigned int v8 = 0;
        goto LABEL_21;
      }
      __n128 v13 = _exsltDateDifference(v10, (uint64_t)v11, 0);
      uint64_t v14 = (void (**)(_DWORD *))MEMORY[0x263F8C880];
      ((void (*)(unsigned int *))*MEMORY[0x263F8C880])(v10);
      (*v14)(v12);
      if (v13)
      {
        unsigned int v8 = exsltDateFormatDuration((uint64_t)v13);
        double v12 = v13;
LABEL_21:
        ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v12);
        goto LABEL_22;
      }
    }
    unsigned int v8 = 0;
LABEL_22:
    uint64_t v15 = (void (**)(unsigned __int8 *))MEMORY[0x263F8C880];
    ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v4);
    (*v15)(v7);
    if (v8) {
      uint64_t v16 = xmlXPathWrapString(v8);
    }
    else {
      uint64_t v16 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    }
    valuePush(ctxt, v16);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3703, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

void exsltDateDurationFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3741, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1) {
    goto LABEL_10;
  }
  uint64_t v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    int v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3748, 11);
    goto LABEL_7;
  }
  double v5 = v4;
  if (v4)
  {
    double v6 = MEMORY[0x22A6A3F40](v4);
    char v7 = 0;
  }
  else
  {
LABEL_10:
    double v6 = exsltDateSeconds(0);
    double v5 = 0;
    char v7 = 1;
  }
  if (!xmlXPathIsNaN(v6))
  {
    double v8 = floor(v6 / 86400.0);
    if (v8 > -9.22337204e18 && v8 < 9.22337204e18)
    {
      Duration = (double *)exsltDateCreateDuration();
      if (Duration)
      {
        int64_t v11 = Duration;
        *((void *)Duration + 1) = (uint64_t)v8;
        Duration[2] = v6 + v8 * -86400.0;
        double v12 = exsltDateFormatDuration((uint64_t)Duration);
        ((void (*)(double *))*MEMORY[0x263F8C880])(v11);
        if (v7) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
    }
  }
  double v12 = 0;
  if ((v7 & 1) == 0) {
LABEL_21:
  }
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v5);
LABEL_22:
  if (v12) {
    __n128 v13 = xmlXPathWrapString(v12);
  }
  else {
    __n128 v13 = xmlXPathNewCString((const char *)&unk_228A36E0A);
  }

  valuePush(ctxt, v13);
}

void exsltDateHourInDayFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3563, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1) {
    goto LABEL_14;
  }
  uint64_t v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    int v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3563, 11);
    goto LABEL_7;
  }
  double v5 = v4;
  if (v4)
  {
    double v6 = (_DWORD *)exsltDateParse(v4);
    if (!v6)
    {
LABEL_13:
      double v8 = *MEMORY[0x263F8C8D0];
LABEL_17:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_19;
    }
    char v7 = 0;
    if (*v6 != 1 && *v6 != 15)
    {
      ((void (*)(void))*MEMORY[0x263F8C880])();
      goto LABEL_13;
    }
  }
  else
  {
LABEL_14:
    double v6 = (_DWORD *)exsltDateCurrent();
    if (!v6)
    {
      double v8 = *MEMORY[0x263F8C8D0];
      goto LABEL_19;
    }
    double v5 = 0;
    char v7 = 1;
  }
  double v8 = (double)((v6[4] >> 9) & 0x1F);
  ((void (*)(void))*MEMORY[0x263F8C880])();
  if ((v7 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v9 = xmlXPathNewFloat(v8);

  valuePush(ctxt, v9);
}

void exsltDateLeapYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3296, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3303, 11);
      goto LABEL_7;
    }
    double v5 = v4;
    if (v4)
    {
      double v6 = (_DWORD *)exsltDateParse(v4);
      if (v6)
      {
        char v7 = v6;
        if (*v6 <= 0xFu && ((1 << *v6) & 0xD100) != 0)
        {
          char v9 = 0;
          goto LABEL_17;
        }
        ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v6);
      }
      uint64_t v14 = xmlXPathNewFloat(*MEMORY[0x263F8C8D0]);
LABEL_28:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_29;
    }
  }
  uint64_t v10 = exsltDateCurrent();
  if (v10)
  {
    char v7 = (_DWORD *)v10;
    double v5 = 0;
    char v9 = 1;
LABEL_17:
    uint64_t v11 = *((void *)v7 + 1);
    BOOL v12 = 0x8F5C28F5C28F5C29 * v11 + 0x51EB851EB851EB8 > 0xA3D70A3D70A3D70 || (*((void *)v7 + 1) & 0xFLL) == 0;
    int v13 = (v11 & 3) == 0 && v12;
    uint64_t v14 = xmlXPathNewBoolean(v13);
    ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v7);
    if (v9) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v14 = xmlXPathNewFloat(*MEMORY[0x263F8C8D0]);
LABEL_29:

  valuePush(ctxt, v14);
}

void exsltDateMinuteInHourFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3572, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1) {
    goto LABEL_14;
  }
  uint64_t v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    int v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3572, 11);
    goto LABEL_7;
  }
  double v5 = v4;
  if (v4)
  {
    double v6 = (_DWORD *)exsltDateParse(v4);
    if (!v6)
    {
LABEL_13:
      double v8 = *MEMORY[0x263F8C8D0];
LABEL_17:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_19;
    }
    char v7 = 0;
    if (*v6 != 1 && *v6 != 15)
    {
      ((void (*)(void))*MEMORY[0x263F8C880])();
      goto LABEL_13;
    }
  }
  else
  {
LABEL_14:
    double v6 = (_DWORD *)exsltDateCurrent();
    if (!v6)
    {
      double v8 = *MEMORY[0x263F8C8D0];
      goto LABEL_19;
    }
    double v5 = 0;
    char v7 = 1;
  }
  double v8 = (double)((v6[4] >> 14) & 0x3F);
  ((void (*)(void))*MEMORY[0x263F8C880])();
  if ((v7 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_19:
  char v9 = xmlXPathNewFloat(v8);

  valuePush(ctxt, v9);
}

void exsltDateMonthAbbreviationFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3404, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3411, 11);
      goto LABEL_7;
    }
    double v5 = v4;
  }
  else
  {
    double v5 = 0;
  }
  double v6 = exsltDateMonthInYear(v5);
  if (xmlXPathIsNaN(v6)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 < 1.0;
  }
  LODWORD(v8) = (int)v6;
  BOOL v9 = v7 || v6 > 12.0;
  uint64_t v8 = (int)v8;
  if (v9) {
    uint64_t v8 = 0;
  }
  uint64_t v10 = (const xmlChar *)&exsltDateMonthAbbreviation_monthAbbreviations + 4 * v8;
  if (v5) {
    ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
  }
  uint64_t v11 = xmlStrdup(v10);
  BOOL v12 = xmlXPathWrapString(v11);

  valuePush(ctxt, v12);
}

void exsltDateMonthInYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3351, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3351, 11);
      goto LABEL_7;
    }
    BOOL v7 = v4;
    double v5 = exsltDateMonthInYear(v4);
    if (v7) {
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v7);
    }
  }
  else
  {
    double v5 = exsltDateMonthInYear(0);
  }
  double v6 = xmlXPathNewFloat(v5);

  valuePush(ctxt, v6);
}

void exsltDateMonthNameFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3367, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3374, 11);
      goto LABEL_7;
    }
    double v5 = v4;
  }
  else
  {
    double v5 = 0;
  }
  double v6 = exsltDateMonthInYear(v5);
  if (xmlXPathIsNaN(v6)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 < 1.0;
  }
  BOOL v8 = v7 || v6 > 12.0;
  uint64_t v9 = (int)v6;
  if (v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (const xmlChar *)&exsltDateMonthName_monthNames + 10 * v9;
  if (v5) {
    ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
  }
  uint64_t v11 = xmlStrdup(v10);
  BOOL v12 = xmlXPathWrapString(v11);

  valuePush(ctxt, v12);
}

void exsltDateSecondInMinuteFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3581, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3581, 11);
      goto LABEL_7;
    }
    double v5 = v4;
    if (v4)
    {
      uint64_t v6 = exsltDateParse(v4);
      if (v6)
      {
        if (*(_DWORD *)v6 == 1 || *(_DWORD *)v6 == 15)
        {
          double v7 = *(double *)(v6 + 24);
          ((void (*)(void))*MEMORY[0x263F8C880])();
LABEL_18:
          ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
          goto LABEL_19;
        }
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      double v7 = *MEMORY[0x263F8C8D0];
      goto LABEL_18;
    }
  }
  uint64_t v8 = exsltDateCurrent();
  if (v8)
  {
    double v7 = *(double *)(v8 + 24);
    ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v8);
  }
  else
  {
    double v7 = *MEMORY[0x263F8C8D0];
  }
LABEL_19:
  uint64_t v9 = xmlXPathNewFloat(v7);

  valuePush(ctxt, v9);
}

void exsltDateSecondsFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3597, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3604, 11);
      goto LABEL_7;
    }
    double v7 = v4;
    double v5 = exsltDateSeconds(v4);
    if (v7) {
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v7);
    }
  }
  else
  {
    double v5 = exsltDateSeconds(0);
  }
  uint64_t v6 = xmlXPathNewFloat(v5);

  valuePush(ctxt, v6);
}

void exsltDateSumFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 != 1)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 2855, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
    return;
  }
  xmlXPathObjectPtr value = ctxt->value;
  if (value && value->BOOLval)
  {
    user = (xmlNode *)value->user;
    value->BOOLval = 0;
    value->user = 0;
  }
  else
  {
    user = 0;
  }
  xmlNodeSetPtr v5 = xmlXPathPopNodeSet(ctxt);
  if (ctxt->error) {
    return;
  }
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_32;
  }
  if (!v5->nodeNr)
  {
    uint64_t v20 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    valuePush(ctxt, v20);
    goto LABEL_24;
  }
  Duration = exsltDateCreateDuration();
  if (!Duration)
  {
LABEL_24:
    xmlXPathFreeNodeSet(v6);
    return;
  }
  uint64_t v8 = (uint64_t)Duration;
  uint64_t v9 = (void (**)(uint64_t))MEMORY[0x263F8C880];
  if (v6->nodeNr < 1)
  {
LABEL_19:
    uint64_t v18 = exsltDateFormatDuration(v8);
    (*v9)(v8);
    xmlXPathFreeNodeSet(v6);
    if (user) {
      xmlFreeNodeList(user);
    }
    if (v18)
    {
      uint64_t v19 = xmlXPathWrapString(v18);
LABEL_33:
      valuePush(ctxt, v19);
      return;
    }
LABEL_32:
    uint64_t v19 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    goto LABEL_33;
  }
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = xmlXPathCastNodeToString(v6->nodeTab[v10]);
    if (!v11) {
      break;
    }
    int v13 = v11;
    double v15 = exsltDateParseDuration(v11, v12);
    if (!v14)
    {
      ((void (*)(unsigned __int8 *, double))*v9)(v13, v15);
LABEL_31:
      (*v9)(v8);
      xmlXPathFreeNodeSet(v6);
      goto LABEL_32;
    }
    uint64_t v16 = v14;
    BOOL v17 = _exsltDateAddDurCalc(v8, v8, v14);
    (*v9)(v16);
    (*v9)((uint64_t)v13);
    if (!v17) {
      goto LABEL_31;
    }
    if (++v10 >= v6->nodeNr) {
      goto LABEL_19;
    }
  }
  xmlXPathFreeNodeSet(v6);
  BOOL v21 = *v9;

  v21(v8);
}

void exsltDateTimeFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3222, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 != 1) {
    goto LABEL_14;
  }
  uint64_t v4 = xmlXPathPopString(ctxt);
  if (ctxt->error)
  {
    int v3 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3228, 11);
    goto LABEL_7;
  }
  xmlNodeSetPtr v5 = (const char *)v4;
  if (v4)
  {
    uint64_t v6 = (_DWORD *)exsltDateParse(v4);
    if (!v6)
    {
LABEL_13:
      char v8 = 0;
      goto LABEL_17;
    }
    uint64_t v7 = (uint64_t)v6;
    char v8 = 0;
    if (*v6 != 1 && *v6 != 15)
    {
      ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v6);
      goto LABEL_13;
    }
  }
  else
  {
LABEL_14:
    uint64_t v7 = exsltDateCurrent();
    xmlNodeSetPtr v5 = 0;
    char v8 = 1;
    if (!v7) {
      goto LABEL_17;
    }
  }
  uint64_t v9 = exsltDateFormatTime(v7);
  ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v7);
  if (v9)
  {
    uint64_t v10 = xmlXPathWrapString(v9);
    goto LABEL_18;
  }
LABEL_17:
  ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8E8])(*MEMORY[0x263F8C8F0], "{http://exslt.org/dates-and-times}time: invalid date or format %s\n", v5);
  uint64_t v10 = xmlXPathNewCString((const char *)&unk_228A36E0A);
LABEL_18:
  valuePush(ctxt, v10);
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = (void (*)(const char *))*MEMORY[0x263F8C880];
    v11(v5);
  }
}

void exsltDateWeekInMonthFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3443, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3443, 11);
      goto LABEL_7;
    }
    xmlNodeSetPtr v5 = v4;
    if (v4)
    {
      uint64_t v6 = (_DWORD *)exsltDateParse(v4);
      if (v6)
      {
        uint64_t v7 = v6;
        if ((*v6 & 0xFFFFFFFE) == 0xE)
        {
          char v8 = 0;
LABEL_14:
          uint64_t v10 = *((void *)v7 + 1);
          if ((v10 & 3) == 0
            && (0x8F5C28F5C28F5C29 * v10 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
              ? (BOOL v11 = (*((void *)v7 + 1) & 0xFLL) == 0)
              : (BOOL v11 = 1),
                v11))
          {
            __n128 v12 = &dayInLeapYearByMonth;
          }
          else
          {
            __n128 v12 = &dayInYearByMonth;
          }
          unint64_t v13 = v7[4];
          uint64_t v14 = _exsltDateDayInWeek(v12[(v7[4] & 0xF) - 1] + 1, v10);
          uint64_t v15 = v14 + 6;
          if ((unint64_t)(v14 + 6) >= 7) {
            uint64_t v15 = v14 - 1;
          }
          uint64_t v16 = (unsigned __int128)((uint64_t)(((v13 >> 4) & 0x1F) + v15 - 1) * (__int128)0x4924924924924925) >> 64;
          uint64_t v17 = (v16 >> 1) + ((unint64_t)v16 >> 63) + 1;
          ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v7);
          double v18 = (double)v17;
          if (v8) {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
        ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v6);
      }
      double v18 = *MEMORY[0x263F8C8D0];
LABEL_29:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_30;
    }
  }
  uint64_t v9 = exsltDateCurrent();
  if (v9)
  {
    uint64_t v7 = (_DWORD *)v9;
    xmlNodeSetPtr v5 = 0;
    char v8 = 1;
    goto LABEL_14;
  }
  double v18 = *MEMORY[0x263F8C8D0];
LABEL_30:
  uint64_t v19 = xmlXPathNewFloat(v18);

  valuePush(ctxt, v19);
}

void exsltDateWeekInYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3434, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3434, 11);
      goto LABEL_7;
    }
    xmlNodeSetPtr v5 = v4;
    if (v4)
    {
      uint64_t v6 = (_DWORD *)exsltDateParse(v4);
      if (v6)
      {
        uint64_t v7 = v6;
        if ((*v6 & 0xFFFFFFFE) == 0xE)
        {
          char v8 = 0;
LABEL_14:
          uint64_t v10 = *((void *)v7 + 1);
          if ((v10 & 3) == 0
            && (0x8F5C28F5C28F5C29 * v10 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
              ? (BOOL v11 = (*((void *)v7 + 1) & 0xFLL) == 0)
              : (BOOL v11 = 1),
                v11))
          {
            __n128 v12 = &dayInLeapYearByMonth;
          }
          else
          {
            __n128 v12 = &dayInYearByMonth;
          }
          uint64_t v13 = v12[(v7[4] & 0xF) - 1] + (((unint64_t)v7[4] >> 4) & 0x1F);
          uint64_t v14 = _exsltDateDayInWeek(v13, *((void *)v7 + 1));
          uint64_t v15 = v14 + 6;
          if ((unint64_t)(v14 + 6) >= 7) {
            uint64_t v15 = v14 - 1;
          }
          uint64_t v16 = v13 - v15 + 3;
          if (v16 <= 0)
          {
            uint64_t v19 = v10 - 1;
            if (v10 == 1) {
              uint64_t v19 = -1;
            }
            BOOL v20 = (v19 & 0xF) == 0 || 0x8F5C28F5C28F5C29 * v19 + 0x51EB851EB851EB8 > 0xA3D70A3D70A3D70;
            uint64_t v21 = 365;
            if (v20) {
              uint64_t v21 = 366;
            }
            BOOL v11 = (v19 & 3) == 0;
            uint64_t v17 = 365;
            if (v11) {
              uint64_t v17 = v21;
            }
          }
          else if ((v10 & 3) != 0)
          {
            if ((unint64_t)v16 <= 0x16D) {
              goto LABEL_51;
            }
            uint64_t v17 = -365;
          }
          else
          {
            uint64_t v22 = v10 % 25;
            unint64_t v23 = 365;
            if ((v10 & 0xF) == 0) {
              unint64_t v23 = 366;
            }
            if (v22) {
              unint64_t v23 = 366;
            }
            if (v16 <= v23)
            {
LABEL_51:
              uint64_t v25 = (unsigned __int128)((v16 - 1) * (__int128)0x4924924924924925) >> 64;
              uint64_t v26 = (v25 >> 1) + ((unint64_t)v25 >> 63) + 1;
              ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v7);
              double v18 = (double)v26;
              if (v8) {
                goto LABEL_56;
              }
              goto LABEL_55;
            }
            if ((v10 & 0xF) != 0) {
              uint64_t v24 = -365;
            }
            else {
              uint64_t v24 = -366;
            }
            if (v22) {
              uint64_t v17 = -366;
            }
            else {
              uint64_t v17 = v24;
            }
          }
          v16 += v17;
          goto LABEL_51;
        }
        ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v6);
      }
      double v18 = *MEMORY[0x263F8C8D0];
LABEL_55:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_56;
    }
  }
  uint64_t v9 = exsltDateCurrent();
  if (v9)
  {
    uint64_t v7 = (_DWORD *)v9;
    xmlNodeSetPtr v5 = 0;
    char v8 = 1;
    goto LABEL_14;
  }
  double v18 = *MEMORY[0x263F8C8D0];
LABEL_56:
  v27 = xmlXPathNewFloat(v18);

  valuePush(ctxt, v27);
}

void exsltDateYearFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 >= 2)
  {
    int v3 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3262, 12);
    if (!ctxt) {
      return;
    }
LABEL_7:
    ctxt->error = v3;
    return;
  }
  if (a2 == 1)
  {
    uint64_t v4 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      int v3 = 11;
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/date.c", 3269, 11);
      goto LABEL_7;
    }
    xmlNodeSetPtr v5 = v4;
    if (v4)
    {
      uint64_t v6 = exsltDateParse(v4);
      if (v6)
      {
        if (*(_DWORD *)v6 <= 0xFu && ((1 << *(_DWORD *)v6) & 0xD100) != 0)
        {
          char v8 = 0;
          goto LABEL_17;
        }
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      double v9 = *MEMORY[0x263F8C8D0];
LABEL_22:
      ((void (*)(unsigned __int8 *))*MEMORY[0x263F8C880])(v5);
      goto LABEL_23;
    }
  }
  uint64_t v6 = exsltDateCurrent();
  if (v6)
  {
    xmlNodeSetPtr v5 = 0;
    char v8 = 1;
LABEL_17:
    double v9 = (double)(uint64_t)(*(void *)(v6 + 8) - (*(void *)(v6 + 8) < 1));
    ((void (*)(void))*MEMORY[0x263F8C880])();
    if (v8) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  double v9 = *MEMORY[0x263F8C8D0];
LABEL_23:
  uint64_t v10 = xmlXPathNewFloat(v9);

  valuePush(ctxt, v10);
}

int exsltDateXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  if (!ctxt) {
    return -1;
  }
  if (!prefix) {
    return -1;
  }
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/dates-and-times")) {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"add", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"add-duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateAddDurationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"date", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"date-time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDateTimeFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayAbbreviationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInMonthFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-in-week", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInWeekFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayInYearFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayNameFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"day-of-week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDayOfWeekInMonthFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDifferenceFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"duration", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateDurationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"hour-in-day", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateHourInDayFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"leap-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateLeapYearFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"minute-in-hour", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMinuteInHourFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"month-abbreviation", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthAbbreviationFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"month-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthInYearFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"month-name", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateMonthNameFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"second-in-minute", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondInMinuteFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"seconds", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSecondsFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"sum", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateSumFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"time", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateTimeFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"week-in-month", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInMonthFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"week-in-year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateWeekInYearFunction))
  {
    return -1;
  }
  int result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"year", (const xmlChar *)"http://exslt.org/dates-and-times", (xmlXPathFunction)exsltDateYearFunction);
  if (result) {
    return -1;
  }
  return result;
}

uint64_t exsltDateParse(unsigned __int8 *a1)
{
  unsigned int v40 = a1;
  uint64_t Date = exsltDateCreateDate(0);
  uint64_t v3 = Date;
  if (Date)
  {
    int v4 = *a1;
    if (v4 == 45)
    {
      if (a1[1] == 45)
      {
        int v5 = a1[2];
        unsigned int v40 = a1 + 2;
        if (v5 == 45)
        {
          unsigned int v40 = a1 + 3;
          if (!_exsltDateParseGDay(Date, &v40))
          {
            int v6 = *v40;
            BOOL v7 = (v6 - 43) > 0x2F || ((1 << (v6 - 43)) & 0x800000000005) == 0;
            BOOL v8 = !v7 || v6 == 0;
            if (v8 && !_exsltDateParseTimeZone(v3, &v40) && !*v40)
            {
              int v9 = 2;
LABEL_101:
              *(_DWORD *)uint64_t v3 = v9;
              return v3;
            }
          }
        }
        else if (!_exsltDateParseGMonth(Date, &v40))
        {
          uint64_t v34 = v40;
          if (*v40 == 45)
          {
            ++v40;
            if (v34[1] == 45)
            {
              unsigned int v40 = v34 + 2;
              int v35 = v34[2];
              BOOL v37 = (v35 - 43) <= 0x2F && ((1 << (v35 - 43)) & 0x800000000005) != 0
                 || v35 == 0;
              if (v37 && !_exsltDateParseTimeZone(v3, &v40) && !*v40)
              {
                int v9 = 4;
                goto LABEL_101;
              }
            }
            else if (!_exsltDateParseGDay(v3, &v40))
            {
              if ((unsigned int v38 = *v40 - 43, v38 <= 0x2F) && ((1 << v38) & 0x800000000005) != 0 || !*v40)
              {
                if (!_exsltDateParseTimeZone(v3, &v40) && !*v40)
                {
                  int v9 = 6;
                  goto LABEL_101;
                }
              }
            }
          }
        }
LABEL_110:
        ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v3);
        return 0;
      }
    }
    else
    {
      if ((v4 - 48) > 9) {
        goto LABEL_29;
      }
      if (!_exsltDateParseTime(Date, &v40))
      {
        int v10 = *v40;
        BOOL v11 = (v10 - 43) > 0x2F || ((1 << (v10 - 43)) & 0x800000000005) == 0;
        BOOL v12 = !v11 || v10 == 0;
        if (v12 && !_exsltDateParseTimeZone(v3, &v40))
        {
          if (!*v40)
          {
            int v9 = 1;
            goto LABEL_101;
          }
          goto LABEL_110;
        }
      }
    }
    int v4 = *a1;
LABEL_29:
    unsigned int v40 = a1;
    if ((v4 - 58) > 0xFFFFFFF5 || v4 == 45 || v4 == 43)
    {
      uint64_t v13 = v4 == 45 ? a1 + 1 : a1;
      int v14 = *v13;
      if ((v14 - 48) <= 9)
      {
        uint64_t v15 = *(void *)(v3 + 8);
        unsigned int v16 = -1;
        uint64_t v17 = v13;
        while (v15 <= 0xCCCCCCCCCCCCCCBLL)
        {
          uint64_t v15 = (v14 - 48) + 10 * v15;
          *(void *)(v3 + 8) = v15;
          int v18 = *++v17;
          int v14 = v18;
          ++v16;
          if ((v18 - 48) >= 0xA)
          {
            if (v16 < 3 || v16 != 3 && *v13 == 48 || !v15) {
              goto LABEL_110;
            }
            if (v4 == 45)
            {
              *(void *)(v3 + 8) = 1 - v15;
              int v14 = *v17;
            }
            unsigned int v40 = v17;
            if ((v14 - 43) > 0x2F || ((1 << (v14 - 43)) & 0x800000000005) == 0)
            {
              if (v14) {
                goto LABEL_110;
              }
            }
            if (_exsltDateParseTimeZone(v3, &v40))
            {
              if (*v40 != 45) {
                goto LABEL_110;
              }
              ++v40;
              if (_exsltDateParseGMonth(v3, &v40)) {
                goto LABEL_110;
              }
              unsigned int v19 = *v40 - 43;
              if (v19 > 0x2F || ((1 << v19) & 0x800000000005) == 0)
              {
                if (*v40) {
                  goto LABEL_110;
                }
              }
              if (_exsltDateParseTimeZone(v3, &v40))
              {
                if (*v40 != 45) {
                  goto LABEL_110;
                }
                ++v40;
                if (_exsltDateParseGDay(v3, &v40)) {
                  goto LABEL_110;
                }
                unint64_t v20 = *(unsigned int *)(v3 + 16);
                unsigned int v21 = (*(_DWORD *)(v3 + 16) & 0xF) - 1;
                if (v21 > 0xB) {
                  goto LABEL_110;
                }
                uint64_t v22 = *(void *)(v3 + 8);
                if ((v22 & 3) != 0
                  || 0x8F5C28F5C28F5C29 * v22 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70 && (v22 & 0xF) != 0)
                {
                  uint64_t v23 = (v20 >> 4) & 0x1F;
                  uint64_t v24 = &daysInMonth;
                }
                else
                {
                  uint64_t v23 = (v20 >> 4) & 0x1F;
                  uint64_t v24 = &daysInMonthLeap;
                }
                if (v24[v21] < v23) {
                  goto LABEL_110;
                }
                uint64_t v25 = v40;
                int v26 = *v40;
                if (((v26 - 43) > 0x2F || ((1 << (v26 - 43)) & 0x800000000005) == 0)
                  && *v40
                  || (v27 = _exsltDateParseTimeZone(v3, &v40), uint64_t v25 = v40, v26 = *v40, v27))
                {
                  if (v26 == 84)
                  {
                    unsigned int v40 = v25 + 1;
                    if (!_exsltDateParseTime(v3, &v40)
                      && !_exsltDateParseTimeZone(v3, &v40)
                      && !*v40)
                    {
                      unint64_t v28 = *(unsigned int *)(v3 + 16);
                      unsigned int v29 = (*(_DWORD *)(v3 + 16) & 0xF) - 1;
                      if (v29 <= 0xB)
                      {
                        uint64_t v30 = *(void *)(v3 + 8);
                        if ((v30 & 3) != 0
                          || 0x8F5C28F5C28F5C29 * v30 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70 && (v30 & 0xF) != 0)
                        {
                          uint64_t v31 = (v28 >> 4) & 0x1F;
                          long double v32 = &daysInMonth;
                        }
                        else
                        {
                          uint64_t v31 = (v28 >> 4) & 0x1F;
                          long double v32 = &daysInMonthLeap;
                        }
                        if (v32[v29] >= v31 && (~v28 & 0x3000) != 0 && (v28 & 0xF0000) != 0xF0000)
                        {
                          double v33 = *(double *)(v3 + 24);
                          if (v33 >= 0.0
                            && v33 < 60.0
                            && (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(v3 + 32) + 23024) >> 4) <= 0xB3Eu)
                          {
                            int v9 = 15;
                            goto LABEL_101;
                          }
                        }
                      }
                    }
                  }
                  goto LABEL_110;
                }
                if (*v40) {
                  goto LABEL_110;
                }
                int v9 = 14;
              }
              else
              {
                if (*v40) {
                  goto LABEL_110;
                }
                int v9 = 12;
              }
            }
            else
            {
              if (*v40) {
                goto LABEL_110;
              }
              int v9 = 8;
            }
            goto LABEL_101;
          }
        }
      }
    }
    goto LABEL_110;
  }
  return v3;
}

double exsltDateParseDuration(unsigned __int8 *a1, __n128 a2)
{
  int v2 = *a1;
  if (v2 == 45) {
    uint64_t v3 = a1 + 1;
  }
  else {
    uint64_t v3 = a1;
  }
  int v5 = *v3;
  int v4 = v3 + 1;
  if (v5 == 80)
  {
    if (*v4)
    {
      Duration = exsltDateCreateDuration();
      if (Duration)
      {
        int v8 = *v4;
        if (*v4)
        {
          uint64_t v9 = 0;
          unsigned int v10 = 0;
          a2.n128_u64[0] = 0;
          v7.n128_u64[0] = 10.0;
          while (v10 <= 5)
          {
            if (v8 == 84)
            {
              if (v10 > 3) {
                goto LABEL_57;
              }
              int v11 = *++v4;
              int v8 = v11;
              unsigned int v10 = 3u;
            }
            else if (v10 == 3)
            {
              goto LABEL_57;
            }
            if ((v8 - 48) <= 9)
            {
              uint64_t v12 = 0;
              while (v12 <= 0xCCCCCCCCCCCCCCCLL)
              {
                uint64_t v13 = (v8 - 48);
                if (10 * v12 > (v13 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  break;
                }
                uint64_t v12 = v13 + 10 * v12;
                int v14 = *++v4;
                int v8 = v14;
                if ((v14 - 48) >= 0xA)
                {
                  uint64_t v15 = 1;
                  goto LABEL_21;
                }
              }
              goto LABEL_57;
            }
            uint64_t v12 = 0;
            uint64_t v15 = 0;
LABEL_21:
            if (v8 == 46)
            {
              int v17 = *++v4;
              int v16 = v17;
              if ((v17 - 48) <= 9)
              {
                double v18 = 1.0;
                do
                {
                  double v18 = v18 / 10.0;
                  a2.n128_f64[0] = a2.n128_f64[0] + (double)(v16 - 48) * v18;
                  int v19 = *++v4;
                  int v16 = v19;
                }
                while ((v19 - 48) < 0xA);
                uint64_t v15 = 1;
              }
            }
            else
            {
              int v16 = v8;
            }
            while (v16 != byte_228A37C18[v10])
            {
              if (v10 != 2)
              {
                BOOL v20 = v10++ == 5;
                if (!v20) {
                  continue;
                }
              }
              goto LABEL_57;
            }
            BOOL v20 = v8 != 46 || v10 == 5;
            char v21 = !v20;
            if (!v15 || (v21 & 1) != 0) {
              goto LABEL_57;
            }
            switch(v10)
            {
              case 0u:
                if (v12 > 0xAAAAAAAAAAAAAAALL) {
                  goto LABEL_57;
                }
                uint64_t v22 = 12 * v12;
                goto LABEL_45;
              case 1u:
                if (*Duration > (v12 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  goto LABEL_57;
                }
                uint64_t v22 = *Duration + v12;
LABEL_45:
                uint64_t *Duration = v22;
                break;
              case 2u:
                Duration[1] = v12;
                break;
              case 3u:
                uint64_t v23 = Duration[1];
                if (v23 > ((v12 / 24) ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  goto LABEL_57;
                }
                Duration[1] = v23 + v12 / 24;
                uint64_t v9 = 3600 * (v12 % 24);
                break;
              case 4u:
                uint64_t v24 = Duration[1];
                if (v24 > ((v12 / 1440) ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  goto LABEL_57;
                }
                Duration[1] = v24 + v12 / 1440;
                v9 += 60 * (v12 % 1440);
                break;
              case 5u:
                uint64_t v25 = Duration[1];
                if (v25 > ((v12 / 86400) ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  goto LABEL_57;
                }
                Duration[1] = v25 + v12 / 86400;
                v9 += v12 % 86400;
                break;
              default:
                break;
            }
            ++v10;
            int v26 = *++v4;
            int v8 = v26;
            if (!v26) {
              goto LABEL_56;
            }
          }
          goto LABEL_57;
        }
        uint64_t v9 = 0;
        a2.n128_u64[0] = 0;
LABEL_56:
        uint64_t v27 = Duration[1];
        if (v27 > ((v9 / 86400) ^ 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_57:
          ((void (*)(__n128, __n128))*MEMORY[0x263F8C880])(a2, v7);
          return a2.n128_f64[0];
        }
        uint64_t v28 = v27 + v9 / 86400;
        Duration[1] = v28;
        a2.n128_f64[0] = a2.n128_f64[0] + (double)(v9 % 86400);
        Duration[2] = a2.n128_u64[0];
        if (v2 == 45)
        {
          uint64_t *Duration = -*Duration;
          Duration[1] = -v28;
          if (a2.n128_f64[0] != 0.0)
          {
            a2.n128_f64[0] = 86400.0 - a2.n128_f64[0];
            Duration[2] = a2.n128_u64[0];
            Duration[1] = ~v28;
          }
        }
      }
    }
  }
  return a2.n128_f64[0];
}

uint64_t exsltDateCreateDate(int a1)
{
  uint64_t v2 = ((uint64_t (*)(uint64_t))*MEMORY[0x263F8C8B0])(40);
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 32) = 0;
    *(_OWORD *)uint64_t v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_DWORD *)(v2 + 16) = *(_DWORD *)(v2 + 16) & 0xFFFFFE00 | 0x11;
    if (a1) {
      *(_DWORD *)uint64_t v2 = a1;
    }
  }
  else
  {
    ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltDateCreateDate: out of memory\n");
  }
  return v3;
}

uint64_t _exsltDateParseGDay(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2 = (uint64_t)*a2;
  int v3 = **a2;
  if ((v3 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v4 = *(unsigned __int8 *)(v2 + 1);
  if ((v4 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v6 = v4 + 10 * v3;
  if ((v6 - 529) > 0x1E) {
    return 2;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFE0F | (16 * (((16 * v6 + 256) >> 4) & 0x1F));
  *a2 = (unsigned __int8 *)(v2 + 2);
  return result;
}

uint64_t _exsltDateParseTimeZone(uint64_t a1, unsigned __int8 **a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *a2;
  unsigned int v3 = **a2;
  uint64_t v4 = 1;
  if (v3 <= 0x2C)
  {
    if (!**a2)
    {
      *(_WORD *)(a1 + 32) &= 0xE000u;
      goto LABEL_14;
    }
    if (v3 != 43) {
      return v4;
    }
    goto LABEL_10;
  }
  if (v3 == 45)
  {
LABEL_10:
    int v5 = v2[1];
    if ((v5 - 58) < 0xFFFFFFF6) {
      return 1;
    }
    int v6 = v2[2];
    if ((v6 - 58) < 0xFFFFFFF6) {
      return 1;
    }
    unsigned int v8 = v6 + 10 * v5;
    if (v8 > 0x227) {
      return 2;
    }
    if (v2[3] != 58) {
      return 1;
    }
    __int16 v9 = 120 * v8;
    __int16 v10 = (120 * v8 + 2176) & 0x1FF8;
    __int16 v11 = *(_WORD *)(a1 + 32) & 0xE001;
    *(_WORD *)(a1 + 32) = v11 | v10;
    int v12 = v2[4];
    if ((v12 - 58) < 0xFFFFFFF6) {
      return 1;
    }
    int v13 = v2[5];
    if ((v13 - 58) < 0xFFFFFFF6) {
      return 1;
    }
    unsigned int v14 = v13 + 10 * v12;
    if (v14 > 0x24B) {
      return 2;
    }
    __int16 v15 = v9 + 2 * v14;
    __int16 v16 = v15 + 9312;
    __int16 v17 = -9312 - v15;
    __int16 v18 = v3 == 45 ? v17 : v16;
    *(_WORD *)(a1 + 32) = v18 & 0x1FFE | v11;
    if ((unsigned __int16)((unsigned __int16)(8 * v18 + 23024) >> 4) > 0xB3Eu) {
      return 2;
    }
    v2 += 6;
LABEL_14:
    uint64_t v4 = 0;
    *a2 = v2;
    return v4;
  }
  if (v3 == 90)
  {
    *(_WORD *)(a1 + 32) = *(_WORD *)(a1 + 32) & 0xE000 | 1;
    ++v2;
    goto LABEL_14;
  }
  return v4;
}

uint64_t _exsltDateParseGMonth(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2 = (uint64_t)*a2;
  int v3 = **a2;
  if ((v3 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v4 = *(unsigned __int8 *)(v2 + 1);
  if ((v4 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v6 = v4 + 10 * v3;
  if ((v6 - 529) > 0xB) {
    return 2;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFFF0 | v6 & 0xF;
  *a2 = (unsigned __int8 *)(v2 + 2);
  return result;
}

uint64_t _exsltDateParseTime(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2 = *a2;
  int v3 = **a2;
  if ((v3 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v4 = v2[1];
  if ((v4 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  unsigned int v5 = v4 + 10 * v3;
  if (v5 > 0x227) {
    return 2;
  }
  if (v2[2] != 58) {
    return 1;
  }
  unsigned int v6 = (v5 << 9) + 0x2000;
  unsigned int v7 = *(_DWORD *)(a1 + 16) & 0xFFFFC1FF | (((v6 >> 9) & 0x1F) << 9);
  *(_DWORD *)(a1 + 16) = v7;
  int v8 = v2[3];
  if ((v8 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v9 = v2[4];
  if ((v9 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  unsigned int v10 = v9 + 10 * v8;
  if (v10 > 0x24B) {
    return 2;
  }
  unsigned int v11 = (v10 << 14) + 786432;
  *(_DWORD *)(a1 + 16) = v7 & 0xFFF03FFF | (((v11 >> 14) & 0x3F) << 14);
  if (v2[5] != 58) {
    return 1;
  }
  int v12 = v2[6];
  if ((v12 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v13 = v2[7];
  if ((v13 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  double v16 = (double)(v13 + 10 * v12 - 528);
  *(double *)(a1 + 24) = v16;
  __int16 v17 = v2 + 8;
  if (v2[8] == 46)
  {
    int v20 = v2[9];
    __int16 v18 = v2 + 9;
    int v19 = v20;
    unsigned int v21 = v20 - 48;
    if ((v20 - 48) > 9) {
      return 1;
    }
    double v22 = 1.0;
    __int16 v17 = v18;
    do
    {
      double v22 = v22 / 10.0;
      double v16 = v16 + (double)(v19 - 48) * v22;
      *(double *)(a1 + 24) = v16;
      int v23 = *++v17;
      int v19 = v23;
    }
    while ((v23 - 48) < 0xA);
    if (v21 > 9) {
      return 1;
    }
  }
  uint64_t v14 = 2;
  if ((~v6 & 0x3000) != 0 && (v11 & 0xF0000) != 0xF0000)
  {
    BOOL v24 = v16 >= 0.0 && v16 < 60.0;
    if (v24 && (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(a1 + 32) + 23024) >> 4) <= 0xB3Eu)
    {
      uint64_t v14 = 0;
      *a2 = v17;
      return v14;
    }
    return 2;
  }
  return v14;
}

void *exsltDateCreateDuration()
{
  v0 = (void *)((uint64_t (*)(uint64_t))*MEMORY[0x263F8C8B0])(24);
  v1 = v0;
  if (v0)
  {
    void *v0 = 0;
    v0[1] = 0;
    v0[2] = 0;
  }
  else
  {
    ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltDateCreateDuration: out of memory\n");
  }
  return v1;
}

xmlChar *exsltDateFormatDateTime(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  unint64_t v1 = *(unsigned int *)(a1 + 16);
  unsigned int v2 = (*(_DWORD *)(a1 + 16) & 0xF) - 1;
  if (v2 > 0xB) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  if ((v4 & 3) == 0
    && (0x8F5C28F5C28F5C29 * v4 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
      ? (BOOL v5 = (*(void *)(a1 + 8) & 0xFLL) == 0)
      : (BOOL v5 = 1),
        v5))
  {
    uint64_t v6 = (v1 >> 4) & 0x1F;
    unsigned int v7 = &daysInMonthLeap;
  }
  else
  {
    uint64_t v6 = (v1 >> 4) & 0x1F;
    unsigned int v7 = &daysInMonth;
  }
  if (v7[v2] < v6) {
    return 0;
  }
  uint64_t result = 0;
  if ((~v1 & 0x3000) != 0 && (v1 & 0xF0000) != 0xF0000)
  {
    double v9 = *(double *)(a1 + 24);
    BOOL v10 = v9 >= 0.0 && v9 < 60.0;
    if (!v10 || (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(a1 + 32) + 23024) >> 4) > 0xB3Eu) {
      return 0;
    }
    int v58 = 0;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    *(_OWORD *)cur = 0u;
    long long v53 = 0u;
    if (v4 <= 0)
    {
      cur[0] = 45;
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 0;
    }
    int v51 = 0;
    unint64_t v12 = 1 - v4;
    if (v4 >= 1) {
      unint64_t v12 = v4;
    }
    long long v49 = 0uLL;
    long long v50 = 0uLL;
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    if ((uint64_t)v12 < 1)
    {
      double v16 = (char *)&v45;
    }
    else
    {
      unint64_t v13 = 0;
      do
      {
        unint64_t v14 = v13 + 1;
        *((unsigned char *)&v45 + v13) = (v12 % 0xA) | 0x30;
        if (v12 < 0xA) {
          break;
        }
        v12 /= 0xAuLL;
        BOOL v15 = v13++ >= 0x62;
      }
      while (!v15);
      double v16 = (char *)&v45 + v14;
    }
    uint64_t v17 = v16 - (char *)&v45;
    if (v16 - (char *)&v45 <= 3)
    {
      memset(v16, 48, (char *)&v45 + 4 - v16);
      double v16 = (char *)&v45 + 4;
    }
    if (v16 <= (char *)&v45)
    {
      int v23 = (xmlChar *)((unint64_t)cur | v11);
    }
    else
    {
      uint64_t v18 = 4;
      if (v17 > 4) {
        uint64_t v18 = v17;
      }
      int v19 = (xmlChar *)&v45 + v18 - 1;
      do
      {
        unint64_t v20 = v11++;
        BOOL v21 = v19 > (xmlChar *)&v45;
        xmlChar v22 = *v19--;
        cur[v20] = v22;
      }
      while (v21 && v20 < 0x62);
      if (v20 > 0x61)
      {
LABEL_46:
        if (v11 <= 98)
        {
          cur[v11] = ((v1 & 0xE) > 9) | 0x30;
          if (v11 == 98) {
            goto LABEL_58;
          }
          cur[v11 + 1] = ((v1 & 0xF) % 0xA) | 0x30;
          if (v11 > 96) {
            goto LABEL_58;
          }
          cur[v11 + 2] = 45;
          if (v11 == 96) {
            goto LABEL_58;
          }
          cur[v11 + 3] = ((unsigned __int16)(26 * ((v1 >> 4) & 0x1E)) >> 8) | 0x30;
          if (v11 > 94
            || (cur[v11 + 4] = (((v1 >> 4) & 0x1F)
                              - 10 * ((unsigned __int16)(26 * ((v1 >> 4) & 0x1F)) >> 8)) | 0x30,
                v11 == 94)
            || (cur[v11 + 5] = 84, v11 > 92)
            || (cur[v11 + 6] = ((unsigned __int16)(26 * ((v1 >> 9) & 0x1E)) >> 8) | 0x30, v11 == 92)
            || (cur[v11 + 7] = (((v1 >> 9) & 0x1F)
                              - 10 * ((unsigned __int16)(26 * ((v1 >> 9) & 0x1F)) >> 8)) | 0x30,
                v11 > 90)
            || (cur[v11 + 8] = 58, v11 == 90)
            || (cur[v11 + 9] = ((unsigned __int16)(26 * ((v1 >> 14) & 0x3E)) >> 8) | 0x30, v11 > 88)
            || (cur[v11 + 10] = (((v1 >> 14) & 0x3F)
                               - 10 * ((unsigned __int16)(26 * ((v1 >> 14) & 0x3F)) >> 8)) | 0x30,
                v11 == 88))
          {
LABEL_58:
            uint64_t v11 = 99;
          }
          else
          {
            uint64_t v44 = v11 + 12;
            cur[v11 + 11] = 58;
            if (v9 >= 10.0 || v11 > 86)
            {
              v11 += 12;
            }
            else
            {
              v11 += 13;
              cur[v44] = 48;
            }
          }
        }
        BOOL v24 = xmlXPathCastNumberToString(v9);
        long double v32 = &cur[v11];
        xmlChar v33 = *v24;
        BOOL v34 = v11 < 99;
        if (*v24 && v11 <= 98)
        {
          int v35 = v24 + 1;
          do
          {
            uint64_t v36 = v11 + 1;
            cur[v11] = v33;
            int v37 = *v35++;
            xmlChar v33 = v37;
            BOOL v34 = (unint64_t)v11 < 0x62;
            if (!v37) {
              break;
            }
            BOOL v15 = (unint64_t)v11++ >= 0x62;
          }
          while (!v15);
          long double v32 = &cur[v36];
        }
        else
        {
          uint64_t v36 = v11;
        }
        ((void (*)(xmlChar *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))*MEMORY[0x263F8C880])(v24, v25, v26, v27, v28, v29, v30, v31, v45, *((void *)&v45 + 1), v46, *((void *)&v46 + 1), v47);
        signed __int16 v38 = 8 * *(_WORD *)(a1 + 32);
        if ((unsigned __int16)v38 <= 0xFu)
        {
          if (!v34)
          {
LABEL_86:
            *long double v32 = 0;
            return xmlStrdup(cur);
          }
          char v39 = 90;
LABEL_70:
          *v32++ = v39;
          goto LABEL_86;
        }
        if (v38 >= 0) {
          unsigned int v40 = v38 >> 4;
        }
        else {
          unsigned int v40 = -(v38 >> 4);
        }
        if (v34)
        {
          if ((*(_WORD *)(a1 + 32) & 0x1000) != 0) {
            char v41 = 45;
          }
          else {
            char v41 = 43;
          }
          *long double v32 = v41;
          if (v36 != 98)
          {
            cur[v36 + 1] = (v40 / 0x258 - 10 * ((429496730 * (unint64_t)(v40 / 0x258)) >> 32)) | 0x30;
            if (v36 <= 96)
            {
              cur[v36 + 2] = (v40 / 0x3C - 10 * ((429496730 * (unint64_t)(v40 / 0x3C)) >> 32)) | 0x30;
              if (v36 != 96)
              {
                int64_t v42 = &cur[v36];
                cur[v36 + 3] = 58;
                if (v36 < 95)
                {
                  unsigned __int8 v43 = v40 % 0x3C;
                  v42[4] = (v43 / 0xAu) | 0x30;
                  long double v32 = v42 + 5;
                  if (v36 == 94) {
                    goto LABEL_86;
                  }
                  char v39 = (v43 % 0xAu) | 0x30;
                  goto LABEL_70;
                }
              }
            }
          }
          uint64_t v36 = 99;
        }
        long double v32 = &cur[v36];
        goto LABEL_86;
      }
      int v23 = &cur[v11];
    }
    ++v11;
    *int v23 = 45;
    goto LABEL_46;
  }
  return result;
}

xmlChar *exsltDateFormatDate(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v1 = *(unsigned int *)(a1 + 16);
  unsigned int v2 = (*(_DWORD *)(a1 + 16) & 0xF) - 1;
  if (v2 > 0xB) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 8);
  if ((v3 & 3) == 0
    && (0x8F5C28F5C28F5C29 * v3 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
      ? (BOOL v4 = (*(void *)(a1 + 8) & 0xFLL) == 0)
      : (BOOL v4 = 1),
        v4))
  {
    uint64_t v5 = (v1 >> 4) & 0x1F;
    uint64_t v6 = &daysInMonthLeap;
  }
  else
  {
    uint64_t v5 = (v1 >> 4) & 0x1F;
    uint64_t v6 = &daysInMonth;
  }
  if (v6[v2] < v5) {
    return 0;
  }
  uint64_t v7 = 0;
  if ((~v1 & 0x3000) != 0 && (v1 & 0xF0000) != 0xF0000)
  {
    double v9 = *(double *)(a1 + 24);
    if (v9 < 0.0 || v9 >= 60.0) {
      return 0;
    }
    __int16 v11 = *(_WORD *)(a1 + 32);
    if ((unsigned __int16)((unsigned __int16)(8 * v11 + 23024) >> 4) > 0xB3Eu) {
      return 0;
    }
    int v41 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    *(_OWORD *)cur = 0u;
    long long v36 = 0u;
    if (v3 <= 0)
    {
      cur[0] = 45;
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = 0;
    }
    int v34 = 0;
    unint64_t v13 = 1 - v3;
    if (v3 >= 1) {
      unint64_t v13 = v3;
    }
    memset(v33, 0, sizeof(v33));
    if ((uint64_t)v13 < 1)
    {
      uint64_t v17 = (char *)v33;
    }
    else
    {
      unint64_t v14 = 0;
      do
      {
        unint64_t v15 = v14 + 1;
        *((unsigned char *)v33 + v14) = (v13 % 0xA) | 0x30;
        if (v13 < 0xA) {
          break;
        }
        v13 /= 0xAuLL;
      }
      while (v14++ < 0x62);
      uint64_t v17 = (char *)v33 + v15;
    }
    uint64_t v18 = v17 - (char *)v33;
    if (v17 - (char *)v33 <= 3)
    {
      memset(v17, 48, (char *)v33 + 4 - v17);
      uint64_t v17 = (char *)v33 + 4;
    }
    if (v17 <= (char *)v33)
    {
      BOOL v24 = (xmlChar *)((unint64_t)cur | v12);
    }
    else
    {
      uint64_t v19 = 4;
      if (v18 > 4) {
        uint64_t v19 = v18;
      }
      unint64_t v20 = (xmlChar *)v33 + v19 - 1;
      do
      {
        unint64_t v21 = v12++;
        BOOL v22 = v20 > (xmlChar *)v33;
        xmlChar v23 = *v20--;
        cur[v21] = v23;
      }
      while (v22 && v21 < 0x62);
      if (v21 > 0x61)
      {
LABEL_46:
        if (v12 <= 98)
        {
          cur[v12] = ((v1 & 0xE) > 9) | 0x30;
          if (v12 == 98
            || (cur[v12 + 1] = ((v1 & 0xF) % 0xA) | 0x30, v12 > 96)
            || (cur[v12 + 2] = 45, v12 == 96)
            || (cur[v12 + 3] = ((unsigned __int16)(26 * ((v1 >> 4) & 0x1E)) >> 8) | 0x30, v12 > 94))
          {
            uint64_t v12 = 99;
          }
          else
          {
            uint64_t v25 = &cur[v12];
            v12 += 5;
            v25[4] = (((v1 >> 4) & 0x1F)
                    - 10 * ((unsigned __int16)(26 * ((v1 >> 4) & 0x1F)) >> 8)) | 0x30;
          }
        }
        uint64_t v26 = &cur[v12];
        if ((v11 & 0x1FFF) == 0) {
          goto LABEL_72;
        }
        __int16 v27 = 8 * v11;
        if ((unsigned __int16)(8 * v11) <= 0xFu)
        {
          if (v12 > 98)
          {
LABEL_72:
            *uint64_t v26 = 0;
            return xmlStrdup(cur);
          }
          char v28 = 90;
LABEL_57:
          *v26++ = v28;
          goto LABEL_72;
        }
        unsigned int v29 = v27 >> 4;
        if (v27 < 0) {
          unsigned int v29 = -v29;
        }
        if (v12 <= 98)
        {
          if ((v11 & 0x1000) != 0) {
            xmlChar v30 = 45;
          }
          else {
            xmlChar v30 = 43;
          }
          cur[v12] = v30;
          if (v12 != 98)
          {
            cur[v12 + 1] = (v29 / 0x258 - 10 * ((429496730 * (unint64_t)(v29 / 0x258)) >> 32)) | 0x30;
            if (v12 <= 96)
            {
              cur[v12 + 2] = (v29 / 0x3C - 10 * ((429496730 * (unint64_t)(v29 / 0x3C)) >> 32)) | 0x30;
              if (v12 != 96)
              {
                cur[v12 + 3] = 58;
                if (v12 < 95)
                {
                  unsigned int v31 = v29 % 0x3C;
                  char v32 = v29 % 0x3C / 0xA;
                  cur[v12 + 4] = v32 | 0x30;
                  uint64_t v26 = &cur[v12 + 5];
                  if (v12 == 94) {
                    goto LABEL_72;
                  }
                  char v28 = (v31 - 10 * v32) | 0x30;
                  goto LABEL_57;
                }
              }
            }
          }
          uint64_t v12 = 99;
        }
        uint64_t v26 = &cur[v12];
        goto LABEL_72;
      }
      BOOL v24 = &cur[v12];
    }
    ++v12;
    *BOOL v24 = 45;
    goto LABEL_46;
  }
  return (xmlChar *)v7;
}

xmlChar *exsltDateFormatTime(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int v1 = *(_DWORD *)(a1 + 16);
  unsigned int v2 = (v1 >> 9) & 0x1F;
  if ((~v1 & 0xF0000) != 0 && v2 <= 0x17)
  {
    double v5 = *(double *)(a1 + 24);
    BOOL v6 = v5 >= 0.0 && v5 < 60.0;
    if (v6 && (unsigned __int16)((unsigned __int16)(8 * *(_WORD *)(a1 + 32) + 23024) >> 4) <= 0xB3Eu)
    {
      long long v29 = 0u;
      memset(v30, 0, sizeof(v30));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      unsigned int v7 = (205 * v2) >> 11;
      cur[0] = v7 | 0x30;
      cur[1] = (v2 - 10 * v7) | 0x30;
      cur[2] = 58;
      cur[3] = ((unsigned __int16)(26 * ((v1 >> 14) & 0x3E)) >> 8) | 0x30;
      cur[4] = (((v1 >> 14) & 0x3F) - 10 * ((unsigned __int16)(26 * ((v1 >> 14) & 0x3F)) >> 8)) | 0x30;
      cur[5] = 58;
      if (v5 >= 10.0)
      {
        unint64_t v8 = 6;
      }
      else
      {
        LOBYTE(v26) = 48;
        unint64_t v8 = 7;
      }
      BOOL v10 = xmlXPathCastNumberToString(v5);
      xmlChar v11 = *v10;
      if (*v10)
      {
        uint64_t v12 = v10 + 1;
        unint64_t v13 = v8;
        do
        {
          unint64_t v8 = v13 + 1;
          cur[v13] = v11;
          int v14 = *v12++;
          xmlChar v11 = v14;
          BOOL v15 = v13 < 0x62;
          if (!v14) {
            break;
          }
        }
        while (v13++ < 0x62);
        uint64_t v17 = &cur[v8];
      }
      else
      {
        uint64_t v17 = &cur[v8];
        BOOL v15 = 1;
      }
      ((void (*)(void))*MEMORY[0x263F8C880])();
      __int16 v18 = *(_WORD *)(a1 + 32);
      if ((v18 & 0x1FFF) == 0) {
        goto LABEL_42;
      }
      __int16 v19 = 8 * v18;
      if ((unsigned __int16)(8 * v18) > 0xFu)
      {
        if (v19 >= 0) {
          unsigned int v21 = v19 >> 4;
        }
        else {
          unsigned int v21 = -(v19 >> 4);
        }
        if (!v15
          || ((*(_WORD *)(a1 + 32) & 0x1000) != 0 ? (char v22 = 45) : (char v22 = 43),
              (*uint64_t v17 = v22, v8 == 98)
           || (cur[v8 + 1] = (v21 / 0x258 - 10 * ((429496730 * (unint64_t)(v21 / 0x258)) >> 32)) | 0x30, v8 > 0x60)
           || (cur[v8 + 2] = (v21 / 0x3C - 10 * ((429496730 * (unint64_t)(v21 / 0x3C)) >> 32)) | 0x30, v8 == 96)
           || (xmlChar v23 = &cur[v8], cur[v8 + 3] = 58, v8 >= 0x5F)))
        {
          uint64_t v17 = &v30[29];
          goto LABEL_42;
        }
        unsigned int v24 = v21 % 0x3C;
        v23[4] = (v24 / 0xAu) | 0x30;
        uint64_t v17 = v23 + 5;
        if (v8 != 94)
        {
          char v20 = (v24 % 0xAu) | 0x30;
          goto LABEL_27;
        }
      }
      else if (v15)
      {
        char v20 = 90;
LABEL_27:
        *v17++ = v20;
      }
LABEL_42:
      *uint64_t v17 = 0;
      return xmlStrdup(cur);
    }
  }
  return 0;
}

xmlChar *exsltDateFormatDuration(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  double v1 = *(double *)(a1 + 16);
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  if (v1 != 0.0 || v3 != 0)
  {
    double v5 = (double)v3;
    if (v3 < 0)
    {
      if (v1 == 0.0)
      {
        double v7 = (double)v3;
      }
      else
      {
        double v1 = 86400.0 - v1;
        double v7 = v5 + 1.0;
      }
      double v5 = -v7;
      int v6 = 45;
    }
    else
    {
      int v6 = 0;
    }
LABEL_13:
    double v8 = (double)(v2 / 12);
    uint64_t v9 = v2 % 12;
    double v10 = (double)(v2 % 12);
    memset(v63, 0, sizeof(v63));
    if (v2 >= -11)
    {
      BOOL v11 = v9 < 0;
    }
    else
    {
      double v8 = -v8;
      BOOL v11 = 1;
    }
    if (v11) {
      int v12 = 45;
    }
    else {
      int v12 = v6;
    }
    if (v9 >= 0) {
      double v13 = v10;
    }
    else {
      double v13 = -v10;
    }
    xmlChar cur = v12;
    BOOL v14 = v12 == 45;
    if (v12 == 45) {
      p_xmlChar cur = v63;
    }
    else {
      p_xmlChar cur = &cur;
    }
    if (v14) {
      unint64_t v16 = 2;
    }
    else {
      unint64_t v16 = 1;
    }
    xmlChar *p_cur = 80;
    if (v8 != 0.0 && v8 >= 1.0)
    {
      __int16 v18 = xmlXPathCastNumberToString(floor(v8));
      __int16 v19 = &v63[v16 - 1];
      LOBYTE(v20) = *v18;
      if (*v18)
      {
        uint64_t v21 = 0;
        do
        {
          unint64_t v22 = v16 + v21;
          v19[v21] = v20;
          int v20 = v18[++v21];
        }
        while (v20 && v22 < 0x62);
        ((void (*)(void))*MEMORY[0x263F8C880])();
        if (v22 > 0x61)
        {
          unint64_t v16 = 99;
          goto LABEL_44;
        }
        v16 += v21;
        v19 += v21;
      }
      else
      {
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      ++v16;
      *__int16 v19 = 89;
    }
LABEL_44:
    if (v13 != 0.0 && v13 >= 1.0)
    {
      unsigned int v24 = xmlXPathCastNumberToString(floor(v13));
      uint64_t v25 = &v63[v16 - 1];
      xmlChar v26 = *v24;
      BOOL v27 = v16 < 0x63;
      if (*v24 && v16 <= 0x62)
      {
        long long v28 = v24 + 1;
        do
        {
          unint64_t v29 = v16 + 1;
          v63[v16 - 1] = v26;
          int v30 = *v28++;
          xmlChar v26 = v30;
          BOOL v27 = v16 < 0x62;
          if (!v30) {
            break;
          }
          BOOL v31 = v16++ >= 0x62;
        }
        while (!v31);
        uint64_t v25 = &v63[v29 - 1];
      }
      else
      {
        unint64_t v29 = v16;
      }
      ((void (*)(void))*MEMORY[0x263F8C880])();
      if (v27)
      {
        unint64_t v16 = v29 + 1;
        *uint64_t v25 = 77;
      }
      else
      {
        unint64_t v16 = 99;
      }
    }
    if (v5 >= 1.0)
    {
      char v32 = xmlXPathCastNumberToString(floor(v5));
      xmlChar v33 = &v63[v16 - 1];
      xmlChar v34 = *v32;
      BOOL v35 = v16 < 0x63;
      if (*v32 && v16 <= 0x62)
      {
        long long v36 = v32 + 1;
        do
        {
          unint64_t v37 = v16 + 1;
          v63[v16 - 1] = v34;
          int v38 = *v36++;
          xmlChar v34 = v38;
          BOOL v35 = v16 < 0x62;
          if (!v38) {
            break;
          }
          BOOL v31 = v16++ >= 0x62;
        }
        while (!v31);
        xmlChar v33 = &v63[v37 - 1];
      }
      else
      {
        unint64_t v37 = v16;
      }
      ((void (*)(void))*MEMORY[0x263F8C880])();
      if (!v35)
      {
        unint64_t v16 = 99;
LABEL_72:
        if (v1 >= 3600.0)
        {
          double v39 = floor(v1 / 3600.0);
          long long v40 = xmlXPathCastNumberToString(v39);
          int v41 = &v63[v16 - 1];
          xmlChar v42 = *v40;
          BOOL v43 = v16 < 0x63;
          if (*v40 && v16 <= 0x62)
          {
            uint64_t v44 = v40 + 1;
            do
            {
              unint64_t v45 = v16 + 1;
              v63[v16 - 1] = v42;
              int v46 = *v44++;
              xmlChar v42 = v46;
              BOOL v43 = v16 < 0x62;
              if (!v46) {
                break;
              }
              BOOL v31 = v16++ >= 0x62;
            }
            while (!v31);
            int v41 = &v63[v45 - 1];
          }
          else
          {
            unint64_t v45 = v16;
          }
          ((void (*)(void))*MEMORY[0x263F8C880])();
          if (v43)
          {
            unint64_t v16 = v45 + 1;
            *int v41 = 72;
          }
          else
          {
            unint64_t v16 = 99;
          }
          double v1 = v1 + v39 * -3600.0;
        }
        if (v1 >= 60.0)
        {
          double v47 = floor(v1 / 60.0);
          long long v48 = xmlXPathCastNumberToString(v47);
          long long v49 = &v63[v16 - 1];
          xmlChar v50 = *v48;
          BOOL v51 = v16 < 0x63;
          if (*v48 && v16 <= 0x62)
          {
            int v52 = v48 + 1;
            do
            {
              unint64_t v53 = v16 + 1;
              v63[v16 - 1] = v50;
              int v54 = *v52++;
              xmlChar v50 = v54;
              BOOL v51 = v16 < 0x62;
              if (!v54) {
                break;
              }
              BOOL v31 = v16++ >= 0x62;
            }
            while (!v31);
            long long v49 = &v63[v53 - 1];
          }
          else
          {
            unint64_t v53 = v16;
          }
          ((void (*)(void))*MEMORY[0x263F8C880])();
          if (v51)
          {
            unint64_t v16 = v53 + 1;
            *long long v49 = 77;
          }
          else
          {
            unint64_t v16 = 99;
          }
          double v1 = v1 + v47 * -60.0;
        }
        long long v55 = &v63[v16 - 1];
        if (v1 > 0.0)
        {
          long long v56 = xmlXPathCastNumberToString(v1);
          xmlChar v57 = *v56;
          BOOL v58 = v16 < 0x63;
          if (*v56 && v16 <= 0x62)
          {
            uint64_t v59 = v56 + 1;
            do
            {
              unint64_t v60 = v16 + 1;
              v63[v16 - 1] = v57;
              int v61 = *v59++;
              xmlChar v57 = v61;
              BOOL v58 = v16 < 0x62;
              if (!v61) {
                break;
              }
              BOOL v31 = v16++ >= 0x62;
            }
            while (!v31);
            long long v55 = &v63[v60 - 1];
          }
          ((void (*)(void))*MEMORY[0x263F8C880])();
          if (v58) {
            *v55++ = 83;
          }
        }
        unsigned char *v55 = 0;
        return xmlStrdup(&cur);
      }
      unint64_t v16 = v37 + 1;
      *xmlChar v33 = 68;
    }
    if (v1 > 0.0 && v16 <= 0x62) {
      v63[v16++ - 1] = 84;
    }
    goto LABEL_72;
  }
  if (v2)
  {
    int v6 = 0;
    double v5 = 0.0;
    goto LABEL_13;
  }

  return xmlStrdup((const xmlChar *)"P0D");
}

BOOL _exsltDateAddDurCalc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)a2;
  if (*(uint64_t *)a2 < 1)
  {
    uint64_t v4 = *(void *)a3;
    if (v3) {
      BOOL v5 = v4 <= (uint64_t)(0x8000000000000000 - v3);
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      return 0;
    }
  }
  else
  {
    uint64_t v4 = *(void *)a3;
    if (*(void *)a3 > (v3 ^ 0x7FFFFFFFFFFFFFFFLL)) {
      return 0;
    }
  }
  uint64_t v6 = v4 + v3;
  *(void *)a1 = v6;
  uint64_t v7 = *(void *)(a2 + 8);
  if (v7 < 1)
  {
    uint64_t v8 = *(void *)(a3 + 8);
    if (v7 && v8 <= (uint64_t)(0x8000000000000000 - v7)) {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a3 + 8);
    if (v8 > (v7 ^ 0x7FFFFFFFFFFFFFFFLL)) {
      return 0;
    }
  }
  uint64_t v9 = v8 + v7;
  *(void *)(a1 + 8) = v9;
  double v10 = *(double *)(a2 + 16) + *(double *)(a3 + 16);
  *(double *)(a1 + 16) = v10;
  if (v10 >= 86400.0)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    double v10 = v10 + -86400.0;
    *(double *)(a1 + 16) = v10;
    *(void *)(a1 + 8) = ++v9;
  }
  if ((v9 & 0x8000000000000000) == 0) {
    return !v9 && v10 <= 0.0 || (v6 & 0x8000000000000000) == 0;
  }
  return v6 <= 0;
}

uint64_t exsltDateCurrent()
{
  uint64_t Date = exsltDateCreateDate(15);
  if (Date)
  {
    memset(&v10, 0, sizeof(v10));
    memset(&v9, 0, sizeof(v9));
    time_t v8 = 0;
    double v1 = getenv("SOURCE_DATE_EPOCH");
    if (!v1 || (v2 = v1, *__error() = 0, time_t v8 = strtol(v2, 0, 10), *__error()) || !gmtime_r(&v8, &v10))
    {
      time_t v8 = time(0);
      localtime_r(&v8, &v10);
    }
    *(void *)(Date + 8) = v10.tm_year + 1900;
    int tm_sec = v10.tm_sec;
    *(_DWORD *)(Date + 16) = *(_DWORD *)(Date + 16) & 0xFFF00000 | (LOBYTE(v10.tm_mon) + 1) & 0xF | (16 * (v10.tm_mday & 0x1F)) & 0x1FF | ((v10.tm_hour & 0x1F) << 9) & 0x3FFF | ((v10.tm_min & 0x3F) << 14);
    *(double *)(Date + 24) = (double)tm_sec;
    gmtime_r(&v8, &v9);
    int v4 = 3600 * v10.tm_hour + 60 * v10.tm_min + v10.tm_sec;
    if (v10.tm_year < v9.tm_year) {
      goto LABEL_8;
    }
    if (v10.tm_year <= v9.tm_year)
    {
      if (v10.tm_mon < v9.tm_mon)
      {
LABEL_8:
        int v5 = v4 - 86400;
LABEL_13:
        *(_WORD *)(Date + 32) = *(_WORD *)(Date + 32) & 0xE000 | (2
                                                                * (((v5
                                                                   - (3600 * v9.tm_hour
                                                                    + 60 * v9.tm_min
                                                                    + v9.tm_sec))
                                                                  / 60) & 0xFFF));
        return Date;
      }
      if (v10.tm_mon <= v9.tm_mon)
      {
        int v7 = v4 + 86400;
        if (v10.tm_mday <= v9.tm_mday) {
          int v7 = 3600 * v10.tm_hour + 60 * v10.tm_min + v10.tm_sec;
        }
        int v5 = v4 - 86400;
        if (v10.tm_mday >= v9.tm_mday) {
          int v5 = v7;
        }
        goto LABEL_13;
      }
    }
    int v5 = v4 + 86400;
    goto LABEL_13;
  }
  return Date;
}

double exsltDateDayInWeek(unsigned __int8 *a1)
{
  if (a1)
  {
    double v1 = (_DWORD *)exsltDateParse(a1);
    if (!v1) {
      return *MEMORY[0x263F8C8D0];
    }
    uint64_t v2 = (uint64_t)v1;
    if ((*v1 & 0xFFFFFFFE) != 0xE)
    {
      ((void (*)(_DWORD *))*MEMORY[0x263F8C880])(v1);
      return *MEMORY[0x263F8C8D0];
    }
  }
  else
  {
    uint64_t v2 = exsltDateCurrent();
    if (!v2) {
      return *MEMORY[0x263F8C8D0];
    }
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((v3 & 3) == 0
    && (0x8F5C28F5C28F5C29 * v3 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70
      ? (BOOL v4 = (*(void *)(v2 + 8) & 0xFLL) == 0)
      : (BOOL v4 = 1),
        v4))
  {
    int v5 = &dayInLeapYearByMonth;
  }
  else
  {
    int v5 = &dayInYearByMonth;
  }
  uint64_t v7 = _exsltDateDayInWeek(v5[(*(_DWORD *)(v2 + 16) & 0xF) - 1] + (((unint64_t)*(unsigned int *)(v2 + 16) >> 4) & 0x1F), v3)+ 1;
  ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v2);
  return (double)v7;
}

uint64_t _exsltDateDayInWeek(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = ((unint64_t)-a2 * (unsigned __int128)0x2492492492492493uLL) >> 64;
  uint64_t v3 = (uint64_t)(a1
               - (-a2 / 0x190uLL
                + ((unint64_t)-a2 >> 2))
               - (-7 * ((v2 + ((unint64_t)(-a2 - v2) >> 1)) >> 2)
                - a2)
               + -a2 / 0x64uLL
               - 2)
     % 7;
  unint64_t v4 = v3 + (v3 < 0 ? 7uLL : 0);
  if (a2 <= 0) {
    return v4;
  }
  else {
    return (uint64_t)(~((a2 - 1) / 0x64uLL)
  }
                   + a1
                   + a2
                   - 7 * (a2 / 7uLL)
                   + ((unint64_t)(a2 - 1) >> 2)
                   + (a2 - 1) / 0x190uLL)
         % 7;
}

double *_exsltDateDifference(unsigned int *a1, uint64_t a2, int a3)
{
  unsigned int v4 = *a1;
  if ((*a1 & 0xFFFFFFF8) != 8) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0xFFFFFFF8) != 8) {
    return 0;
  }
  uint64_t v7 = (uint64_t)a1;
  if (v4 != v5)
  {
    if (v4 >= v5) {
      unsigned int v4 = *(_DWORD *)a2;
    }
    else {
      a1 = (unsigned int *)a2;
    }
    _exsltDateTruncateDate((uint64_t)a1, v4);
  }
  Duration = (double *)exsltDateCreateDuration();
  tm v9 = Duration;
  if (Duration)
  {
    if (*(_DWORD *)v7 == 8)
    {
      if (!a3) {
        goto LABEL_14;
      }
    }
    else if (!a3 && *(_DWORD *)v7 == 12)
    {
LABEL_14:
      uint64_t v10 = *(void *)(v7 + 8);
      if ((unint64_t)(v10 - 0x555555555555555) >= 0xF555555555555557)
      {
        uint64_t v11 = *(void *)(a2 + 8);
        if ((unint64_t)(v11 - 0x555555555555555) >= 0xF555555555555557)
        {
          *(void *)Duration = (*(_DWORD *)(a2 + 16) & 0xF)
                              - (unint64_t)(*(_DWORD *)(v7 + 16) & 0xF)
                              + 12 * (v11 - v10);
          return v9;
        }
      }
      goto LABEL_19;
    }
    if ((unint64_t)(*(void *)(v7 + 8) - 0x2CD38620EB5681) >= 0xFFA658F3BE2952FFLL
      && (unint64_t)(*(void *)(a2 + 8) - 0x2CD38620EB5681) >= 0xFFA658F3BE2952FFLL)
    {
      double v13 = *(double *)(a2 + 24)
          + (double)(60 * ((*(_DWORD *)(a2 + 16) >> 14) & 0x3F) + 3600 * ((*(_DWORD *)(a2 + 16) >> 9) & 0x1F))
          - (*(double *)(v7 + 24)
           + (double)(60 * ((*(_DWORD *)(v7 + 16) >> 14) & 0x3F) + 3600 * ((*(_DWORD *)(v7 + 16) >> 9) & 0x1F)));
      Duration[2] = v13;
      double v14 = v13
          + (double)(60 * ((*(unsigned __int16 *)(v7 + 32) << 19 >> 20) - ((__int16)(8 * *(_WORD *)(a2 + 32)) >> 4)));
      unint64_t v15 = vcvtmd_s64_f64(v14 / 86400.0);
      Duration[2] = v14 - (double)(uint64_t)(86400 * v15);
      uint64_t v16 = _exsltDateCastYMToDays(a2);
      uint64_t v17 = _exsltDateCastYMToDays(v7);
      *((void *)v9 + 1) = v16 - v17;
      *((void *)v9 + 1) = v16
                          - v17
                          + ((*(_DWORD *)(a2 + 16) >> 4) & 0x1F)
                          - ((*(_DWORD *)(v7 + 16) >> 4) & 0x1F)
                          + v15;
      return v9;
    }
LABEL_19:
    ((void (*)(double *))*MEMORY[0x263F8C880])(Duration);
    return 0;
  }
  return v9;
}

uint64_t _exsltDateTruncateDate(uint64_t result, int a2)
{
  if (a2)
  {
    if ((a2 & 2) != 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(result + 16) = *(_DWORD *)(result + 16) & 0xFFFFFE0F | 0x10;
    if ((a2 & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(result + 16) &= 0xFFF001FF;
  *(void *)(result + 24) = 0;
  if ((a2 & 2) == 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((a2 & 4) == 0) {
LABEL_4:
  }
    *(_DWORD *)(result + 16) = *(_DWORD *)(result + 16) & 0xFFFFFFF0 | 1;
LABEL_5:
  *(_DWORD *)uint64_t result = a2;
  return result;
}

uint64_t _exsltDateCastYMToDays(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1 <= 0)
  {
    uint64_t v6 = 365 * v1;
    unint64_t v7 = (unint64_t)-v1 >> 2;
    unint64_t v8 = -v1 / 0x64uLL;
    unint64_t v9 = -v1 / 0x190uLL;
    if ((v1 & 3) == 0
      && ((unint64_t)(0x70A3D70A3D70A3D7 * v1) <= 0xA3D70A3D70A3D70
        ? (BOOL v10 = (*(void *)(a1 + 8) & 0xFLL) == 0)
        : (BOOL v10 = 1),
          v10))
    {
      uint64_t v11 = &dayInLeapYearByMonth;
    }
    else
    {
      uint64_t v11 = &dayInYearByMonth;
    }
    return v6 - v7 - v9 + v8 + v11[(*(_DWORD *)(a1 + 16) & 0xF) - 1] - 366;
  }
  else
  {
    unint64_t v2 = (v1 - 1) / 0x190uLL - (v1 - 1) / 0x64uLL + ((unint64_t)(v1 - 1) >> 2) + 365 * (v1 - 1);
    if ((v1 & 3) == 0
      && (0x8F5C28F5C28F5C29 * v1 <= 0xA3D70A3D70A3D70 ? (BOOL v3 = (*(void *)(a1 + 8) & 0xFLL) == 0) : (BOOL v3 = 1), v3))
    {
      unsigned int v4 = &dayInLeapYearByMonth;
    }
    else
    {
      unsigned int v4 = &dayInYearByMonth;
    }
    return v2 + v4[(*(_DWORD *)(a1 + 16) & 0xF) - 1];
  }
}

double exsltDateSeconds(unsigned __int8 *a1)
{
  uint64_t v1 = (double *)MEMORY[0x263F8C8D0];
  double v2 = *MEMORY[0x263F8C8D0];
  if (a1)
  {
    unsigned int v4 = (_DWORD *)exsltDateParse(a1);
    if (!v4)
    {
      v7.n128_f64[0] = exsltDateParseDuration(a1, v5);
      if (v6)
      {
        if (!*(void *)v6)
        {
          v7.n128_f64[0] = (double)*(uint64_t *)(v6 + 8);
          double v2 = *(double *)(v6 + 16) + v7.n128_f64[0] * 86400.0;
        }
        ((void (*)(uint64_t, __n128))*MEMORY[0x263F8C880])(v6, v7);
      }
      return v2;
    }
  }
  else
  {
    unsigned int v4 = (_DWORD *)exsltDateCurrent();
    if (!v4) {
      return *v1;
    }
  }
  if (*v4 >= 8u)
  {
    uint64_t Date = exsltDateCreateDate(15);
    if (Date)
    {
      uint64_t v9 = Date;
      *(void *)(Date + 8) = 1970;
      *(_DWORD *)(Date + 16) = *(_DWORD *)(Date + 16) & 0xFFFFFE00 | 0x11;
      *(_WORD *)(Date + 32) |= 1u;
      BOOL v10 = _exsltDateDifference((unsigned int *)Date, (uint64_t)v4, 1);
      if (v10)
      {
        double v2 = v10[2] + (double)*((uint64_t *)v10 + 1) * 86400.0;
        ((void (*)(void))*MEMORY[0x263F8C880])();
      }
      ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v9);
    }
  }
  ((void (*)(_DWORD *, __n128))*MEMORY[0x263F8C880])(v4, v5);
  return v2;
}

double exsltDateMonthInYear(unsigned __int8 *a1)
{
  if (a1)
  {
    uint64_t v1 = (_DWORD *)exsltDateParse(a1);
    if (v1)
    {
      if (*v1 <= 0xFu && ((1 << *v1) & 0xD050) != 0) {
        goto LABEL_10;
      }
      ((void (*)(void))*MEMORY[0x263F8C880])();
    }
    return *MEMORY[0x263F8C8D0];
  }
  uint64_t v1 = (_DWORD *)exsltDateCurrent();
  if (!v1) {
    return *MEMORY[0x263F8C8D0];
  }
LABEL_10:
  double v3 = (double)(v1[4] & 0xF);
  ((void (*)(void))*MEMORY[0x263F8C880])();
  return v3;
}

void exsltDynRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"evaluate", (const xmlChar *)"http://exslt.org/dynamic", (xmlXPathFunction)exsltDynEvaluateFunction);

  xsltRegisterExtModuleFunction((const xmlChar *)"map", (const xmlChar *)"http://exslt.org/dynamic", (xmlXPathFunction)exsltDynMapFunction);
}

xmlXPathParserContext *exsltDynEvaluateFunction(xmlXPathParserContext *result, int a2)
{
  if (!result) {
    return result;
  }
  double v3 = result;
  if (a2 != 1)
  {
    xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(result);
    xsltPrintErrorContext(TransformContext, 0, 0);
    uint64_t result = (xmlXPathParserContext *)((uint64_t (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "dyn:evalute() : invalid number of args %d\n", a2);
    v3->error = 12;
    return result;
  }
  unsigned int v4 = xmlXPathPopString(result);
  if (v4)
  {
    __n128 v5 = v4;
    if (xmlStrlen(v4))
    {
      uint64_t v6 = xmlXPathEval(v5, v3->context);
      if (!v6)
      {
        ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "dyn:evaluate() : unable to evaluate expression '%s'\n", (const char *)v5);
        uint64_t v6 = xmlXPathNewNodeSet(0);
      }
      valuePush(v3, v6);
      __n128 v7 = (uint64_t (*)(const xmlChar *))*MEMORY[0x263F8C880];
      return (xmlXPathParserContext *)v7(v5);
    }
    ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v5);
  }
  uint64_t v9 = xmlXPathNewNodeSet(0);

  return (xmlXPathParserContext *)valuePush(v3, v9);
}

void exsltDynMapFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    double v3 = xmlXPathPopString(ctxt);
    if (ctxt->error)
    {
      xmlXPathObjectPtr v4 = 0;
LABEL_11:
      if (v3) {
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v3);
      }
      valuePush(ctxt, v4);
      return;
    }
    xmlNodeSetPtr v5 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error)
    {
      xmlXPathObjectPtr v4 = 0;
      goto LABEL_9;
    }
    xmlXPathObjectPtr v4 = xmlXPathNewNodeSet(0);
    if (!v4)
    {
      ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltDynMapFunction: ret == NULL\n");
      goto LABEL_9;
    }
    xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(ctxt);
    if (!TransformContext)
    {
      unint64_t v29 = xsltXPathGetTransformContext(ctxt);
      xsltTransformError(v29, 0, 0, "dyn:map : internal error tctxt == NULL\n");
      goto LABEL_9;
    }
    if (!v3 || (__n128 v7 = TransformContext, !xmlStrlen(v3)) || (v8 = xmlXPathCtxtCompile(v7->xpathCtxt, v3)) == 0)
    {
LABEL_9:
      if (v5) {
        xmlXPathFreeNodeSet(v5);
      }
      goto LABEL_11;
    }
    uint64_t v9 = v8;
    xmlXPathContextPtr context = ctxt->context;
    doc = context->doc;
    node = context->node;
    int contextSize = context->contextSize;
    uint64_t proximityPosition = context->proximityPosition;
    RVT = xsltCreateRVT(v7);
    if (!RVT)
    {
      xsltTransformError(v7, 0, 0, "dyn:map : internal error container == NULL\n");
      goto LABEL_55;
    }
    parent = (xmlNode *)RVT;
    xsltRegisterLocalRVT(v7, RVT);
    if (v5 && v5->nodeNr >= 1)
    {
      xmlXPathNodeSetSort(v5);
      int nodeNr = v5->nodeNr;
      xmlXPathContextPtr v15 = ctxt->context;
      *(void *)&v15->int contextSize = v5->nodeNr;
      if (nodeNr < 1)
      {
LABEL_51:
        v15->doc = doc;
        v15->node = node;
        v15->int contextSize = contextSize;
        v15->uint64_t proximityPosition = proximityPosition;
LABEL_55:
        xmlXPathFreeCompExpr(v9);
        goto LABEL_9;
      }
      uint64_t v16 = 0;
      int v30 = contextSize;
      do
      {
        xmlNodePtr v17 = v5->nodeTab[v16];
        xmlXPathContextPtr v18 = ctxt->context;
        ++v18->proximityPosition;
        v18->node = v17;
        if (v17->type != XML_NAMESPACE_DECL
          || (xmlNodePtr v17 = (xmlNodePtr)v17->_private) != 0 && v17->type == XML_ELEMENT_NODE)
        {
          v18->doc = v17->doc;
          xmlXPathObjectPtr v19 = xmlXPathCompiledEval(v9, v18);
          if (v19)
          {
            int v20 = v19;
            switch(v19->type)
            {
              case XPATH_NODESET:
                p_int nodeNr = &v19->nodesetval->nodeNr;
                if (p_nodeNr && *p_nodeNr >= 1)
                {
                  uint64_t v22 = 0;
                  do
                  {
                    xmlXPathNodeSetAdd(v4->nodesetval, *(xmlNodePtr *)(*((void *)p_nodeNr + 1) + 8 * v22++));
                    p_int nodeNr = &v20->nodesetval->nodeNr;
                  }
                  while (v22 < *p_nodeNr);
                }
                break;
              case XPATH_BOOLEAN:
                if (v19->BOOLval) {
                  stringval = (const xmlChar *)"true";
                }
                else {
                  stringval = (const xmlChar *)&unk_228A36E0A;
                }
                unsigned int v24 = parent;
                uint64_t v25 = "BOOLean";
                goto LABEL_46;
              case XPATH_NUMBER:
                uint64_t v26 = proximityPosition;
                BOOL v27 = xmlXPathCastNumberToString(v19->floatval);
                xmlNodePtr v28 = xmlNewTextChild(parent, 0, (const xmlChar *)"number", v27);
                if (v27) {
                  ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v27);
                }
                uint64_t proximityPosition = v26;
                int contextSize = v30;
                if (!v28) {
                  break;
                }
                goto LABEL_47;
              case XPATH_STRING:
                stringval = v19->stringval;
                unsigned int v24 = parent;
                uint64_t v25 = "string";
LABEL_46:
                xmlNodePtr v28 = xmlNewTextChild(v24, 0, (const xmlChar *)v25, stringval);
                if (v28)
                {
LABEL_47:
                  v28->ns = xmlNewNs(v28, (const xmlChar *)"http://exslt.org/common", (const xmlChar *)"exsl");
                  xmlXPathNodeSetAddUnique(v4->nodesetval, v28);
                }
                break;
              default:
                break;
            }
            xmlXPathFreeObject(v20);
          }
        }
        else
        {
          ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "Internal error in exsltDynMapFunction: Cannot retrieve the doc of a namespace node.\n");
        }
        ++v16;
      }
      while (v16 < v5->nodeNr);
    }
    xmlXPathContextPtr v15 = ctxt->context;
    goto LABEL_51;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/dynamic.c", 105, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

void exsltRegisterAll(void)
{
  xsltInitGlobals();
  exsltCommonRegister();
  exsltMathRegister();
  exsltSetsRegister();
  exsltFuncRegister();
  exsltStrRegister();
  exsltDateRegister();
  exsltSaxonRegister();

  exsltDynRegister();
}

void exsltFuncRegister(void)
{
  xsltRegisterExtModuleFull((const xmlChar *)"http://exslt.org/functions", (xsltExtInitFunction)exsltFuncInit, (xsltExtShutdownFunction)exsltFuncShutdown, (xsltStyleExtInitFunction)exsltFuncStyleInit, (xsltStyleExtShutdownFunction)exsltFuncStyleShutdown);
  xsltRegisterExtModuleTopLevel((const xmlChar *)"function", (const xmlChar *)"http://exslt.org/functions", (xsltTopLevelFunction)exsltFuncFunctionComp);

  xsltRegisterExtModuleElement((const xmlChar *)"result", (const xmlChar *)"http://exslt.org/functions", (xsltPreComputeFunction)exsltFuncResultComp, (xsltTransformFunction)exsltFuncResultElem);
}

void *exsltFuncInit(xsltStylesheetPtr *a1, const xmlChar *a2)
{
  uint64_t v4 = ((uint64_t (*)(uint64_t))*MEMORY[0x263F8C8B0])(32);
  xmlNodeSetPtr v5 = (void *)v4;
  if (v4)
  {
    *(_OWORD *)uint64_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(void *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 24) = 0;
    ExtData = (xmlHashTable *)xsltStyleGetExtData(*a1, a2);
    v12[1] = ExtData;
    void *v5 = ExtData;
    xmlHashScanFull(ExtData, (xmlHashScannerFull)exsltFuncRegisterFunc, a1);
    __n128 v7 = *a1;
    v12[0] = a1;
    xsltStylesheetPtr Import = xsltNextImport(v7);
    if (Import)
    {
      uint64_t v9 = Import;
      do
      {
        ExtInfo = xsltGetExtInfo(v9, a2);
        if (ExtInfo) {
          xmlHashScanFull(ExtInfo, (xmlHashScannerFull)exsltFuncRegisterImportFunc, v12);
        }
        uint64_t v9 = xsltNextImport(v9);
      }
      while (v9);
    }
  }
  else
  {
    ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncInit: not enough memory\n");
  }
  return v5;
}

uint64_t exsltFuncShutdown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(xmlXPathObject **)(a3 + 8);
  if (v4) {
    xmlXPathFreeObject(v4);
  }
  xmlNodeSetPtr v5 = (uint64_t (*)(uint64_t))*MEMORY[0x263F8C880];

  return v5(a3);
}

xmlHashTablePtr exsltFuncStyleInit()
{
  return xmlHashCreate(1);
}

void exsltFuncStyleShutdown(int a1, int a2, xmlHashTablePtr table)
{
}

xsltStylesheet *exsltFuncFunctionComp(xsltStylesheet *result, xmlNode *node)
{
  if (!result || !node || node->type != XML_ELEMENT_NODE) {
    return result;
  }
  double v3 = result;
  prefix = 0;
  Prop = xmlGetProp(node, (const xmlChar *)"name");
  xmlNodeSetPtr v5 = xmlSplitQName2(Prop, &prefix);
  uint64_t v6 = (uint64_t (**)(xmlChar *))MEMORY[0x263F8C880];
  ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Prop);
  if (!v5 || !prefix)
  {
    uint64_t result = (xsltStylesheet *)((uint64_t (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:function: not a QName\n");
    if (!v5) {
      return result;
    }
    return (xsltStylesheet *)(*v6)(v5);
  }
  xmlNsPtr v7 = xmlSearchNs(node->doc, node, prefix);
  if (!v7)
  {
    ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:function: undeclared prefix %s\n", (const char *)prefix);
    (*v6)(v5);
    return (xsltStylesheet *)(*v6)(prefix);
  }
  xmlNsPtr v8 = v7;
  (*v6)(prefix);
  xsltParseTemplateContent(v3, node);
  uint64_t v9 = (xmlChar *)exsltFuncNewFunctionData();
  if (!v9) {
    return (xsltStylesheet *)(*v6)(v5);
  }
  BOOL v10 = v9;
  children = node->children;
  for (*((void *)v9 + 1) = children; children; ++*(_DWORD *)v10)
  {
    if (children->type != XML_ELEMENT_NODE) {
      break;
    }
    ns = children->ns;
    if (!ns) {
      break;
    }
    if (!xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")) {
      break;
    }
    if (!xmlStrEqual(*(const xmlChar **)(*((void *)v10 + 1) + 16), (const xmlChar *)"param")) {
      break;
    }
    children = *(_xmlNode **)(*((void *)v10 + 1) + 48);
    *((void *)v10 + 1) = children;
  }
  ExtData = (xmlHashTable *)xsltStyleGetExtData(v3, (const xmlChar *)"http://exslt.org/functions");
  if (ExtData)
  {
    if (xmlHashAddEntry2(ExtData, v8->href, v5, v10) < 0)
    {
      xsltTransformError(0, v3, node, "Failed to register function {%s}%s\n", (const char *)v8->href, (const char *)v5);
      ++v3->errors;
      (*v6)(v10);
    }
    else
    {
      ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8E8])(*MEMORY[0x263F8C8F0], "exsltFuncFunctionComp: register {%s}%s\n", (const char *)v8->href, (const char *)v5);
    }
    return (xsltStylesheet *)(*v6)(v5);
  }
  ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncFunctionComp: no stylesheet data\n");
  (*v6)(v5);
  return (xsltStylesheet *)(*v6)(v10);
}

uint64_t exsltFuncResultComp(xsltStylesheet *a1, uint64_t a2, void (__cdecl *a3)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr))
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      uint64_t v7 = *(void *)(a2 + 48);
      if (v7)
      {
        while (1)
        {
          if (*(_DWORD *)(v7 + 8) == 1)
          {
            uint64_t v8 = *(void *)(v7 + 72);
            if (!v8
              || !xmlStrEqual(*(const xmlChar **)(v8 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
              || !xmlStrEqual(*(const xmlChar **)(v7 + 16), (const xmlChar *)"fallback"))
            {
              break;
            }
          }
          uint64_t v7 = *(void *)(v7 + 48);
          if (!v7) {
            goto LABEL_10;
          }
        }
        ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncResultElem: only xsl:fallback is allowed to follow func:result\n");
        goto LABEL_34;
      }
LABEL_10:
      uint64_t v9 = *(void *)(a2 + 40);
      if (v9)
      {
        while (1)
        {
          if (*(_DWORD *)(v9 + 8) == 1)
          {
            uint64_t v10 = *(void *)(v9 + 72);
            if (v10)
            {
              if (xmlStrEqual(*(const xmlChar **)(v10 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                && xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"stylesheet"))
              {
                break;
              }
            }
          }
          uint64_t v11 = *(void *)(v9 + 72);
          if (v11 && xmlStrEqual(*(const xmlChar **)(v11 + 16), (const xmlChar *)"http://exslt.org/functions"))
          {
            if (xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"function")) {
              goto LABEL_25;
            }
            if (xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"result"))
            {
              ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:result element not allowed within another func:result element\n");
              goto LABEL_34;
            }
          }
          if (*(_DWORD *)(v9 + 8) == 1)
          {
            uint64_t v12 = *(void *)(v9 + 72);
            if (v12)
            {
              if (xmlStrEqual(*(const xmlChar **)(v12 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                && (xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"variable")
                 || xmlStrEqual(*(const xmlChar **)(v9 + 16), (const xmlChar *)"param")))
              {
                ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:result element not allowed within a variable binding element\n");
                goto LABEL_34;
              }
            }
          }
          uint64_t v9 = *(void *)(v9 + 40);
          if (!v9) {
            goto LABEL_25;
          }
        }
        ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:result element not a descendant of a func:function\n");
LABEL_34:
        uint64_t v3 = 0;
LABEL_36:
        ++a1->errors;
        return v3;
      }
LABEL_25:
      uint64_t v13 = ((uint64_t (*)(uint64_t))*MEMORY[0x263F8C8B0])(64);
      uint64_t v3 = v13;
      if (!v13)
      {
        xsltPrintErrorContext(0, 0, 0);
        ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncResultComp : malloc failed\n");
        goto LABEL_36;
      }
      *(_OWORD *)(v13 + 32) = 0u;
      *(_OWORD *)(v13 + 48) = 0u;
      *(_OWORD *)uint64_t v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
      xsltInitElemPreComp((xsltElemPreCompPtr)v13, a1, (xmlNodePtr)a2, a3, (xsltElemPreCompDeallocator)exsltFreeFuncResultPreComp);
      *(void *)(v3 + 40) = 0;
      NsProp = xmlGetNsProp((const xmlNode *)a2, (const xmlChar *)"select", 0);
      if (NsProp)
      {
        xmlXPathContextPtr v15 = NsProp;
        *(void *)(v3 + 40) = xsltXPathCompileFlags(a1, NsProp, 0);
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v15);
      }
      NsList = xmlGetNsList(*(const xmlDoc **)(a2 + 64), (const xmlNode *)a2);
      *(void *)(v3 + 48) = NsList;
      if (NsList)
      {
        int v17 = -1;
        do
        {
          uint64_t v18 = (uint64_t)*NsList++;
          ++v17;
        }
        while (v18);
        *(_DWORD *)(v3 + 56) = v17;
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t exsltFuncResultElem(xsltTransformContext *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ExtData = (void **)xsltGetExtData(a1, (const xmlChar *)"http://exslt.org/functions");
  if (ExtData)
  {
    uint64_t v8 = ExtData;
    if (ExtData[1])
    {
      uint64_t result = ((uint64_t (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:result already instanciated\n");
LABEL_4:
      *((_DWORD *)v8 + 6) = 1;
      return result;
    }
    a1->contextVariable = ExtData[2];
    uint64_t v13 = *(xmlXPathCompExpr **)(a4 + 40);
    uint64_t v14 = *(void *)(a3 + 24);
    if (!v13)
    {
      if (v14)
      {
        RVT = xsltCreateRVT(a1);
        if (!RVT)
        {
          uint64_t result = ((uint64_t (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncResultElem: out of memory\n");
          goto LABEL_4;
        }
        uint64_t v16 = RVT;
        xsltRegisterLocalRVT(a1, RVT);
        if (linkedOnOrAfterFall2023OSVersions()) {
          v16->compression = 2;
        }
        else {
          v16->psvi = (void *)2;
        }
        insert = a1->insert;
        a1->insert = (xmlNodePtr)v16;
        xsltApplyOneTemplate(a1, a1->node, *(xmlNodePtr *)(a3 + 24), 0, 0);
        a1->insert = insert;
        uint64_t result = (uint64_t)xmlXPathNewValueTree((xmlNodePtr)v16);
        uint64_t v23 = result;
        if (result)
        {
          *(_DWORD *)(result + 16) = 0;
        }
        else
        {
          uint64_t result = ((uint64_t (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncResultElem: ret == NULL\n");
          *((_DWORD *)v8 + 6) = 1;
        }
      }
      else
      {
        uint64_t result = (uint64_t)xmlXPathNewCString((const char *)&unk_228A36E0A);
        uint64_t v23 = result;
      }
      goto LABEL_25;
    }
    if (v14)
    {
      uint64_t result = ((uint64_t (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "func:result content must be empty if the function has a select attribute\n");
      goto LABEL_4;
    }
    xpathCtxt = a1->xpathCtxt;
    namespaces = xpathCtxt->namespaces;
    int nsNr = xpathCtxt->nsNr;
    xmlNodePtr node = xpathCtxt->node;
    xpathCtxt->namespaces = *(xmlNsPtr **)(a4 + 48);
    xpathCtxt->int nsNr = *(_DWORD *)(a4 + 56);
    xpathCtxt->xmlNodePtr node = a1->node;
    uint64_t v21 = xmlXPathCompiledEval(v13, xpathCtxt);
    xmlXPathContextPtr v22 = a1->xpathCtxt;
    v22->xmlNodePtr node = node;
    v22->int nsNr = nsNr;
    v22->namespaces = namespaces;
    if (v21)
    {
      uint64_t v23 = (uint64_t)v21;
      uint64_t result = xsltFlagRVTs(a1, v21, 2);
LABEL_25:
      v8[1] = (void *)v23;
      return result;
    }
    uint64_t v10 = (uint64_t (*)(uint64_t, const char *))*MEMORY[0x263F8C8F8];
    uint64_t v11 = *MEMORY[0x263F8C900];
    uint64_t v12 = "exsltFuncResultElem: ret == NULL\n";
  }
  else
  {
    uint64_t v10 = (uint64_t (*)(uint64_t, const char *))*MEMORY[0x263F8C8F8];
    uint64_t v11 = *MEMORY[0x263F8C900];
    uint64_t v12 = "exsltFuncReturnElem: data == NULL\n";
  }

  return v10(v11, v12);
}

uint64_t exsltFuncRegisterFunc(uint64_t result, xsltTransformContext *a2, const char *a3, const char *a4)
{
  if (result && a2 && a3 && a4)
  {
    ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8E8])(*MEMORY[0x263F8C8F0], "exsltFuncRegisterFunc: register {%s}%s\n", a3, a4);
    return xsltRegisterExtFunction(a2, (const xmlChar *)a4, (const xmlChar *)a3, (xmlXPathFunction)exsltFuncFunctionFunction);
  }
  return result;
}

xmlHashTable *exsltFuncRegisterImportFunc(xmlHashTable *result, uint64_t a2, xmlChar *name, xmlChar *name2)
{
  if (result)
  {
    if (a2)
    {
      if (name)
      {
        if (name2)
        {
          if (*(void *)a2)
          {
            uint64_t v7 = result;
            uint64_t result = *(xmlHashTable **)(a2 + 8);
            if (result)
            {
              uint64_t result = (xmlHashTable *)xmlHashLookup2(result, name, name2);
              if (!result)
              {
                uint64_t result = (xmlHashTable *)exsltFuncNewFunctionData();
                if (result)
                {
                  *(_OWORD *)uint64_t result = *(_OWORD *)v7;
                  if (xmlHashAddEntry2(*(xmlHashTablePtr *)(a2 + 8), name, name2, result) < 0)
                  {
                    return (xmlHashTable *)((uint64_t (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "Failed to register function {%s}%s\n", (const char *)name, (const char *)name2);
                  }
                  else
                  {
                    ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8E8])(*MEMORY[0x263F8C8F0], "exsltFuncRegisterImportFunc: register {%s}%s\n", (const char *)name, (const char *)name2);
                    uint64_t v8 = *(xsltTransformContext **)a2;
                    return (xmlHashTable *)xsltRegisterExtFunction(v8, name2, name, (xmlXPathFunction)exsltFuncFunctionFunction);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void exsltFuncFunctionFunction(xmlXPathParserContext *a1, int a2)
{
  xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(a1);
  ExtData = xsltGetExtData(TransformContext, (const xmlChar *)"http://exslt.org/functions");
  uint64_t v6 = *(xmlHashTable **)ExtData;
  uint64_t v7 = *((void *)ExtData + 1);
  *((void *)ExtData + 1) = 0;
  uint64_t v8 = (int *)xmlHashLookup2(v6, a1->context->functionURI, a1->context->function);
  if (!v8)
  {
    ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "{%s}%s: not found\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
    int v10 = 9;
    goto LABEL_5;
  }
  int v9 = *v8;
  if (*v8 < a2)
  {
    ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "{%s}%s: called with too many arguments\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
    int v10 = 12;
LABEL_5:
    a1->error = v10;
    return;
  }
  uint64_t v11 = *((void *)v8 + 1);
  if (v11 && (uint64_t v12 = *(xmlNode **)(v11 + 56)) != 0)
  {
    char v13 = 0;
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = (void (*)(uint64_t, const char *))*MEMORY[0x263F8C8F8];
      uint64_t v15 = *MEMORY[0x263F8C900];
      v14(v15, "exsltFuncFunctionFunction: nargs != 0 and param == NULL\n");
      return;
    }
    uint64_t v12 = 0;
    char v13 = 1;
  }
  int depth = TransformContext->depth;
  if (depth >= TransformContext->maxTemplateDepth)
  {
    xsltTransformError(TransformContext, 0, 0, "exsltFuncFunctionFunction: Potentially infinite recursion detected in function {%s}%s.\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
    TransformContext->state = XSLT_STATE_STOPPED;
  }
  else
  {
    TransformContext->int depth = depth + 1;
    xmlNodePtr node = TransformContext->xpathCtxt->node;
    int varsBase = TransformContext->varsBase;
    TransformContext->int varsBase = TransformContext->varsNr;
    uint64_t v39 = v7;
    long long v40 = v8;
    int v38 = node;
    int v37 = varsBase;
    if (v13)
    {
      xmlXPathObjectPtr v19 = 0;
    }
    else
    {
      if (a2 < 1)
      {
        int v20 = 0;
      }
      else
      {
        int v20 = 0;
        uint64_t v21 = (uint64_t (**)(uint64_t))MEMORY[0x263F8C8B0];
        int v22 = a2;
        do
        {
          uint64_t v23 = v20;
          int v20 = (void *)(*v21)(16);
          *int v20 = v23;
          v20[1] = valuePop(a1);
          --v22;
        }
        while (v22);
        int v9 = *v40;
      }
      if (v9 < 1)
      {
        int v25 = 1;
      }
      else
      {
        int v24 = 0;
        int v25 = v9 + 1;
        while (1)
        {
          prev = v12->prev;
          if (!prev) {
            break;
          }
          ++v24;
          uint64_t v12 = v12->prev;
          if (v9 == v24)
          {
            uint64_t v12 = prev;
            goto LABEL_30;
          }
        }
        int v25 = v24 + 1;
      }
LABEL_30:
      BOOL v27 = 0;
      int v28 = v9 - a2;
      do
      {
        xsltStackElemPtr v29 = xsltParseStylesheetCallerParam(TransformContext, v12);
        xmlXPathObjectPtr v19 = v29;
        if (v25 > v28)
        {
          v29->computed = 1;
          xmlXPathObjectPtr value = v29->value;
          if (value) {
            xmlXPathFreeObject(value);
          }
          BOOL v31 = (void *)*v20;
          v19->xmlXPathObjectPtr value = (xmlXPathObjectPtr)v20[1];
          ((void (*)(void *))*MEMORY[0x263F8C880])(v20);
          int v20 = v31;
        }
        xsltLocalVariablePush(TransformContext, v19, -1);
        v19->next = v27;
        uint64_t v12 = v12->next;
        BOOL v27 = v19;
        BOOL v32 = __OFSUB__(v25--, 1);
      }
      while (!((v25 < 0) ^ v32 | (v25 == 0)));
    }
    xmlNodePtr v33 = xmlNewDocNode(TransformContext->output, 0, (const xmlChar *)"fake", 0);
    insert = TransformContext->insert;
    uint64_t v35 = *((void *)ExtData + 2);
    *((void *)ExtData + 2) = TransformContext->contextVariable;
    TransformContext->insert = v33;
    TransformContext->contextVariable = 0;
    xsltApplyOneTemplate(TransformContext, TransformContext->node, *((xmlNodePtr *)v40 + 1), 0, 0);
    xsltLocalVariablePop(TransformContext, TransformContext->varsBase, -2);
    TransformContext->insert = insert;
    TransformContext->contextVariable = (void *)*((void *)ExtData + 2);
    TransformContext->int varsBase = v37;
    *((void *)ExtData + 2) = v35;
    if (v19) {
      xsltFreeStackElemList(v19);
    }
    TransformContext->xpathCtxt->xmlNodePtr node = v38;
    if (!*((_DWORD *)ExtData + 6))
    {
      long long v36 = (xmlXPathObject *)*((void *)ExtData + 1);
      if (v36) {
        xsltFlagRVTs(TransformContext, *((xmlXPathObjectPtr *)ExtData + 1), 1);
      }
      else {
        long long v36 = xmlXPathNewCString((const char *)&unk_228A36E0A);
      }
      *((void *)ExtData + 1) = v39;
      if (v33->children)
      {
        xmlDebugDumpNode((FILE *)*MEMORY[0x263EF8348], v33, 1);
        ((void (*)(void, const char *, ...))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "{%s}%s: cannot write to result tree while executing a function\n", (const char *)a1->context->functionURI, (const char *)a1->context->function);
        xmlFreeNode(v33);
        xmlXPathFreeObject(v36);
      }
      else
      {
        xmlFreeNode(v33);
        valuePush(a1, v36);
      }
    }
    --TransformContext->depth;
  }
}

void *exsltFuncNewFunctionData()
{
  v0 = (void *)((uint64_t (*)(uint64_t))*MEMORY[0x263F8C8B0])(16);
  uint64_t v1 = v0;
  if (v0)
  {
    void *v0 = 0;
    v0[1] = 0;
    *(_DWORD *)v0 = 0;
  }
  else
  {
    ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltFuncNewFunctionData: not enough memory\n");
  }
  return v1;
}

uint64_t exsltFuncFreeDataEntry()
{
  return ((uint64_t (*)(void))*MEMORY[0x263F8C880])();
}

uint64_t exsltFreeFuncResultPreComp(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = *(xmlXPathCompExpr **)(result + 40);
    if (v2) {
      xmlXPathFreeCompExpr(v2);
    }
    uint64_t v3 = (uint64_t (**)(uint64_t))MEMORY[0x263F8C880];
    if (*(void *)(v1 + 48)) {
      ((void (*)(void))*MEMORY[0x263F8C880])();
    }
    uint64_t v4 = *v3;
    return v4(v1);
  }
  return result;
}

void exsltMathRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"min", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMinFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"max", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMaxFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"highest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathHighestFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"lowest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLowestFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"constant", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathConstantFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"random", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathRandomFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"abs", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAbsFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"sqrt", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSqrtFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"power", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathPowerFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"log", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLogFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"sin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSinFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"cos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathCosFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"tan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathTanFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"asin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAsinFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"acos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAcosFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"atan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtanFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"atan2", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtan2Function);

  xsltRegisterExtModuleFunction((const xmlChar *)"exp", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathExpFunction);
}

xmlNodeSetPtr exsltMathMinFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 != 1)
  {
    xmlNodeSetPtr result = (xmlNodeSetPtr)((uint64_t (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "math:min: invalid number of arguments\n");
    ctxt->error = 12;
    return result;
  }
  xmlXPathObjectPtr value = ctxt->value;
  if (value && value->BOOLval)
  {
    user = (xmlNode *)value->user;
    value->BOOLval = 0;
    value->user = 0;
  }
  else
  {
    user = 0;
  }
  xmlNodeSetPtr result = xmlXPathPopNodeSet(ctxt);
  if (!ctxt->error)
  {
    uint64_t v6 = result;
    if (result)
    {
      if (result->nodeNr)
      {
        double v7 = xmlXPathCastNodeToNumber(*result->nodeTab);
        if (!xmlXPathIsNaN(v7))
        {
          if (v6->nodeNr < 2) {
            goto LABEL_12;
          }
          uint64_t v9 = 1;
          while (1)
          {
            double v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
            if (xmlXPathIsNaN(v10)) {
              break;
            }
            if (v10 < v7) {
              double v7 = v10;
            }
            if (++v9 >= v6->nodeNr) {
              goto LABEL_12;
            }
          }
        }
      }
    }
    double v7 = *MEMORY[0x263F8C8D0];
LABEL_12:
    xmlXPathFreeNodeSet(v6);
    if (user) {
      xmlFreeNodeList(user);
    }
    uint64_t v8 = xmlXPathNewFloat(v7);
    return (xmlNodeSetPtr)valuePush(ctxt, v8);
  }
  return result;
}

void exsltMathMaxFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    xmlXPathObjectPtr value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    xmlNodeSetPtr v5 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error) {
      return;
    }
    uint64_t v6 = v5;
    if (v5)
    {
      if (v5->nodeNr)
      {
        double v7 = xmlXPathCastNodeToNumber(*v5->nodeTab);
        if (!xmlXPathIsNaN(v7))
        {
          if (v6->nodeNr < 2) {
            goto LABEL_14;
          }
          uint64_t v9 = 1;
          while (1)
          {
            double v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
            if (xmlXPathIsNaN(v10)) {
              break;
            }
            if (v10 > v7) {
              double v7 = v10;
            }
            if (++v9 >= v6->nodeNr) {
              goto LABEL_14;
            }
          }
        }
      }
    }
    double v7 = *MEMORY[0x263F8C8D0];
LABEL_14:
    xmlXPathFreeNodeSet(v6);
    if (user) {
      xmlFreeNodeList(user);
    }
    uint64_t v8 = xmlXPathNewFloat(v7);
    valuePush(ctxt, v8);
    return;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 136, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

void exsltMathHighestFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    xmlXPathObjectPtr value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    xmlNodeSetPtr v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      uint64_t v6 = v5;
      xmlNodeSetPtr v7 = xmlXPathNodeSetCreate(0);
      if (v6)
      {
        if (v6->nodeNr)
        {
          double v8 = xmlXPathCastNodeToNumber(*v6->nodeTab);
          if (!xmlXPathIsNaN(v8))
          {
            xmlXPathNodeSetAddUnique(v7, *v6->nodeTab);
            if (v6->nodeNr >= 2)
            {
              uint64_t v9 = 1;
              while (1)
              {
                double v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
                if (xmlXPathIsNaN(v10)) {
                  break;
                }
                if (v10 >= v8)
                {
                  if (v10 <= v8)
                  {
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                  }
                  else
                  {
                    uint64_t nodeNr = v7->nodeNr;
                    if ((int)nodeNr >= 1)
                    {
                      unint64_t v12 = nodeNr + 1;
                      do
                        v7->nodeTab[(v12-- - 2)] = 0;
                      while (v12 > 1);
                      v7->uint64_t nodeNr = 0;
                    }
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                    double v8 = v10;
                  }
                }
                if (++v9 >= v6->nodeNr) {
                  goto LABEL_30;
                }
              }
              uint64_t v13 = v7->nodeNr;
              if ((int)v13 >= 1)
              {
                unint64_t v14 = v13 + 1;
                do
                  v7->nodeTab[(v14-- - 2)] = 0;
                while (v14 > 1);
                v7->uint64_t nodeNr = 0;
              }
            }
          }
        }
      }
LABEL_30:
      xmlXPathFreeNodeSet(v6);
      if (user) {
        xmlFreeNodeList(user);
      }
      uint64_t v15 = xmlXPathWrapNodeSet(v7);
      valuePush(ctxt, v15);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 216, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathLowestFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    xmlXPathObjectPtr value = ctxt->value;
    if (value && value->BOOLval)
    {
      user = (xmlNode *)value->user;
      value->BOOLval = 0;
      value->user = 0;
    }
    else
    {
      user = 0;
    }
    xmlNodeSetPtr v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      uint64_t v6 = v5;
      xmlNodeSetPtr v7 = xmlXPathNodeSetCreate(0);
      if (v6)
      {
        if (v6->nodeNr)
        {
          double v8 = xmlXPathCastNodeToNumber(*v6->nodeTab);
          if (!xmlXPathIsNaN(v8))
          {
            xmlXPathNodeSetAddUnique(v7, *v6->nodeTab);
            if (v6->nodeNr >= 2)
            {
              uint64_t v9 = 1;
              while (1)
              {
                double v10 = xmlXPathCastNodeToNumber(v6->nodeTab[v9]);
                if (xmlXPathIsNaN(v10)) {
                  break;
                }
                if (v10 <= v8)
                {
                  if (v10 < v8)
                  {
                    uint64_t nodeNr = v7->nodeNr;
                    if ((int)nodeNr >= 1)
                    {
                      unint64_t v12 = nodeNr + 1;
                      do
                        v7->nodeTab[(v12-- - 2)] = 0;
                      while (v12 > 1);
                      v7->uint64_t nodeNr = 0;
                    }
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                    double v8 = v10;
                  }
                  else
                  {
                    xmlXPathNodeSetAddUnique(v7, v6->nodeTab[v9]);
                  }
                }
                if (++v9 >= v6->nodeNr) {
                  goto LABEL_30;
                }
              }
              uint64_t v13 = v7->nodeNr;
              if ((int)v13 >= 1)
              {
                unint64_t v14 = v13 + 1;
                do
                  v7->nodeTab[(v14-- - 2)] = 0;
                while (v14 > 1);
                v7->uint64_t nodeNr = 0;
              }
            }
          }
        }
      }
LABEL_30:
      xmlXPathFreeNodeSet(v6);
      if (user) {
        xmlFreeNodeList(user);
      }
      uint64_t v15 = xmlXPathWrapNodeSet(v7);
      valuePush(ctxt, v15);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 297, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathConstantFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (ctxt->error) {
      return;
    }
    double v4 = v3;
    xmlNodeSetPtr v5 = xmlXPathPopString(ctxt);
    if (ctxt->error) {
      return;
    }
    uint64_t v6 = v5;
    if (!v5)
    {
      double v10 = *MEMORY[0x263F8C8D0];
LABEL_32:
      uint64_t v15 = xmlXPathNewFloat(v10);
      valuePush(ctxt, v15);
      return;
    }
    int IsNaN = xmlXPathIsNaN(v4);
    double v8 = (void (**)(const xmlChar *))MEMORY[0x263F8C880];
    if (v4 < 1.0 || IsNaN) {
      goto LABEL_30;
    }
    if (xmlStrEqual(v6, (const xmlChar *)"PI"))
    {
      uint64_t v9 = "3.1415926535897932384626433832795028841971693993751";
    }
    else if (xmlStrEqual(v6, (const xmlChar *)"E"))
    {
      uint64_t v9 = "2.71828182845904523536028747135266249775724709369996";
    }
    else if (xmlStrEqual(v6, (const xmlChar *)"SQRRT2"))
    {
      uint64_t v9 = "1.41421356237309504880168872420969807856967187537694";
    }
    else if (xmlStrEqual(v6, (const xmlChar *)"LN2"))
    {
      uint64_t v9 = "0.69314718055994530941723212145817656807550013436025";
    }
    else if (xmlStrEqual(v6, (const xmlChar *)"LN10"))
    {
      uint64_t v9 = "2.30258509299404568402";
    }
    else if (xmlStrEqual(v6, (const xmlChar *)"LOG2E"))
    {
      uint64_t v9 = "1.4426950408889634074";
    }
    else
    {
      if (!xmlStrEqual(v6, (const xmlChar *)"SQRT1_2")) {
        goto LABEL_30;
      }
      uint64_t v9 = "0.70710678118654752440";
    }
    int v11 = xmlStrlen((const xmlChar *)v9);
    if (v4 <= (double)v11) {
      int v12 = (int)v4;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = xmlStrsub((const xmlChar *)v9, 0, v12);
    if (v13)
    {
      unint64_t v14 = v13;
      double v10 = MEMORY[0x22A6A3F40]();
      (*v8)(v14);
LABEL_31:
      (*v8)(v6);
      goto LABEL_32;
    }
LABEL_30:
    double v10 = *MEMORY[0x263F8C8D0];
    goto LABEL_31;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 438, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

void exsltMathRandomFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 488, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
  else
  {
    int v3 = rand();
    double v4 = xmlXPathNewFloat((double)v3 / 2147483650.0);
    valuePush(ctxt, v4);
  }
}

void exsltMathAbsFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      double v4 = v3;
      int IsNaN = xmlXPathIsNaN(v3);
      double v6 = *MEMORY[0x263F8C8D0];
      double v7 = fabs(v4);
      if (!IsNaN) {
        double v6 = v7;
      }
      double v8 = xmlXPathNewFloat(v6);
      valuePush(ctxt, v8);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 532, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathSqrtFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      double v4 = v3;
      int IsNaN = xmlXPathIsNaN(v3);
      double v6 = *MEMORY[0x263F8C8D0];
      double v7 = sqrt(v4);
      if (!IsNaN) {
        double v6 = v7;
      }
      double v8 = xmlXPathNewFloat(v6);
      valuePush(ctxt, v8);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 575, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathPowerFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      double v5 = xmlXPathPopNumber(ctxt);
      if (!ctxt->error)
      {
        long double v6 = v5;
        if (xmlXPathIsNaN(v5) || xmlXPathIsNaN(v4)) {
          double v7 = *MEMORY[0x263F8C8D0];
        }
        else {
          double v7 = pow(v6, v4);
        }
        double v8 = xmlXPathNewFloat(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 620, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathLogFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = log(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 668, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathSinFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = sin(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 711, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathCosFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = cos(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 754, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathTanFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = tan(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 797, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathAsinFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = asin(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 840, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathAcosFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = acos(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 883, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathAtanFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = atan(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 926, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathAtan2Function(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      double v5 = xmlXPathPopNumber(ctxt);
      if (!ctxt->error)
      {
        long double v6 = v5;
        if (xmlXPathIsNaN(v5) || xmlXPathIsNaN(v4)) {
          double v7 = *MEMORY[0x263F8C8D0];
        }
        else {
          double v7 = atan2(v6, v4);
        }
        double v8 = xmlXPathNewFloat(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 971, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltMathExpFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    double v3 = xmlXPathPopNumber(ctxt);
    if (!ctxt->error)
    {
      long double v4 = v3;
      if (xmlXPathIsNaN(v3)) {
        double v5 = *MEMORY[0x263F8C8D0];
      }
      else {
        double v5 = exp(v4);
      }
      long double v6 = xmlXPathNewFloat(v5);
      valuePush(ctxt, v6);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/math.c", 1020, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

int exsltMathXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  if (!ctxt) {
    return -1;
  }
  if (!prefix) {
    return -1;
  }
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/math")) {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"min", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMinFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"max", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathMaxFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"highest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathHighestFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"lowest", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLowestFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"random", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathRandomFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"abs", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAbsFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"sqrt", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSqrtFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"power", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathPowerFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"log", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathLogFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"sin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathSinFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"cos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathCosFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"tan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathTanFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"asin", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAsinFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"acos", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAcosFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"atan", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtanFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"atan2", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathAtan2Function))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"exp", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathExpFunction))
  {
    return -1;
  }
  int result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"constant", (const xmlChar *)"http://exslt.org/math", (xmlXPathFunction)exsltMathConstantFunction);
  if (result) {
    return -1;
  }
  return result;
}

void exsltSaxonRegister(void)
{
  xsltRegisterExtModule((const xmlChar *)"http://icl.com/saxon", (xsltExtInitFunction)exsltSaxonInit, (xsltExtShutdownFunction)exsltSaxonShutdown);
  xsltRegisterExtModuleFunction((const xmlChar *)"expression", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonExpressionFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"eval", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonEvalFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"evaluate", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonEvaluateFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"line-number", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonLineNumberFunction);

  xsltRegisterExtModuleFunction((const xmlChar *)"systemId", (const xmlChar *)"http://icl.com/saxon", (xmlXPathFunction)exsltSaxonSystemIdFunction);
}

xmlHashTablePtr exsltSaxonInit()
{
  return xmlHashCreate(1);
}

void exsltSaxonShutdown(int a1, int a2, xmlHashTablePtr table)
{
}

void exsltSaxonExpressionFunction(xmlXPathParserContext *a1, int a2)
{
  xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(a1);
  if (a2 != 1)
  {
    int v8 = 12;
    xmlXPatherror(a1, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 85, 12);
    if (!a1) {
      return;
    }
    goto LABEL_10;
  }
  double v5 = TransformContext;
  long double v6 = xmlXPathPopString(a1);
  if (a1->error) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (v7)
  {
    int v8 = 11;
    uint64_t v9 = a1;
    int v10 = 91;
    int v11 = 11;
LABEL_8:
    xmlXPatherror(v9, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", v10, v11);
LABEL_10:
    a1->error = v8;
    return;
  }
  int v12 = v6;
  ExtData = (xmlHashTable *)xsltGetExtData(v5, a1->context->functionURI);
  unint64_t v14 = (xmlXPathCompExpr *)xmlHashLookup(ExtData, v12);
  xmlXPathCompExprPtr v15 = v14;
  if (!v14)
  {
    xmlXPathCompExprPtr v16 = xmlXPathCtxtCompile(v5->xpathCtxt, v12);
    if (v16)
    {
      xmlXPathCompExprPtr v15 = v16;
      xmlHashAddEntry(ExtData, v12, v16);
      goto LABEL_15;
    }
    ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v12);
    int v8 = 7;
    uint64_t v9 = a1;
    int v10 = 104;
    int v11 = 7;
    goto LABEL_8;
  }
LABEL_15:
  ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v12);
  int v17 = xmlXPathWrapExternal(v15);

  valuePush(a1, v17);
}

void exsltSaxonEvalFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  xmlXPathParserContextPtr v2 = ctxt;
  if (a2 != 1)
  {
    int v6 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 136, 12);
    if (!v2) {
      return;
    }
LABEL_12:
    v2->error = v6;
    return;
  }
  xmlXPathObjectPtr value = ctxt->value;
  if (!value || value->type != XPATH_USERS)
  {
    int v6 = 11;
    int v7 = 141;
    int v8 = 11;
LABEL_11:
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", v7, v8);
    goto LABEL_12;
  }
  long double v4 = (xmlXPathCompExpr *)xmlXPathPopExternal(ctxt);
  double v5 = xmlXPathCompiledEval(v4, v2->context);
  if (!v5)
  {
    int v6 = 7;
    ctxt = v2;
    int v7 = 149;
    int v8 = 7;
    goto LABEL_11;
  }

  valuePush(v2, v5);
}

void exsltSaxonEvaluateFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    exsltSaxonExpressionFunction(ctxt, 1);
    exsltSaxonEvalFunction(ctxt, 1);
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 176, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltSaxonLineNumberFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 != 1)
  {
    if (!a2)
    {
      xmlXPathObjectPtr v4 = 0;
      xmlNodePtr node = ctxt->context->node;
LABEL_4:
      double LineNo = -1.0;
      if (node)
      {
        if (node->type != XML_NAMESPACE_DECL
          || (xmlNodePtr node = (xmlNodePtr)node->_private) != 0 && node->type == XML_ELEMENT_NODE)
        {
          double LineNo = (double)xmlGetLineNo(node);
        }
        else
        {
          ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "Internal error in exsltSaxonLineNumberFunction: Cannot retrieve the doc of a namespace node.\n");
        }
      }
      goto LABEL_23;
    }
    xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "saxon:line-number() : invalid number of args %d\n", a2);
    int v11 = 12;
LABEL_21:
    ctxt->error = v11;
    return;
  }
  xmlXPathObjectPtr value = ctxt->value;
  if (!value || value->type != XPATH_NODESET)
  {
    int v12 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v12, 0, 0, "saxon:line-number() : invalid arg expecting a node-set\n");
    int v11 = 11;
    goto LABEL_21;
  }
  xmlXPathObjectPtr v4 = valuePop(ctxt);
  p_uint64_t nodeNr = &v4->nodesetval->nodeNr;
  double LineNo = -1.0;
  if (p_nodeNr && *p_nodeNr >= 1)
  {
    xmlNodePtr node = (xmlNodePtr)**((void **)p_nodeNr + 1);
    if (*p_nodeNr != 1)
    {
      uint64_t v9 = 1;
      do
      {
        if (xmlXPathCmpNodes(node, *(xmlNodePtr *)(*((void *)p_nodeNr + 1) + 8 * v9)) == -1) {
          xmlNodePtr node = *(xmlNodePtr *)(*((void *)p_nodeNr + 1) + 8 * v9);
        }
        ++v9;
      }
      while (v9 < *p_nodeNr);
    }
    goto LABEL_4;
  }
LABEL_23:
  uint64_t v13 = xmlXPathNewFloat(LineNo);
  valuePush(ctxt, v13);

  xmlXPathFreeObject(v4);
}

void exsltSaxonSystemIdFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (ctxt)
  {
    if (a2)
    {
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/saxon.c", 199, 12);
      ctxt->error = 12;
    }
    else
    {
      xmlXPathContextPtr context = ctxt->context;
      if (!context || (xmlDocPtr doc = context->doc) == 0 || (URL = doc->URL) == 0) {
        URL = (const xmlChar *)&unk_228A36E0A;
      }
      int v6 = xmlXPathNewString(URL);
      valuePush(ctxt, v6);
    }
  }
}

void exsltSetsRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDifferenceFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"intersection", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsIntersectionFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"distinct", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDistinctFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"has-same-node", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsHasSameNodesFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"leading", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsLeadingFunction);

  xsltRegisterExtModuleFunction((const xmlChar *)"trailing", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsTrailingFunction);
}

void exsltSetsDifferenceFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    xmlNodeSetPtr v3 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      xmlXPathObjectPtr v4 = v3;
      double v5 = xmlXPathPopNodeSet(ctxt);
      if (ctxt->error)
      {
        xmlXPathFreeNodeSet(v4);
      }
      else
      {
        int v6 = v5;
        int v7 = xmlXPathDifference(v5, v4);
        if (v7 != v6) {
          xmlXPathFreeNodeSet(v6);
        }
        xmlXPathFreeNodeSet(v4);
        int v8 = xmlXPathWrapNodeSet(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 26, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltSetsIntersectionFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    xmlNodeSetPtr v3 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      xmlXPathObjectPtr v4 = v3;
      double v5 = xmlXPathPopNodeSet(ctxt);
      if (ctxt->error)
      {
        xmlXPathFreeNodeSet(v4);
      }
      else
      {
        int v6 = v5;
        int v7 = xmlXPathIntersection(v5, v4);
        xmlXPathFreeNodeSet(v6);
        xmlXPathFreeNodeSet(v4);
        int v8 = xmlXPathWrapNodeSet(v7);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 61, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltSetsDistinctFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 1)
  {
    xmlXPathObjectPtr value = ctxt->value;
    if (value)
    {
      int BOOLval = value->BOOLval;
      user = value->user;
      value->int BOOLval = 0;
      value->user = 0;
    }
    else
    {
      int BOOLval = 0;
      user = 0;
    }
    int v6 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      int v7 = v6;
      int v8 = xmlXPathDistinctSorted(v6);
      if (v8 != v7) {
        xmlXPathFreeNodeSet(v7);
      }
      xmlXPathObjectPtr v9 = xmlXPathWrapNodeSet(v8);
      v9->user = user;
      v9->int BOOLval = BOOLval;
      valuePush(ctxt, v9);
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 98, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltSetsHasSameNodesFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    xmlNodeSetPtr v3 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      xmlXPathObjectPtr v4 = v3;
      double v5 = xmlXPathPopNodeSet(ctxt);
      if (ctxt->error)
      {
        xmlXPathFreeNodeSet(v4);
      }
      else
      {
        int v6 = v5;
        int HasSameNodes = xmlXPathHasSameNodes(v5, v4);
        xmlXPathFreeNodeSet(v6);
        xmlXPathFreeNodeSet(v4);
        int v8 = xmlXPathNewBoolean(HasSameNodes);
        valuePush(ctxt, v8);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 138, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltSetsLeadingFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    xmlNodeSetPtr v3 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error) {
      return;
    }
    xmlXPathObjectPtr v4 = v3;
    double v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      int v6 = v5;
      if (v4)
      {
        if (v4->nodeNr)
        {
          nodeTab = v4->nodeTab;
          if (nodeTab)
          {
            if (v4->nodeNr < 1) {
              int v8 = 0;
            }
            else {
              int v8 = *nodeTab;
            }
            int v10 = xmlXPathNodeLeadingSorted(v5, v8);
            xmlXPathFreeNodeSet(v6);
            xmlXPathFreeNodeSet(v4);
            int v11 = xmlXPathWrapNodeSet(v10);
            valuePush(ctxt, v11);
            return;
          }
        }
      }
      xmlXPathObjectPtr v9 = xmlXPathWrapNodeSet(v5);
      valuePush(ctxt, v9);
    }
    xmlXPathFreeNodeSet(v4);
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 172, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltSetsTrailingFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 == 2)
  {
    xmlNodeSetPtr v3 = xmlXPathPopNodeSet(ctxt);
    if (ctxt->error) {
      return;
    }
    xmlXPathObjectPtr v4 = v3;
    double v5 = xmlXPathPopNodeSet(ctxt);
    if (!ctxt->error)
    {
      int v6 = v5;
      if (v4)
      {
        if (v4->nodeNr)
        {
          nodeTab = v4->nodeTab;
          if (nodeTab)
          {
            if (v4->nodeNr < 1) {
              int v8 = 0;
            }
            else {
              int v8 = *nodeTab;
            }
            int v10 = xmlXPathNodeTrailingSorted(v5, v8);
            xmlXPathFreeNodeSet(v6);
            xmlXPathFreeNodeSet(v4);
            int v11 = xmlXPathWrapNodeSet(v10);
            valuePush(ctxt, v11);
            return;
          }
        }
      }
      xmlXPathObjectPtr v9 = xmlXPathWrapNodeSet(v5);
      valuePush(ctxt, v9);
    }
    xmlXPathFreeNodeSet(v4);
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/sets.c", 217, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

int exsltSetsXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  if (!ctxt) {
    return -1;
  }
  if (!prefix) {
    return -1;
  }
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/sets")) {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"difference", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDifferenceFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"intersection", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsIntersectionFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"distinct", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsDistinctFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"has-same-node", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsHasSameNodesFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"leading", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsLeadingFunction))
  {
    return -1;
  }
  int result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"trailing", (const xmlChar *)"http://exslt.org/sets", (xmlXPathFunction)exsltSetsTrailingFunction);
  if (result) {
    return -1;
  }
  return result;
}

void exsltStrRegister(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"tokenize", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrTokenizeFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"split", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrSplitFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"encode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrEncodeUriFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"decode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrDecodeUriFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"padding", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrPaddingFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"align", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrAlignFunction);
  xsltRegisterExtModuleFunction((const xmlChar *)"concat", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrConcatFunction);

  xsltRegisterExtModuleFunction((const xmlChar *)"replace", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrReplaceFunction);
}

void exsltStrTokenizeFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if ((a2 - 3) > 0xFFFFFFFD)
  {
    if (a2 == 2)
    {
      xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
      if (ctxt->error) {
        return;
      }
    }
    else
    {
      xmlNodeSetPtr v3 = xmlStrdup((const xmlChar *)"\t\r\n ");
    }
    xmlXPathObjectPtr v4 = v3;
    if (v3)
    {
      double v5 = xmlXPathPopString(ctxt);
      if (ctxt->error || (int v6 = v5) == 0)
      {
        uint64_t v21 = (void (*)(xmlChar *))*MEMORY[0x263F8C880];
        v21(v4);
      }
      else
      {
        xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(ctxt);
        xmlXPathObjectPtr v8 = (xmlXPathObjectPtr)TransformContext;
        if (TransformContext)
        {
          RVT = xsltCreateRVT(TransformContext);
          if (RVT)
          {
            int v10 = RVT;
            xsltRegisterLocalRVT((xsltTransformContextPtr)v8, RVT);
            xmlXPathObjectPtr v8 = xmlXPathNewNodeSet(0);
            if (v8 && *v6)
            {
              int v11 = v6;
              int v12 = v6;
              do
              {
                int v13 = xmlUTF8Strsize(v12, 1);
                int v14 = v13;
                xmlXPathCompExprPtr v15 = v4;
                if (*v4)
                {
                  while (xmlUTF8Charcmp(v12, v15))
                  {
                    v15 += xmlUTF8Strsize(v15, 1);
                    if (!*v15)
                    {
                      uint64_t v16 = v14;
                      goto LABEL_24;
                    }
                  }
                  if (v12 == v11)
                  {
                    uint64_t v16 = v14;
                    v11 += v14;
                  }
                  else
                  {
                    *int v12 = 0;
                    xmlXPathObjectPtr v19 = xmlNewDocRawNode(v10, 0, (const xmlChar *)"token", v11);
                    xmlAddChild((xmlNodePtr)v10, v19);
                    xmlXPathNodeSetAddUnique(v8->nodesetval, v19);
                    *int v12 = *v15;
                    uint64_t v16 = v14;
                    int v11 = &v12[v14];
                  }
                }
                else
                {
                  uint64_t v16 = v13;
                  int v11 = &v12[v13];
                  xmlChar v17 = *v11;
                  *int v11 = 0;
                  uint64_t v18 = xmlNewDocRawNode(v10, 0, (const xmlChar *)"token", v12);
                  xmlAddChild((xmlNodePtr)v10, v18);
                  xmlXPathNodeSetAddUnique(v8->nodesetval, v18);
                  *int v11 = v17;
                }
LABEL_24:
                v12 += v16;
              }
              while (*v12);
              if (v11 != v12)
              {
                int v20 = xmlNewDocRawNode(v10, 0, (const xmlChar *)"token", v11);
                xmlAddChild((xmlNodePtr)v10, v20);
                xmlXPathNodeSetAddUnique(v8->nodesetval, v20);
              }
            }
          }
          else
          {
            xmlXPathObjectPtr v8 = 0;
          }
        }
        else
        {
          int v22 = xsltXPathGetTransformContext(ctxt);
          xsltTransformError(v22, 0, 0, "exslt:tokenize : internal error tctxt == NULL\n");
        }
        uint64_t v23 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v6);
        (*v23)(v4);
        if (v8)
        {
          int v24 = ctxt;
          int v25 = v8;
        }
        else
        {
          int v25 = xmlXPathNewNodeSet(0);
          int v24 = ctxt;
        }
        valuePush(v24, v25);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 37, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltStrSplitFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if ((a2 - 3) > 0xFFFFFFFD)
  {
    if (a2 == 2)
    {
      xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
      if (ctxt->error) {
        return;
      }
    }
    else
    {
      xmlNodeSetPtr v3 = xmlStrdup((const xmlChar *)" ");
    }
    xmlXPathObjectPtr v4 = v3;
    if (v3)
    {
      int v5 = xmlStrlen(v3);
      int v6 = xmlXPathPopString(ctxt);
      if (ctxt->error || (int v7 = v6) == 0)
      {
        xmlXPathObjectPtr v19 = (void (*)(const xmlChar *))*MEMORY[0x263F8C880];
        v19(v4);
      }
      else
      {
        xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(ctxt);
        xmlXPathObjectPtr v9 = (xmlXPathObjectPtr)TransformContext;
        if (TransformContext)
        {
          RVT = xsltCreateRVT(TransformContext);
          if (RVT)
          {
            int v11 = RVT;
            xsltRegisterLocalRVT((xsltTransformContextPtr)v9, RVT);
            xmlXPathObjectPtr v9 = xmlXPathNewNodeSet(0);
            if (v9)
            {
              xmlChar v12 = *v7;
              if (*v7)
              {
                int v13 = v7;
                int v14 = v7;
                do
                {
                  if (v5)
                  {
                    if (!xmlStrncasecmp(v14, v4, v5))
                    {
                      if (v14 == v13)
                      {
                        v13 += v5;
                      }
                      else
                      {
                        *int v14 = 0;
                        xmlXPathCompExprPtr v15 = xmlNewDocRawNode(v11, 0, (const xmlChar *)"token", v13);
                        xmlAddChild((xmlNodePtr)v11, v15);
                        xmlXPathNodeSetAddUnique(v9->nodesetval, v15);
                        *int v14 = *v4;
                        int v13 = &v14[v5];
                      }
                      int v14 = (xmlChar *)(v13 - 1);
                    }
                  }
                  else if (v14 == v13)
                  {
                    int v14 = (xmlChar *)v13;
                  }
                  else
                  {
                    *int v14 = 0;
                    uint64_t v16 = xmlNewDocRawNode(v11, 0, (const xmlChar *)"token", v13);
                    xmlAddChild((xmlNodePtr)v11, v16);
                    xmlXPathNodeSetAddUnique(v9->nodesetval, v16);
                    *int v14 = v12;
                    ++v13;
                  }
                  int v17 = *++v14;
                  xmlChar v12 = v17;
                }
                while (v17);
                if (v13 != v14)
                {
                  uint64_t v18 = xmlNewDocRawNode(v11, 0, (const xmlChar *)"token", v13);
                  xmlAddChild((xmlNodePtr)v11, v18);
                  xmlXPathNodeSetAddUnique(v9->nodesetval, v18);
                }
              }
            }
          }
          else
          {
            xmlXPathObjectPtr v9 = 0;
          }
        }
        else
        {
          int v20 = xsltXPathGetTransformContext(ctxt);
          xsltTransformError(v20, 0, 0, "exslt:tokenize : internal error tctxt == NULL\n");
        }
        uint64_t v21 = (void (**)(const xmlChar *))MEMORY[0x263F8C880];
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v7);
        (*v21)(v4);
        if (v9)
        {
          int v22 = ctxt;
          uint64_t v23 = v9;
        }
        else
        {
          uint64_t v23 = xmlXPathNewNodeSet(0);
          int v22 = ctxt;
        }
        valuePush(v22, v23);
      }
    }
  }
  else
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 140, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
  }
}

void exsltStrEncodeUriFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 - 4 <= 0xFFFFFFFD)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 240, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
    return;
  }
  if (a2 >= 3)
  {
    xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
    if (xmlUTF8Strlen(v3) != 5 || xmlStrcmp((const xmlChar *)"UTF-8", v3)) {
      goto LABEL_17;
    }
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v3);
  }
  int v4 = xmlXPathPopBoolean(ctxt);
  xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
  int v5 = xmlUTF8Strlen(v3);
  if (v5 > 0)
  {
    if (v4) {
      int v6 = "-_.!~*'()";
    }
    else {
      int v6 = "-_.!~*'();/?:@&=+$,[]";
    }
    int v7 = xmlURIEscapeStr(v3, (const xmlChar *)v6);
    xmlXPathObjectPtr v8 = xmlXPathWrapString(v7);
    valuePush(ctxt, v8);
    if (!v3) {
      return;
    }
    goto LABEL_18;
  }
  if (v5 < 0) {
    ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltStrEncodeUriFunction: invalid UTF-8\n");
  }
LABEL_17:
  xmlXPathObjectPtr v9 = xmlXPathNewCString((const char *)&unk_228A36E0A);
  valuePush(ctxt, v9);
LABEL_18:
  int v10 = (void (*)(xmlChar *))*MEMORY[0x263F8C880];

  v10(v3);
}

void exsltStrDecodeUriFunction(xmlXPathParserContextPtr ctxt, unsigned int a2)
{
  if (a2 - 3 <= 0xFFFFFFFD)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 290, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
    return;
  }
  if (a2 >= 2)
  {
    xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
    if (xmlUTF8Strlen(v3) != 5 || xmlStrcmp((const xmlChar *)"UTF-8", v3))
    {
LABEL_15:
      int v7 = xmlXPathNewCString((const char *)&unk_228A36E0A);
      valuePush(ctxt, v7);
      goto LABEL_16;
    }
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v3);
  }
  xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
  int v4 = xmlUTF8Strlen(v3);
  if (v4 <= 0)
  {
    if (v4 < 0) {
      ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltStrDecodeUriFunction: invalid UTF-8\n");
    }
    goto LABEL_15;
  }
  int v5 = xmlURIUnescapeString((const char *)v3, 0, 0);
  if (!xmlCheckUTF8((const unsigned __int8 *)v5))
  {
    int v10 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    valuePush(ctxt, v10);
    int v11 = (void (**)(void *))MEMORY[0x263F8C880];
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v3);
    xmlXPathObjectPtr v8 = *v11;
    xmlXPathObjectPtr v9 = v5;
    goto LABEL_17;
  }
  int v6 = xmlXPathWrapString((xmlChar *)v5);
  valuePush(ctxt, v6);
  if (!v3) {
    return;
  }
LABEL_16:
  xmlXPathObjectPtr v8 = (void (*)(void *))*MEMORY[0x263F8C880];
  xmlXPathObjectPtr v9 = v3;
LABEL_17:

  v8(v9);
}

void exsltStrPaddingFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if ((a2 - 3) <= 0xFFFFFFFD)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 349, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
    return;
  }
  if (a2 != 2)
  {
    double v6 = xmlXPathPopNumber(ctxt);
LABEL_11:
    xmlNodeSetPtr v3 = xmlStrdup((const xmlChar *)" ");
    int v4 = 1;
    int v5 = 1;
    goto LABEL_12;
  }
  xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
  int v4 = xmlUTF8Strlen(v3);
  int v5 = xmlStrlen(v3);
  double v6 = xmlXPathPopNumber(ctxt);
  if (v4 <= 0)
  {
    if (v4 < 0)
    {
      ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltStrPaddingFunction: invalid UTF-8\n");
LABEL_28:
      int v14 = xmlXPathNewCString((const char *)&unk_228A36E0A);
      valuePush(ctxt, v14);
      goto LABEL_29;
    }
    if (v3) {
      ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v3);
    }
    goto LABEL_11;
  }
LABEL_12:
  int IsNaN = xmlXPathIsNaN(v6);
  if (v6 < 0.0 || IsNaN) {
    goto LABEL_28;
  }
  if (v6 >= 100000.0)
  {
    int v8 = 100000;
  }
  else
  {
    int v8 = (int)v6;
    if ((int)v6 <= 0) {
      goto LABEL_28;
    }
  }
  Size = xmlBufferCreateSize(v8);
  if (!Size)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 392, 15);
    if (ctxt) {
      ctxt->error = 15;
    }
    goto LABEL_29;
  }
  int v10 = Size;
  xmlBufferSetAllocationScheme(Size, XML_BUFFER_ALLOC_DOUBLEIT);
  if (v8 < v4) {
    goto LABEL_22;
  }
  do
  {
    xmlBufferAdd(v10, v3, v5);
    v8 -= v4;
  }
  while (v8 >= v4);
  if (v8 >= 1)
  {
LABEL_22:
    int v11 = xmlUTF8Strsize(v3, v8);
    xmlBufferAdd(v10, v3, v11);
  }
  xmlChar v12 = xmlBufferDetach(v10);
  int v13 = xmlXPathWrapString(v12);
  valuePush(ctxt, v13);
  xmlBufferFree(v10);
  if (v3)
  {
LABEL_29:
    xmlXPathCompExprPtr v15 = (void (*)(xmlChar *))*MEMORY[0x263F8C880];
    v15(v3);
  }
}

void exsltStrAlignFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if ((a2 - 4) <= 0xFFFFFFFD)
  {
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 427, 12);
    if (ctxt) {
      ctxt->error = 12;
    }
    return;
  }
  if (a2 == 3) {
    xmlNodeSetPtr v3 = xmlXPathPopString(ctxt);
  }
  else {
    xmlNodeSetPtr v3 = 0;
  }
  int v4 = xmlXPathPopString(ctxt);
  int v5 = xmlXPathPopString(ctxt);
  unsigned int v6 = xmlUTF8Strlen(v5);
  unsigned int v7 = xmlUTF8Strlen(v4);
  if ((v6 & 0x80000000) != 0 || (v7 & 0x80000000) != 0)
  {
    ((void (*)(void, const char *))*MEMORY[0x263F8C8F8])(*MEMORY[0x263F8C900], "exsltStrAlignFunction: invalid UTF-8\n");
    int v11 = xmlXPathNewCString((const char *)&unk_228A36E0A);
LABEL_25:
    valuePush(ctxt, v11);
    int v10 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v5);
    goto LABEL_26;
  }
  int v8 = v7 - v6;
  if (v7 != v6)
  {
    if (v7 >= v6)
    {
      if (xmlStrEqual(v3, (const xmlChar *)"right"))
      {
        int v13 = xmlUTF8Strndup(v4, v8);
        int v14 = v5;
      }
      else if (xmlStrEqual(v3, (const xmlChar *)"center"))
      {
        if (v8 >= 0) {
          int v15 = v8;
        }
        else {
          int v15 = v8 + 1;
        }
        uint64_t v16 = xmlUTF8Strndup(v4, v15 >> 1);
        int v17 = xmlStrcat(v16, v5);
        int v14 = &v4[xmlUTF8Strsize(v4, v6 + (v15 >> 1))];
        int v13 = v17;
      }
      else
      {
        int v18 = xmlUTF8Strsize(v4, v6);
        int v13 = xmlStrdup(v5);
        int v14 = &v4[v18];
      }
      xmlChar v12 = xmlStrcat(v13, v14);
    }
    else
    {
      xmlChar v12 = xmlUTF8Strndup(v5, v7);
    }
    int v11 = xmlXPathWrapString(v12);
    goto LABEL_25;
  }
  xmlXPathObjectPtr v9 = xmlXPathWrapString(v5);
  valuePush(ctxt, v9);
  int v10 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
LABEL_26:
  (*v10)(v4);
  xmlXPathObjectPtr v19 = *v10;

  v19(v3);
}

void exsltStrConcatFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  if (a2 != 1)
  {
    int v15 = 12;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 506, 12);
    if (!ctxt) {
      return;
    }
LABEL_17:
    ctxt->error = v15;
    return;
  }
  xmlXPathObjectPtr value = ctxt->value;
  if (!value || (value->type | 8) != 9)
  {
    int v15 = 11;
    xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 511, 11);
    goto LABEL_17;
  }
  xmlXPathObjectPtr v4 = valuePop(ctxt);
  int v5 = v4;
  xmlNodeSetPtr nodesetval = v4->nodesetval;
  if (nodesetval && nodesetval->nodeNr && nodesetval->nodeTab)
  {
    unsigned int v7 = xmlBufferCreate();
    if (v7)
    {
      int v8 = v7;
      xmlBufferSetAllocationScheme(v7, XML_BUFFER_ALLOC_DOUBLEIT);
      p_uint64_t nodeNr = &v5->nodesetval->nodeNr;
      if (*p_nodeNr >= 1)
      {
        uint64_t v10 = 0;
        int v11 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
        do
        {
          xmlChar v12 = xmlXPathCastNodeToString(*(xmlNodePtr *)(*((void *)p_nodeNr + 1) + 8 * v10));
          xmlBufferCat(v8, v12);
          (*v11)(v12);
          ++v10;
          p_uint64_t nodeNr = &v5->nodesetval->nodeNr;
        }
        while (v10 < *p_nodeNr);
      }
      xmlXPathFreeObject(v5);
      int v13 = xmlBufferDetach(v8);
      int v14 = xmlXPathWrapString(v13);
      valuePush(ctxt, v14);
      xmlBufferFree(v8);
    }
    else
    {
      xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 525, 15);
      ctxt->error = 15;
      xmlXPathFreeObject(v5);
    }
  }
  else
  {
    xmlXPathFreeObject(v4);
    uint64_t v16 = xmlXPathNewCString((const char *)&unk_228A36E0A);
    valuePush(ctxt, v16);
  }
}

void exsltStrReplaceFunction(xmlXPathParserContextPtr ctxt, int a2)
{
  int v56 = 0;
  int v55 = 0;
  str = 0;
  int v54 = 0;
  if (a2 == 3)
  {
    xmlXPathObjectPtr value = ctxt->value;
    if (value && (value->type | 8) == 9)
    {
      xmlNodeSetPtr v4 = xmlXPathPopNodeSet(ctxt);
    }
    else
    {
      xmlNodeSetPtr v4 = 0;
      str = xmlXPathPopString(ctxt);
    }
    if (ctxt->error) {
      return;
    }
    xmlXPathObjectPtr v5 = ctxt->value;
    if (v5 && (v5->type | 8) == 9)
    {
      xmlNodeSetPtr v6 = xmlXPathPopNodeSet(ctxt);
      unsigned int v7 = v6;
      if (v6) {
        unsigned int nodeNr = v6->nodeNr;
      }
      else {
        unsigned int nodeNr = 0;
      }
    }
    else
    {
      unsigned int v7 = 0;
      int v54 = xmlXPathPopString(ctxt);
      unsigned int nodeNr = 1;
    }
    if (ctxt->error)
    {
LABEL_103:
      if (!v4) {
        goto LABEL_108;
      }
      goto LABEL_104;
    }
    xmlXPathObjectPtr v9 = xmlXPathPopString(ctxt);
    if (ctxt->error) {
      goto LABEL_101;
    }
    uint64_t v10 = v9;
    uint64_t v11 = nodeNr;
    if ((int)nodeNr <= 0)
    {
      int v16 = xmlStrlen(v9);
      exsltStrReturnString(ctxt, v10, v16);
      goto LABEL_100;
    }
    if (nodeNr == 1)
    {
      uint64_t v46 = 0;
      str1 = v9;
      p_str = &str;
      int v13 = &v54;
      int v14 = &v55;
      int v15 = (xmlChar **)&v56;
    }
    else
    {
      uint64_t v17 = ((uint64_t (*)(uint64_t))*MEMORY[0x263F8C8B0])(24 * nodeNr);
      if (!v17)
      {
        xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 660, 15);
        ctxt->error = 15;
        goto LABEL_100;
      }
      uint64_t v46 = v17;
      str1 = (xmlChar *)v10;
      p_str = (xmlChar **)(v17 + 8 * nodeNr);
      int v15 = &p_str[nodeNr];
      int v14 = (int *)v15 + nodeNr;
      int v13 = (xmlChar **)v17;
    }
    uint64_t v18 = 0;
    unsigned int v19 = -1;
    BOOL v51 = v7;
    while (1)
    {
      if (v7)
      {
        int v20 = xmlXPathCastNodeToString(v7->nodeTab[v18]);
        v13[v18] = v20;
        if (!v20)
        {
          LODWORD(v11) = v18;
          goto LABEL_88;
        }
      }
      else
      {
        int v20 = v13[v18];
      }
      int v21 = xmlStrlen(v20);
      *((_DWORD *)v15 + v18) = v21;
      if (v21) {
        BOOL v22 = 0;
      }
      else {
        BOOL v22 = (v19 & 0x80000000) != 0;
      }
      if (v22) {
        unsigned int v19 = v18;
      }
      if (v4) {
        break;
      }
      if (v18) {
        goto LABEL_39;
      }
      uint64_t v23 = str;
      *p_str = str;
      if (v23) {
        goto LABEL_41;
      }
LABEL_42:
      v14[v18++] = (int)v23;
      if (v11 == v18)
      {
        if ((v19 & 0x80000000) == 0 && !v14[v19]) {
          unsigned int v19 = -1;
        }
        int v24 = xmlBufferCreate();
        if (v24)
        {
          xmlBufferPtr buf = v24;
          xmlBufferSetAllocationScheme(v24, XML_BUFFER_ALLOC_DOUBLEIT);
          if (*str1)
          {
            int v25 = str1;
            int v52 = str1;
            long long v48 = v14;
            long long v49 = v4;
            do
            {
              uint64_t v26 = 0;
              int v27 = 0;
              int v28 = 0;
              do
              {
                xsltStackElemPtr v29 = v13[v26];
                if (*v25 == *v29)
                {
                  int v30 = *((_DWORD *)v15 + v26);
                  if (v30 > v28 && !xmlStrncmp(v25, v29, v30))
                  {
                    int v28 = *((_DWORD *)v15 + v26);
                    int v27 = v26;
                  }
                }
                ++v26;
              }
              while (v11 != v26);
              xmlNodeSetPtr v4 = v49;
              if (v28)
              {
                if (v52 < v25
                  && (v25 - v52 >= 0x7FFFFFFF ? (int v31 = 0x7FFFFFFF) : (int v31 = v25 - v52),
                      xmlBufferAdd(buf, v52, v31))
                  || (int v32 = v48[v27]) != 0 && xmlBufferAdd(buf, p_str[v27], v32))
                {
                  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 758, 15);
                  unsigned int v7 = v51;
                  if (!ctxt) {
                    goto LABEL_87;
                  }
                  goto LABEL_86;
                }
                v25 += *((int *)v15 + v27);
                int v52 = (xmlChar *)v25;
                unsigned int v7 = v51;
              }
              else
              {
                if ((v19 & 0x80000000) != 0)
                {
                  unsigned int v7 = v51;
                }
                else
                {
                  unsigned int v7 = v51;
                  if (v52 < v25)
                  {
                    int v33 = v25 - v52 >= 0x7FFFFFFF ? 0x7FFFFFFF : v25 - v52;
                    if (xmlBufferAdd(buf, v52, v33) || (int v52 = (xmlChar *)v25, xmlBufferAdd(buf, p_str[v19], v48[v19])))
                    {
                      uint64_t v35 = ctxt;
                      int v36 = 743;
                      goto LABEL_112;
                    }
                  }
                }
                v25 += xmlUTF8Strsize(v25, 1);
              }
            }
            while (*v25);
            if (v52 >= v25) {
              goto LABEL_84;
            }
            int v34 = v25 - v52 >= 0x7FFFFFFF ? 0x7FFFFFFF : v25 - v52;
            if (!xmlBufferAdd(buf, v52, v34)) {
              goto LABEL_84;
            }
            uint64_t v35 = ctxt;
            int v36 = 769;
LABEL_112:
            xmlXPatherror(v35, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", v36, 15);
            if (ctxt) {
LABEL_86:
            }
              ctxt->error = 15;
          }
          else
          {
LABEL_84:
            int v37 = xmlBufferContent(buf);
            int v38 = xmlBufferLength(buf);
            exsltStrReturnString(ctxt, v37, v38);
          }
LABEL_87:
          xmlBufferFree(buf);
        }
        else
        {
          xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 717, 15);
          if (ctxt) {
            ctxt->error = 15;
          }
        }
LABEL_88:
        uint64_t v10 = str1;
        if (v7 && (int)v11 >= 1)
        {
          uint64_t v39 = v11;
          long long v40 = (void (**)(uint64_t))MEMORY[0x263F8C880];
          do
          {
            uint64_t v41 = (uint64_t)*v13++;
            (*v40)(v41);
            --v39;
          }
          while (v39);
        }
        if (v4 && (int)v11 >= 1)
        {
          uint64_t v42 = v11;
          BOOL v43 = (void (**)(void))MEMORY[0x263F8C880];
          do
          {
            if (*p_str) {
              (*v43)();
            }
            ++p_str;
            --v42;
          }
          while (v42);
        }
        unsigned int v7 = v51;
        if (v46) {
          ((void (*)(uint64_t))*MEMORY[0x263F8C880])(v46);
        }
LABEL_100:
        ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v10);
LABEL_101:
        if (v7)
        {
          xmlXPathFreeNodeSet(v7);
          goto LABEL_103;
        }
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v54);
        if (!v4)
        {
LABEL_108:
          uint64_t v44 = (void (*)(xmlChar *))*MEMORY[0x263F8C880];
          unint64_t v45 = str;
          v44(v45);
          return;
        }
LABEL_104:
        xmlXPathFreeNodeSet(v4);
        return;
      }
    }
    if (v18 < v4->nodeNr)
    {
      uint64_t v23 = xmlXPathCastNodeToString(v4->nodeTab[v18]);
      p_str[v18] = v23;
      if (!v23)
      {
        LODWORD(v11) = v18 + 1;
        goto LABEL_88;
      }
LABEL_41:
      LODWORD(v23) = xmlStrlen(v23);
      goto LABEL_42;
    }
LABEL_39:
    LODWORD(v23) = 0;
    p_str[v18] = 0;
    goto LABEL_42;
  }
  xmlXPatherror(ctxt, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", 608, 12);
  if (ctxt) {
    ctxt->error = 12;
  }
}

int exsltStrXpathCtxtRegister(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  if (!ctxt) {
    return -1;
  }
  if (!prefix) {
    return -1;
  }
  if (xmlXPathRegisterNs(ctxt, prefix, (const xmlChar *)"http://exslt.org/strings")) {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"encode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrEncodeUriFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"decode-uri", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrDecodeUriFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"padding", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrPaddingFunction))
  {
    return -1;
  }
  if (xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"align", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrAlignFunction))
  {
    return -1;
  }
  int result = xmlXPathRegisterFuncNS(ctxt, (const xmlChar *)"concat", (const xmlChar *)"http://exslt.org/strings", (xmlXPathFunction)exsltStrConcatFunction);
  if (result) {
    return -1;
  }
  return result;
}

void exsltStrReturnString(xmlXPathParserContext *a1, const xmlChar *a2, int a3)
{
  xsltTransformContextPtr TransformContext = xsltXPathGetTransformContext(a1);
  RVT = xsltCreateRVT(TransformContext);
  if (RVT)
  {
    int v8 = (xmlNode *)RVT;
    xsltRegisterLocalRVT(TransformContext, RVT);
    xmlXPathObjectPtr v9 = xmlNewTextLen(a2, a3);
    if (v9)
    {
      uint64_t v10 = v9;
      xmlAddChild(v8, v9);
      uint64_t v11 = xmlXPathNewNodeSet(v10);
      if (v11)
      {
        valuePush(a1, v11);
        return;
      }
      xmlChar v12 = a1;
      int v13 = 579;
    }
    else
    {
      xmlChar v12 = a1;
      int v13 = 572;
    }
  }
  else
  {
    xmlChar v12 = a1;
    int v13 = 565;
  }
  xmlXPatherror(v12, "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libexslt/strings.c", v13, 15);
  if (a1) {
    a1->error = 15;
  }
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270ED9DE0](a1, a2);
}

uint64_t linkedOnOrAfterFall2023OSVersions()
{
  return MEMORY[0x270F9C590]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

xmlXPathObjectPtr valuePop(xmlXPathParserContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9BAE8](ctxt);
}

int valuePush(xmlXPathParserContextPtr ctxt, xmlXPathObjectPtr value)
{
  return MEMORY[0x270F9BAF0](ctxt, value);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x270F9BAF8](parent, cur);
}

int xmlBufferAdd(xmlBufferPtr buf, const xmlChar *str, int len)
{
  return MEMORY[0x270F9BB28](buf, str, *(void *)&len);
}

int xmlBufferCat(xmlBufferPtr buf, const xmlChar *str)
{
  return MEMORY[0x270F9BB38](buf, str);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x270F9BB40](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x270F9BB48]();
}

xmlBufferPtr xmlBufferCreateSize(size_t size)
{
  return (xmlBufferPtr)MEMORY[0x270F9BB50](size);
}

xmlChar *__cdecl xmlBufferDetach(xmlBufferPtr buf)
{
  return (xmlChar *)MEMORY[0x270F9BB58](buf);
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

int xmlBufferLength(const xmlBuffer *buf)
{
  return MEMORY[0x270F9BB68](buf);
}

void xmlBufferSetAllocationScheme(xmlBufferPtr buf, xmlBufferAllocationScheme scheme)
{
}

int xmlCheckUTF8(const unsigned __int8 *utf)
{
  return MEMORY[0x270F9BBA0](utf);
}

void xmlDebugDumpNode(FILE *output, xmlNodePtr node, int depth)
{
}

void xmlFreeNode(xmlNodePtr cur)
{
}

void xmlFreeNodeList(xmlNodePtr cur)
{
}

uint64_t xmlGetLineNo(const xmlNode *node)
{
  return MEMORY[0x270F9BD08](node);
}

xmlNsPtr *__cdecl xmlGetNsList(const xmlDoc *doc, const xmlNode *node)
{
  return (xmlNsPtr *)MEMORY[0x270F9BD18](doc, node);
}

xmlChar *__cdecl xmlGetNsProp(const xmlNode *node, const xmlChar *name, const xmlChar *nameSpace)
{
  return (xmlChar *)MEMORY[0x270F9BD20](node, name, nameSpace);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x270F9BD30](node, name);
}

int xmlHashAddEntry(xmlHashTablePtr table, const xmlChar *name, void *userdata)
{
  return MEMORY[0x270F9BD48](table, name, userdata);
}

int xmlHashAddEntry2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, void *userdata)
{
  return MEMORY[0x270F9BD50](table, name, name2, userdata);
}

xmlHashTablePtr xmlHashCreate(int size)
{
  return (xmlHashTablePtr)MEMORY[0x270F9BD60](*(void *)&size);
}

void xmlHashFree(xmlHashTablePtr table, xmlHashDeallocator f)
{
}

void *__cdecl xmlHashLookup(xmlHashTablePtr table, const xmlChar *name)
{
  return (void *)MEMORY[0x270F9BD70](table, name);
}

void *__cdecl xmlHashLookup2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2)
{
  return (void *)MEMORY[0x270F9BD78](table, name, name2);
}

void xmlHashScanFull(xmlHashTablePtr table, xmlHashScannerFull f, void *data)
{
}

xmlNodePtr xmlNewDocNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x270F9BE40](doc, ns, name, content);
}

xmlNodePtr xmlNewDocRawNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x270F9BE60](doc, ns, name, content);
}

xmlNodePtr xmlNewDocText(const xmlDoc *doc, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x270F9BE68](doc, content);
}

xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar *href, const xmlChar *prefix)
{
  return (xmlNsPtr)MEMORY[0x270F9BE90](node, href, prefix);
}

xmlNodePtr xmlNewTextChild(xmlNodePtr parent, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x270F9BEC0](parent, ns, name, content);
}

xmlNodePtr xmlNewTextLen(const xmlChar *content, int len)
{
  return (xmlNodePtr)MEMORY[0x270F9BEC8](content, *(void *)&len);
}

xmlNsPtr xmlSearchNs(xmlDocPtr doc, xmlNodePtr node, const xmlChar *nameSpace)
{
  return (xmlNsPtr)MEMORY[0x270F9C0C0](doc, node, nameSpace);
}

xmlChar *__cdecl xmlSplitQName2(const xmlChar *name, xmlChar **prefix)
{
  return (xmlChar *)MEMORY[0x270F9C100](name, prefix);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x270F9C110](str1, str2);
}

xmlChar *__cdecl xmlStrcat(xmlChar *cur, const xmlChar *add)
{
  return (xmlChar *)MEMORY[0x270F9C128](cur, add);
}

int xmlStrcmp(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x270F9C138](str1, str2);
}

xmlChar *__cdecl xmlStrdup(const xmlChar *cur)
{
  return (xmlChar *)MEMORY[0x270F9C140](cur);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x270F9C150](str);
}

int xmlStrncasecmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return MEMORY[0x270F9C158](str1, str2, *(void *)&len);
}

int xmlStrncmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return MEMORY[0x270F9C168](str1, str2, *(void *)&len);
}

xmlChar *__cdecl xmlStrsub(const xmlChar *str, int start, int len)
{
  return (xmlChar *)MEMORY[0x270F9C180](str, *(void *)&start, *(void *)&len);
}

xmlChar *__cdecl xmlURIEscapeStr(const xmlChar *str, const xmlChar *list)
{
  return (xmlChar *)MEMORY[0x270F9C2E8](str, list);
}

char *__cdecl xmlURIUnescapeString(const char *str, int len, char *target)
{
  return (char *)MEMORY[0x270F9C2F0](str, *(void *)&len, target);
}

int xmlUTF8Charcmp(const xmlChar *utf1, const xmlChar *utf2)
{
  return MEMORY[0x270F9C2F8](utf1, utf2);
}

int xmlUTF8Strlen(const xmlChar *utf)
{
  return MEMORY[0x270F9C300](utf);
}

xmlChar *__cdecl xmlUTF8Strndup(const xmlChar *utf, int len)
{
  return (xmlChar *)MEMORY[0x270F9C310](utf, *(void *)&len);
}

int xmlUTF8Strsize(const xmlChar *utf, int len)
{
  return MEMORY[0x270F9C320](utf, *(void *)&len);
}

double xmlXPathCastNodeToNumber(xmlNodePtr node)
{
  MEMORY[0x270F9C350](node);
  return result;
}

xmlChar *__cdecl xmlXPathCastNodeToString(xmlNodePtr node)
{
  return (xmlChar *)MEMORY[0x270F9C358](node);
}

xmlChar *__cdecl xmlXPathCastNumberToString(double val)
{
  return (xmlChar *)MEMORY[0x270F9C360](val);
}

double xmlXPathCastStringToNumber(const xmlChar *val)
{
  MEMORY[0x270F9C368](val);
  return result;
}

int xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node2)
{
  return MEMORY[0x270F9C378](node1, node2);
}

xmlXPathObjectPtr xmlXPathCompiledEval(xmlXPathCompExprPtr comp, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C380](comp, ctx);
}

xmlXPathCompExprPtr xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str)
{
  return (xmlXPathCompExprPtr)MEMORY[0x270F9C3A8](ctxt, str);
}

xmlNodeSetPtr xmlXPathDifference(xmlNodeSetPtr nodes1, xmlNodeSetPtr nodes2)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C3B8](nodes1, nodes2);
}

xmlNodeSetPtr xmlXPathDistinctSorted(xmlNodeSetPtr nodes)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C3C0](nodes);
}

xmlXPathObjectPtr xmlXPathEval(const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D0](str, ctx);
}

void xmlXPathFreeCompExpr(xmlXPathCompExprPtr comp)
{
}

void xmlXPathFreeNodeSet(xmlNodeSetPtr obj)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

int xmlXPathHasSameNodes(xmlNodeSetPtr nodes1, xmlNodeSetPtr nodes2)
{
  return MEMORY[0x270F9C418](nodes1, nodes2);
}

xmlNodeSetPtr xmlXPathIntersection(xmlNodeSetPtr nodes1, xmlNodeSetPtr nodes2)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C428](nodes1, nodes2);
}

int xmlXPathIsNaN(double val)
{
  return MEMORY[0x270F9C438](val);
}

xmlXPathObjectPtr xmlXPathNewBoolean(int val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C448](*(void *)&val);
}

xmlXPathObjectPtr xmlXPathNewCString(const char *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C450](val);
}

xmlXPathObjectPtr xmlXPathNewFloat(double val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C460](val);
}

xmlXPathObjectPtr xmlXPathNewNodeSet(xmlNodePtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C468](val);
}

xmlXPathObjectPtr xmlXPathNewString(const xmlChar *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C478](val);
}

xmlXPathObjectPtr xmlXPathNewValueTree(xmlNodePtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C480](val);
}

xmlNodeSetPtr xmlXPathNodeLeadingSorted(xmlNodeSetPtr nodes, xmlNodePtr node)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C4A0](nodes, node);
}

int xmlXPathNodeSetAdd(xmlNodeSetPtr cur, xmlNodePtr val)
{
  return MEMORY[0x270F9C4A8](cur, val);
}

int xmlXPathNodeSetAddUnique(xmlNodeSetPtr cur, xmlNodePtr val)
{
  return MEMORY[0x270F9C4B0](cur, val);
}

xmlNodeSetPtr xmlXPathNodeSetCreate(xmlNodePtr val)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C4B8](val);
}

void xmlXPathNodeSetSort(xmlNodeSetPtr set)
{
}

xmlNodeSetPtr xmlXPathNodeTrailingSorted(xmlNodeSetPtr nodes, xmlNodePtr node)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C4D0](nodes, node);
}

int xmlXPathPopBoolean(xmlXPathParserContextPtr ctxt)
{
  return MEMORY[0x270F9C4F8](ctxt);
}

void *__cdecl xmlXPathPopExternal(xmlXPathParserContextPtr ctxt)
{
  return (void *)MEMORY[0x270F9C500](ctxt);
}

xmlNodeSetPtr xmlXPathPopNodeSet(xmlXPathParserContextPtr ctxt)
{
  return (xmlNodeSetPtr)MEMORY[0x270F9C508](ctxt);
}

double xmlXPathPopNumber(xmlXPathParserContextPtr ctxt)
{
  MEMORY[0x270F9C510](ctxt);
  return result;
}

xmlChar *__cdecl xmlXPathPopString(xmlXPathParserContextPtr ctxt)
{
  return (xmlChar *)MEMORY[0x270F9C518](ctxt);
}

int xmlXPathRegisterFuncNS(xmlXPathContextPtr ctxt, const xmlChar *name, const xmlChar *ns_uri, xmlXPathFunction f)
{
  return MEMORY[0x270F9C530](ctxt, name, ns_uri, f);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x270F9C538](ctxt, prefix, ns_uri);
}

xmlXPathObjectPtr xmlXPathWrapExternal(void *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C560](val);
}

xmlXPathObjectPtr xmlXPathWrapNodeSet(xmlNodeSetPtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C568](val);
}

xmlXPathObjectPtr xmlXPathWrapString(xmlChar *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C570](val);
}

void xmlXPatherror(xmlXPathParserContextPtr ctxt, const char *file, int line, int no)
{
}

void xsltApplyOneTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr list, xsltTemplatePtr templ, xsltStackElemPtr params)
{
}

xmlDocPtr xsltCreateRVT(xsltTransformContextPtr ctxt)
{
  return (xmlDocPtr)MEMORY[0x270F9C5A0](ctxt);
}

int xsltFlagRVTs(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj, intptr_t val)
{
  return MEMORY[0x270F9C5A8](ctxt, obj, val);
}

void xsltFreeStackElemList(xsltStackElemPtr elem)
{
}

void xsltFunctionNodeSet(xmlXPathParserContextPtr ctxt, int nargs)
{
}

void *__cdecl xsltGetExtData(xsltTransformContextPtr ctxt, const xmlChar *URI)
{
  return (void *)MEMORY[0x270F9C5C0](ctxt, URI);
}

xmlHashTablePtr xsltGetExtInfo(xsltStylesheetPtr style, const xmlChar *URI)
{
  return (xmlHashTablePtr)MEMORY[0x270F9C5C8](style, URI);
}

void xsltInitElemPreComp(xsltElemPreCompPtr comp, xsltStylesheetPtr style, xmlNodePtr inst, xsltTransformFunction function, xsltElemPreCompDeallocator freeFunc)
{
}

void xsltInitGlobals(void)
{
}

void xsltLocalVariablePop(xsltTransformContextPtr ctxt, int limitNr, int level)
{
}

int xsltLocalVariablePush(xsltTransformContextPtr ctxt, xsltStackElemPtr variable, int level)
{
  return MEMORY[0x270F9C5E8](ctxt, variable, *(void *)&level);
}

xsltStylesheetPtr xsltNextImport(xsltStylesheetPtr style)
{
  return (xsltStylesheetPtr)MEMORY[0x270F9C5F0](style);
}

xsltStackElemPtr xsltParseStylesheetCallerParam(xsltTransformContextPtr ctxt, xmlNodePtr cur)
{
  return (xsltStackElemPtr)MEMORY[0x270F9C5F8](ctxt, cur);
}

void xsltParseTemplateContent(xsltStylesheetPtr style, xmlNodePtr templ)
{
}

void xsltPrintErrorContext(xsltTransformContextPtr ctxt, xsltStylesheetPtr style, xmlNodePtr node)
{
}

int xsltRegisterExtFunction(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *URI, xmlXPathFunction function)
{
  return MEMORY[0x270F9C610](ctxt, name, URI, function);
}

int xsltRegisterExtModule(const xmlChar *URI, xsltExtInitFunction initFunc, xsltExtShutdownFunction shutdownFunc)
{
  return MEMORY[0x270F9C618](URI, initFunc, shutdownFunc);
}

int xsltRegisterExtModuleElement(const xmlChar *name, const xmlChar *URI, xsltPreComputeFunction precomp, xsltTransformFunction transform)
{
  return MEMORY[0x270F9C620](name, URI, precomp, transform);
}

int xsltRegisterExtModuleFull(const xmlChar *URI, xsltExtInitFunction initFunc, xsltExtShutdownFunction shutdownFunc, xsltStyleExtInitFunction styleInitFunc, xsltStyleExtShutdownFunction styleShutdownFunc)
{
  return MEMORY[0x270F9C628](URI, initFunc, shutdownFunc, styleInitFunc, styleShutdownFunc);
}

int xsltRegisterExtModuleFunction(const xmlChar *name, const xmlChar *URI, xmlXPathFunction function)
{
  return MEMORY[0x270F9C630](name, URI, function);
}

int xsltRegisterExtModuleTopLevel(const xmlChar *name, const xmlChar *URI, xsltTopLevelFunction function)
{
  return MEMORY[0x270F9C638](name, URI, function);
}

int xsltRegisterLocalRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
{
  return MEMORY[0x270F9C640](ctxt, RVT);
}

void *__cdecl xsltStyleGetExtData(xsltStylesheetPtr style, const xmlChar *URI)
{
  return (void *)MEMORY[0x270F9C648](style, URI);
}

void xsltTransformError(xsltTransformContextPtr ctxt, xsltStylesheetPtr style, xmlNodePtr node, const char *msg, ...)
{
}

xmlXPathCompExprPtr xsltXPathCompileFlags(xsltStylesheetPtr style, const xmlChar *str, int flags)
{
  return (xmlXPathCompExprPtr)MEMORY[0x270F9C658](style, str, *(void *)&flags);
}