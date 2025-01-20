@interface wspQueryIn
- (cNodeRestriction)primaryCnodeRestriction;
- (cNodeRestriction)secondaryCnodeRestriction;
- (id)makePrimaryCnodeRestriction;
- (id)makeSecondaryCnodeRestriction;
- (int)encodePrimaryQuery:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeSecondaryQuery:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (void)makePrimaryCnodeRestriction;
- (void)makeSecondaryCnodeRestriction;
- (void)setPrimaryCnodeRestriction:(id)a3;
- (void)setSecondaryCnodeRestriction:(id)a3;
- (void)setWctx:(id)a3;
- (wspContext)wctx;
- (wspQueryIn)initWithCtx:(id)a3;
@end

@implementation wspQueryIn

- (wspQueryIn)initWithCtx:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)wspQueryIn;
  v6 = [(wspQueryIn *)&v19 init];
  v7 = (wspQueryIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_235FADC70;
    objc_storeStrong((id *)v6 + 3, a3);
    uint64_t v8 = [(wspQueryIn *)v7 makePrimaryCnodeRestriction];
    primaryCnodeRestriction = v7->_primaryCnodeRestriction;
    v7->_primaryCnodeRestriction = (cNodeRestriction *)v8;

    if (!v7->_primaryCnodeRestriction)
    {
      BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v10) {
        -[wspQueryIn initWithCtx:](v10, v11, v12, v13, v14, v15, v16, v17);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (id)makePrimaryCnodeRestriction
{
  v2 = [[cPropertyRestriction alloc] initWithRelop:516 Weight:1000];
  v3 = [[fullPropSpec alloc] initWithPropertyNumber:17];
  v4 = objc_alloc_init(cbaseVariant);
  uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"superhidden", 0);
  -[cbaseVariant setVectorWithType:ValueArray:](v4, "setVectorWithType:ValueArray:", 31);
  v38 = v3;
  [(cPropertyRestriction *)v2 setPropSpec:v3];
  v35 = v4;
  [(cPropertyRestriction *)v2 setPrVal:v4];
  id v5 = [[cRestriction alloc] initWithType:3 Weight:1000];
  [(cRestriction *)v5 setRestriction:v2];
  v6 = [[cPropertyRestriction alloc] initWithRelop:5 Weight:1000];
  v7 = [[fullPropSpec alloc] initWithPropertyNumber:18];
  uint64_t v8 = objc_alloc_init(cbaseVariant);
  [(cbaseVariant *)v8 setStringType:31 UTF8Str:@"true"];
  v36 = v7;
  [(cPropertyRestriction *)v6 setPropSpec:v7];
  [(cPropertyRestriction *)v6 setPrVal:v8];
  v9 = [[cNodeRestriction alloc] initWithType:1 Weight:1000];
  if ([(cNodeRestriction *)v9 appendRestriction:v5])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn makePrimaryCnodeRestriction].cold.5();
    }
LABEL_7:
    BOOL v10 = 0;
    uint64_t v12 = (void *)v37;
    uint64_t v11 = v38;
    uint64_t v13 = v35;
    uint64_t v14 = v36;
    goto LABEL_8;
  }
  if ([(cNodeRestriction *)v9 appendRestriction:v6])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn makePrimaryCnodeRestriction].cold.4();
    }
    goto LABEL_7;
  }
  v32 = [[cPropertyRestriction alloc] initWithRelop:4 Weight:1000];
  uint64_t v16 = [[fullPropSpec alloc] initWithPropertyNumber:19];
  uint64_t v17 = [(wspQueryIn *)self wctx];
  uint64_t v18 = [v17 serverAddress];

  objc_super v19 = (void *)v18;
  v31 = v16;
  if (!v18)
  {
    v20 = [(wspQueryIn *)self wctx];
    objc_super v19 = [v20 serverName];

    if ([v19 hasSuffix:@".local"])
    {
      uint64_t v21 = objc_msgSend(v19, "substringToIndex:", objc_msgSend(v19, "length") - 6);

      objc_super v19 = (void *)v21;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[wspQueryIn makePrimaryCnodeRestriction]();
    }
  }
  v22 = objc_alloc_init(cbaseVariant);
  id v23 = [NSString alloc];
  v24 = v22;
  v25 = [(wspContext *)self->_wctx searchPath];
  v30 = v19;
  uint64_t v26 = [v23 initWithFormat:@"file://%@/%@/", v19, v25];

  v34 = (void *)v26;
  [(cbaseVariant *)v24 setStringType:31 UTF8Str:v26];
  [(cPropertyRestriction *)v32 setPropSpec:v16];
  [(cPropertyRestriction *)v32 setPrVal:v24];
  v27 = [[cNodeRestriction alloc] initWithType:1 Weight:1000];
  v28 = v27;
  v29 = v24;
  if ([(cNodeRestriction *)v27 appendRestriction:v9])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn makePrimaryCnodeRestriction]();
    }
    BOOL v10 = 0;
  }
  else
  {
    if ([(cNodeRestriction *)v27 appendRestriction:v32])
    {
      uint64_t v12 = (void *)v37;
      uint64_t v11 = v38;
      uint64_t v13 = v35;
      uint64_t v14 = v36;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryIn makePrimaryCnodeRestriction]();
      }
      BOOL v10 = 0;
      goto LABEL_25;
    }
    BOOL v10 = v27;
  }
  uint64_t v12 = (void *)v37;
  uint64_t v11 = v38;
  uint64_t v13 = v35;
  uint64_t v14 = v36;
LABEL_25:

LABEL_8:

  return v10;
}

- (id)makeSecondaryCnodeRestriction
{
  uint64_t v265 = *MEMORY[0x263EF8340];
  uint64_t v261 = 0;
  uint64_t v262 = 0;
  uint64_t v260 = 0;
  v3 = [reuseWhereRestriction alloc];
  v4 = [(wspQueryIn *)self wctx];
  uint64_t v5 = -[reuseWhereRestriction initWithReuseWhereID:Weight:](v3, "initWithReuseWhereID:Weight:", [v4 whereID], 1000);

  v251 = (void *)v5;
  if (!v5)
  {
    BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v25) {
      [(wspQueryIn *)v25 makeSecondaryCnodeRestriction];
    }
    goto LABEL_15;
  }
  unint64_t v6 = 0x264C97000uLL;
  v7 = [[cnodeBuilder alloc] initWithType:1 Weight:1000];
  if (!v7)
  {
    BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v33) {
      [(wspQueryIn *)v33 makeSecondaryCnodeRestriction];
    }
LABEL_15:
    id v248 = 0;
    uint64_t v11 = 0;
    v41 = 0;
    v42 = 0;
    v22 = 0;
    v24 = 0;
    v43 = 0;
    id v44 = 0;
    id v23 = 0;
    uint64_t v17 = 0;
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  v9 = [(wspQueryIn *)self wctx];
  char v10 = [v9 queryType];

  if ((v10 & 2) == 0)
  {
    uint64_t v11 = 0;
    v243 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    v239 = 0;
    uint64_t v14 = 0;
    goto LABEL_5;
  }
  v46 = [[cnodeBuilder alloc] initWithType:2 Weight:1000];
  if (!v46)
  {
    BOOL v77 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v77) {
      [(wspQueryIn *)v77 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    uint64_t v11 = 0;
    v41 = 0;
    v42 = 0;
    v22 = 0;
    v24 = 0;
    v43 = 0;
    id v44 = 0;
    id v23 = 0;
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  uint64_t v17 = v46;
  long long v258 = 0u;
  long long v259 = 0u;
  long long v256 = 0u;
  long long v257 = 0u;
  v47 = [(wspQueryIn *)self wctx];
  v48 = [v47 fnamePatterns];

  uint64_t v49 = [v48 countByEnumeratingWithState:&v256 objects:v264 count:16];
  if (!v49)
  {

    v43 = 0;
    v24 = 0;
    v22 = 0;
    v51 = 0;
    uint64_t v11 = 0;
    goto LABEL_59;
  }
  v232 = v8;
  id obja = v48;
  v226 = self;
  uint64_t v50 = 0;
  uint64_t v11 = 0;
  v51 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v52 = 0;
  id v53 = 0;
  uint64_t v240 = *(void *)v257;
  v241 = v17;
  do
  {
    v54 = 0;
    v237 = (char *)v49;
    uint64_t v224 = v50;
    uint64_t v228 = v50 + v49;
    v55 = v11;
    v56 = v51;
    v57 = v12;
    v24 = v13;
    id v249 = v52;
    v58 = v53;
    do
    {
      v246 = v55;
      if (*(void *)v257 != v240)
      {
        v59 = v54;
        objc_enumerationMutation(obja);
        v54 = v59;
      }
      v60 = v54;
      id v244 = *(id *)(*((void *)&v256 + 1) + 8 * (void)v54);

      v61 = [[fullPropSpec alloc] initWithPropertyNumber:23];
      v24 = v61;
      if (!v61)
      {
        BOOL v112 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v112) {
          [(wspQueryIn *)v112 makeSecondaryCnodeRestriction];
        }
LABEL_73:
        uint64_t v8 = v232;
        v43 = v249;
LABEL_77:

        id v248 = 0;
        v41 = 0;
        id v23 = 0;
        id v44 = v244;
        uint64_t v11 = v246;
        v42 = v56;
        v22 = v57;
        uint64_t v17 = v241;
        goto LABEL_16;
      }
      uint64_t v12 = [[cPropertyRestriction alloc] initWithRelop:6 Weight:1000];

      if (!v12)
      {
        BOOL v120 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v120) {
          [(wspQueryIn *)v120 makeSecondaryCnodeRestriction];
        }
        v57 = 0;
        goto LABEL_73;
      }
      id v53 = v244;
      v43 = (void *)[[NSString alloc] initWithFormat:@"*%@*", v244];

      v51 = objc_alloc_init(cbaseVariant);
      [(cbaseVariant *)v51 setStringType:31 UTF8Str:v43];
      uint64_t v13 = v24;
      [(cPropertyRestriction *)v12 setPropSpec:v24];
      [(cPropertyRestriction *)v12 setPrVal:v51];
      v62 = [[cCoercionRestriction alloc] initWithOp:12 FValue:1148846080 Weight:1000];

      if (!v62)
      {
        BOOL v128 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v128) {
          [(wspQueryIn *)v128 makeSecondaryCnodeRestriction];
        }
        v246 = 0;
        v56 = v51;
        v57 = v12;
        uint64_t v8 = v232;
        goto LABEL_77;
      }
      [(cCoercionRestriction *)v62 setRestriction:v12];
      [(cnodeBuilder *)v241 appendRestriction:v62];
      v54 = v60 + 1;
      v55 = v62;
      v56 = v51;
      uint64_t v11 = v62;
      v57 = v12;
      id v249 = v43;
      v52 = v43;
      v58 = v244;
    }
    while (v237 != v54);
    uint64_t v49 = [obja countByEnumeratingWithState:&v256 objects:v264 count:16];
    uint64_t v50 = v228;
  }
  while (v49);
  v239 = v52;

  if (&v237[v224] == (char *)1)
  {
    v243 = v51;
    uint64_t v17 = v241;
    v201 = [(cnodeBuilder *)v241 rootNode];
    v202 = [v201 restrictArray];
    uint64_t v203 = [v202 objectAtIndex:0];

    uint64_t v8 = v232;
    self = v226;
    if (v203)
    {
      [(cnodeBuilder *)v232 appendRestriction:v203];
      uint64_t v11 = (cCoercionRestriction *)v203;
      goto LABEL_115;
    }
    v24 = v13;
    v22 = v12;
    BOOL v205 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v205) {
      [(wspQueryIn *)v205 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    uint64_t v11 = 0;
    v41 = 0;
    goto LABEL_85;
  }
  uint64_t v8 = v232;
  uint64_t v17 = v241;
  self = v226;
  if (!&v237[v224])
  {
    v24 = v13;
    v22 = v12;
    v43 = v52;
LABEL_59:
    v42 = v51;
    BOOL v91 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v91) {
      [(wspQueryIn *)v91 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    v41 = 0;
    id v44 = 0;
    id v23 = 0;
    goto LABEL_16;
  }
  v243 = v51;
  v204 = [(cnodeBuilder *)v241 rootNode];
  [(cnodeBuilder *)v232 appendRestriction:v204];

LABEL_115:
  uint64_t v14 = v17;
  unint64_t v6 = 0x264C97000;
LABEL_5:
  uint64_t v15 = [(wspQueryIn *)self wctx];
  char v16 = [v15 queryType];

  if ((v16 & 4) == 0)
  {
    obj = 0;
    uint64_t v17 = v14;
    goto LABEL_7;
  }
  uint64_t v17 = (cnodeBuilder *)[objc_alloc(*(Class *)(v6 + 1536)) initWithType:2 Weight:1000];

  if (!v17)
  {
    v24 = v13;
    v22 = v12;
    BOOL v99 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v99) {
      [(wspQueryIn *)v99 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    v41 = 0;
    id v44 = 0;
    id v23 = 0;
    uint64_t v17 = 0;
    goto LABEL_86;
  }
  long long v254 = 0u;
  long long v255 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  v63 = [(wspQueryIn *)self wctx];
  v64 = [v63 fextPatterns];

  uint64_t v65 = [v64 countByEnumeratingWithState:&v252 objects:v263 count:16];
  if (!v65)
  {
    v24 = v13;

    v41 = 0;
    v43 = v239;
LABEL_79:
    v22 = v12;
    BOOL v136 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v136) {
      [(wspQueryIn *)v136 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    id v44 = 0;
    id v23 = 0;
    goto LABEL_87;
  }
  id v238 = v64;
  v227 = self;
  v229 = v12;
  v66 = v11;
  v242 = v17;
  v233 = v8;
  v67 = 0;
  v68 = 0;
  id v69 = 0;
  v247 = v13;
  id v250 = *(id *)v253;
  while (2)
  {
    uint64_t v70 = 0;
    uint64_t v71 = v65;
    v225 = v67;
    objb = &v67[v65];
    uint64_t v11 = v66;
    v72 = v68;
    v73 = v247;
    v74 = v69;
    while (2)
    {
      if (*(id *)v253 != v250) {
        objc_enumerationMutation(v238);
      }
      id v44 = *(id *)(*((void *)&v252 + 1) + 8 * v70);

      v75 = [[fullPropSpec alloc] initWithPropertyNumber:24];
      v247 = v75;
      if (!v75)
      {
        BOOL v168 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        v43 = v239;
        if (v168) {
          [(wspQueryIn *)v168 makeSecondaryCnodeRestriction];
        }
        goto LABEL_106;
      }
      v68 = [[cContentRestriction alloc] initWithMethod:1 Weight:1000];

      v43 = v239;
      if (!v68)
      {
        BOOL v176 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v176) {
          [(wspQueryIn *)v176 makeSecondaryCnodeRestriction];
        }
        v72 = 0;
        goto LABEL_106;
      }
      if ([(cContentRestriction *)v68 setPhrase:v44])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspQueryIn makeSecondaryCnodeRestriction]4();
        }
        goto LABEL_105;
      }
      v73 = v247;
      [(cContentRestriction *)v68 setPropSpec:v247];
      v76 = [[cCoercionRestriction alloc] initWithOp:12 FValue:1148846080 Weight:1000];

      if (!v76)
      {
        BOOL v184 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v184) {
          [(wspQueryIn *)v184 makeSecondaryCnodeRestriction];
        }
        uint64_t v11 = 0;
LABEL_105:
        v72 = v68;
LABEL_106:
        v22 = v229;

        id v248 = 0;
        id v23 = 0;
        v41 = v72;
        uint64_t v8 = v233;
        uint64_t v17 = v242;
        v42 = v243;
        v24 = v247;
        goto LABEL_16;
      }
      [(cCoercionRestriction *)v76 setRestriction:v68];
      [(cnodeBuilder *)v242 appendRestriction:v76];
      ++v70;
      uint64_t v11 = v76;
      id v69 = v44;
      v72 = v68;
      v74 = v44;
      if (v71 != v70) {
        continue;
      }
      break;
    }
    v66 = v76;
    uint64_t v65 = [v238 countByEnumeratingWithState:&v252 objects:v263 count:16];
    v67 = objb;
    if (v65) {
      continue;
    }
    break;
  }
  obj = v68;

  if (&v225[v71] == (char *)1)
  {
    uint64_t v17 = v242;
    v213 = [(cnodeBuilder *)v242 rootNode];
    v214 = [v213 restrictArray];
    uint64_t v11 = [v214 objectAtIndex:0];

    if (v11)
    {
      uint64_t v8 = v233;
      [(cnodeBuilder *)v233 appendRestriction:v11];
      uint64_t v12 = v229;
      uint64_t v13 = v247;
      goto LABEL_122;
    }
    BOOL v216 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v216) {
      [(wspQueryIn *)v216 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    uint64_t v11 = 0;
    id v44 = 0;
    id v23 = 0;
    v22 = v229;
    uint64_t v8 = v233;
    v43 = v239;
    uint64_t v17 = v242;
    v42 = v243;
    v24 = v247;
    v41 = obj;
    goto LABEL_16;
  }
  uint64_t v12 = v229;
  uint64_t v8 = v233;
  if (!&v225[v71])
  {
    v43 = v239;
    uint64_t v17 = v242;
    v24 = v247;
    uint64_t v11 = v76;
    v41 = obj;
    goto LABEL_79;
  }
  uint64_t v17 = v242;
  v215 = [(cnodeBuilder *)v242 rootNode];
  [(cnodeBuilder *)v233 appendRestriction:v215];

  uint64_t v13 = v247;
  uint64_t v11 = v76;
LABEL_122:
  self = v227;
LABEL_7:
  uint64_t v18 = [(wspQueryIn *)self wctx];
  char v19 = [v18 queryType];

  if ((v19 & 1) == 0)
  {
    v231 = v8;
    v245 = v13;
    goto LABEL_9;
  }
  v85 = [[fullPropSpec alloc] initWithPropertyNumber:9];

  if (!v85)
  {
    v22 = v12;
    BOOL v144 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    v41 = obj;
    if (v144) {
      [(wspQueryIn *)v144 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    v24 = 0;
LABEL_85:
    id v44 = 0;
    id v23 = 0;
LABEL_86:
    v43 = v239;
    goto LABEL_87;
  }
  v230 = v12;
  v231 = v8;
  v86 = self;
  v42 = v243;
  v87 = [[cContentRestriction alloc] initWithMethod:1 Weight:1000];

  if (!v87)
  {
    BOOL v152 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v152) {
      [(wspQueryIn *)v152 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    v41 = 0;
    id v44 = 0;
    id v23 = 0;
    v24 = v85;
LABEL_91:
    v43 = v239;
    v22 = v230;
    goto LABEL_16;
  }
  v245 = v85;
  v88 = [(wspQueryIn *)v86 wctx];
  v89 = [v88 contentPattern];
  int v90 = [(cContentRestriction *)v87 setPhrase:v89];

  if (v90)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.7();
    }
    id v248 = 0;
    goto LABEL_57;
  }
  [(cContentRestriction *)v87 setPropSpec:v245];
  v192 = [[cCoercionRestriction alloc] initWithOp:12 FValue:1148846080 Weight:1000];

  if (!v192)
  {
    BOOL v193 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v193) {
      [(wspQueryIn *)v193 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    uint64_t v11 = 0;
LABEL_57:
    id v44 = 0;
    id v23 = 0;
    v41 = v87;
    v24 = v245;
    goto LABEL_91;
  }
  [(cCoercionRestriction *)v192 setRestriction:v87];
  [(cnodeBuilder *)v8 appendRestriction:v192];
  uint64_t v11 = v192;
  obj = v87;
  uint64_t v12 = v230;
  self = v86;
LABEL_9:
  v20 = [(wspQueryIn *)self wctx];
  char v21 = [v20 queryType];

  if ((v21 & 8) == 0)
  {
    v22 = v12;
    id v23 = 0;
    uint64_t v8 = v231;
    v24 = v245;
    goto LABEL_67;
  }
  v107 = [[fullPropSpec alloc] initWithPropertyNumber:1];

  if (v107)
  {
    v22 = [[cPropertyRestriction alloc] initWithRelop:3 Weight:1000];

    v108 = [(wspQueryIn *)self wctx];
    uint64_t v261 = [v108 modDateSpec];
    uint64_t v262 = v109;

    smb_time_local2NT(&v261, &v260, 0);
    id v110 = objc_alloc(NSNumber);
    id v23 = (void *)[v110 initWithUnsignedLongLong:v260];
    v111 = objc_alloc_init(cbaseVariant);

    [(cbaseVariant *)v111 setScalarType:64 ScalarValue:v23];
    [(cPropertyRestriction *)v22 setPropSpec:v107];
    [(cPropertyRestriction *)v22 setPrVal:v111];
    uint64_t v8 = v231;
    [(cnodeBuilder *)v231 appendRestriction:v22];
    v243 = v111;
    v24 = v107;
LABEL_67:
    [(cnodeBuilder *)v8 appendRestriction:v251];
    id v248 = [(cnodeBuilder *)v8 rootNode];
    id v44 = 0;
    v43 = v239;
    v41 = obj;
LABEL_87:
    v42 = v243;
  }
  else
  {
    v22 = v12;
    BOOL v160 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    v43 = v239;
    v41 = obj;
    if (v160) {
      [(wspQueryIn *)v160 makeSecondaryCnodeRestriction];
    }
    id v248 = 0;
    v24 = 0;
    id v44 = 0;
    id v23 = 0;
    v42 = v243;
    uint64_t v8 = v231;
  }
LABEL_16:

  return v248;
}

- (int)encodePrimaryQuery:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned int v149 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]2();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]();
    }
LABEL_7:
    int v13 = 12;
    goto LABEL_8;
  }
  uint64_t v15 = v12;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v12 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  if (v10 == 20)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(unsigned char *)(v12 + a4 + 20) = 1;
  unsigned int v16 = a4 + 21;
  size_t v17 = v10 - 21;
  size_t v18 = align4Pad(a4 + 21);
  if (v17 < v18)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_7;
  }
  bzero((void *)(v15 + v16), v18);
  unint64_t v19 = v17 - v18;
  if (v19 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.5();
    }
    goto LABEL_7;
  }
  id v134 = v11;
  unsigned int v20 = v18 + v16;
  id objc = [(wspQueryIn *)self wctx];
  char v21 = [objc pidMap];
  v22 = [v21 columnSet];
  int __src = [v22 count];

  *(_DWORD *)(v15 + v20) = __src;
  unsigned int v23 = v20 + 4;
  unint64_t v24 = v19 - 4;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  BOOL v25 = [(wspQueryIn *)self wctx];
  uint64_t v26 = [v25 pidMap];
  uint64_t v27 = [v26 columnSet];

  id obj = v27;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v144 objects:v151 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    id v135 = v8;
    uint64_t v30 = v15;
    uint64_t v132 = a5;
    id v31 = 0;
    uint64_t v32 = *(void *)v145;
    while (2)
    {
      uint64_t v33 = 0;
      uint64_t v34 = v31;
      do
      {
        if (*(void *)v145 != v32) {
          objc_enumerationMutation(obj);
        }
        id v31 = *(id *)(*((void *)&v144 + 1) + 8 * v33);

        int __src = [v31 unsignedIntegerValue];
        if (v24 <= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]1();
          }

LABEL_38:
          int v13 = 12;
LABEL_39:
          id v8 = v135;
          goto LABEL_8;
        }
        *(_DWORD *)(v30 + v23) = __src;
        v23 += 4;
        v24 -= 4;
        ++v33;
        uint64_t v34 = v31;
      }
      while (v29 != v33);
      uint64_t v29 = [obj countByEnumeratingWithState:&v144 objects:v151 count:16];
      if (v29) {
        continue;
      }
      break;
    }

    a5 = v132;
    uint64_t v15 = v30;
    id v8 = v135;
  }

  if (!v24)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.6();
    }
    goto LABEL_7;
  }
  *(unsigned char *)(v15 + v23) = 1;
  uint64_t v35 = [cRestrictionArray alloc];
  uint64_t v36 = [(wspQueryIn *)self primaryCnodeRestriction];
  uint64_t v37 = [(cRestrictionArray *)v35 initWithRestriction:v36];

  int v38 = [(cRestrictionArray *)v37 encodeBuffer:v134 BufferOffset:v23 + 1 BytesWritten:&v149];
  if (!v38)
  {
    unint64_t v39 = v24 + ~(unint64_t)v149;
    if (v39)
    {
      uint64_t v131 = v149;
      unsigned int v40 = v149 + v23 + 1;
      *(unsigned char *)(v15 + v40) = 1;
      unsigned int v41 = v40 + 1;
      size_t v42 = v39 - 1;
      size_t v43 = align4Pad(v40 + 1);
      if (v42 >= v43)
      {
        id obja = (id)v43;
        bzero((void *)(v15 + v41), v43);
        unint64_t v44 = v42 - (void)obja;
        if (v44 > 3)
        {
          unsigned int v45 = obja + v41;
          int __src = 1;
          *(_DWORD *)(v15 + obja + v41) = 1;
          if (v44 - 4 > 3)
          {
            id v135 = v8;
            uint64_t v133 = a5;
            uint64_t v127 = self;
            BOOL v128 = v37;
            int __src = 0;
            *(_DWORD *)(v15 + v45 + 4) = 0;
            if (v44 - 8 <= 3)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]1();
              }
              goto LABEL_58;
            }
            uint64_t v46 = 0;
            uint64_t v47 = 0;
            int v48 = 0;
            unsigned int v126 = a4 + 16;
            int v49 = 3;
            *(_DWORD *)(v15 + v45 + 8) = 3;
            int __src = 3;
            int v129 = obja + v23 + v131;
            uint64_t v50 = v24 - (void)obja - v131;
            while (1)
            {
              if ((unint64_t)(v50 + v46 - 14) <= 3)
              {
                int __src = v49;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]2();
                }
                goto LABEL_58;
              }
              *(_DWORD *)(v15 + (v129 + v47 + 14)) = v48;
              if ((unint64_t)(v50 + v46 - 18) <= 3)
              {
                int __src = v48;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]3();
                }
                goto LABEL_58;
              }
              *(_DWORD *)(v15 + (v129 + v47 + 18)) = v47 != 32;
              if ((unint64_t)(v50 + v46 - 22) <= 3)
              {
                int __src = v47 != 32;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]4();
                }
                goto LABEL_58;
              }
              uint64_t v51 = v46;
              *(_DWORD *)(v15 + (v129 + v47 + 22)) = 0;
              if ((unint64_t)(v50 + v46 - 26) <= 3) {
                break;
              }
              v52 = (void *)MEMORY[0x263EFF960];
              id v53 = [MEMORY[0x263EFF960] currentLocale];
              v54 = [v53 localeIdentifier];
              int v49 = [v52 windowsLocaleCodeFromLocaleIdentifier:v54];

              *(_DWORD *)(v15 + (v129 + v47 + 26)) = v49;
              ++v48;
              v47 += 16;
              uint64_t v46 = v51 - 16;
              if (v47 == 48)
              {
                uint64_t v130 = v15;
                int __src = v49;
                if (v50 - 14 == v47)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]6();
                  }
                  goto LABEL_58;
                }
                *(unsigned char *)(v15 + obja + v23 + v131 + 62) = 0;
                uint64_t v55 = obja + v23 + v131 + v47 + 15;
                unint64_t v56 = v50 - v47 - 15;
                unsigned int v57 = align4Pad(obja + v23 + v131 + 63);
                if (v57)
                {
                  uint64_t v58 = v57;
                  if (v56 < v57)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]9();
                    }
                    goto LABEL_58;
                  }
                  int __src = 0;
                  memcpy((void *)(v15 + v55), &__src, v57);
                  uint64_t v55 = v58 + obja + v23 + v131 + 48 + 15;
                  unint64_t v56 = v50 - v58 - v47 - 15;
                }
                objb = objc_alloc_init(cRowsetProperties);
                if (objb)
                {
                  [(cRowsetProperties *)objb setBooleanOptions:4194307];
                  int v59 = [(cRowsetProperties *)objb encodeBuffer:v134 BufferOffset:v55 BytesWritten:&v149];
                  if (v59)
                  {
                    int v13 = v59;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]8();
                    }
LABEL_85:

                    goto LABEL_39;
                  }
                  unint64_t v68 = v56 - v149;
                  if (v68 <= 3)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]8();
                    }
                    goto LABEL_91;
                  }
                  unsigned int v69 = v149 + v55;
                  uint64_t v70 = [(wspQueryIn *)v127 wctx];
                  uint64_t v71 = [v70 pidMap];
                  v72 = [v71 pidMap];
                  int v73 = [v72 count];

                  int __src = v73 + 3;
                  *(_DWORD *)(v15 + v69) = v73 + 3;
                  uint64_t v74 = v69 + 4;
                  unint64_t v75 = v68 - 4;
                  long long v140 = 0u;
                  long long v141 = 0u;
                  long long v142 = 0u;
                  long long v143 = 0u;
                  v76 = [(wspQueryIn *)v127 wctx];
                  BOOL v77 = [v76 pidMap];
                  uint64_t v78 = [v77 pidMap];

                  uint64_t v79 = v78;
                  uint64_t v80 = [v78 countByEnumeratingWithState:&v140 objects:v150 count:16];
                  if (v80)
                  {
                    uint64_t v81 = v80;
                    uint64_t v82 = 0;
                    uint64_t v83 = *(void *)v141;
                    while (2)
                    {
                      uint64_t v84 = 0;
                      v85 = v82;
                      do
                      {
                        if (*(void *)v141 != v83) {
                          objc_enumerationMutation(v79);
                        }
                        uint64_t v82 = (fullPropSpec *)*(id *)(*((void *)&v140 + 1) + 8 * v84);

                        int v86 = [(fullPropSpec *)v82 encodeBuffer:v134 BufferOffset:v74 BytesWritten:&v149];
                        if (v86)
                        {
                          int v13 = v86;
                          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]7();
                          }

                          goto LABEL_108;
                        }
                        uint64_t v74 = v149 + v74;
                        v75 -= v149;
                        ++v84;
                        v85 = v82;
                      }
                      while (v81 != v84);
                      uint64_t v81 = [v79 countByEnumeratingWithState:&v140 objects:v150 count:16];
                      if (v81) {
                        continue;
                      }
                      break;
                    }
                  }
                  v87 = [[fullPropSpec alloc] initWithPropertyNumber:17];
                  if (!v87)
                  {
                    BOOL v89 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                    if (v89) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]9(v89, v90, v91, v92, v93, v94, v95, v96);
                    }
                    goto LABEL_91;
                  }
                  uint64_t v82 = v87;
                  int v88 = [(fullPropSpec *)v87 encodeBuffer:v134 BufferOffset:v74 BytesWritten:&v149];
                  if (v88)
                  {
                    int v13 = v88;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]6();
                    }
LABEL_108:

                    goto LABEL_85;
                  }
                  uint64_t v97 = v149;
                  uint64_t v98 = [[fullPropSpec alloc] initWithPropertyNumber:18];

                  if (!v98)
                  {
                    BOOL v101 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                    if (v101) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]0(v101, v102, v103, v104, v105, v106, v107, v108);
                    }
                    goto LABEL_91;
                  }
                  int v99 = v97 + v74;
                  int v100 = [(fullPropSpec *)v98 encodeBuffer:v134 BufferOffset:(v97 + v74) BytesWritten:&v149];
                  if (v100)
                  {
                    int v13 = v100;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]5();
                    }

                    goto LABEL_85;
                  }
                  uint64_t v109 = v149;
                  id v110 = [[fullPropSpec alloc] initWithPropertyNumber:19];

                  if (!v110)
                  {
                    BOOL v113 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                    if (v113) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]1(v113, v114, v115, v116, v117, v118, v119, v120);
                    }
                    goto LABEL_91;
                  }
                  int v111 = v109 + v99;
                  int v112 = [(fullPropSpec *)v110 encodeBuffer:v134 BufferOffset:(v109 + v99) BytesWritten:&v149];
                  if (v112)
                  {
                    int v13 = v112;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]4();
                    }

                    goto LABEL_85;
                  }
                  unint64_t v121 = v75 - v149 - (v97 + v109);
                  if (v121 <= 3)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]2();
                    }
LABEL_131:

LABEL_91:
                    goto LABEL_58;
                  }
                  int v122 = v149 + v111;
                  int __src = 0;
                  *(_DWORD *)(v130 + v149 + v111) = 0;
                  if (v121 - 4 <= 3)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]3();
                    }
                    goto LABEL_131;
                  }
                  uint64_t v123 = (void *)MEMORY[0x263EFF960];
                  uint64_t v124 = [MEMORY[0x263EFF960] currentLocale];
                  uint64_t v125 = [v124 localeIdentifier];
                  LODWORD(v123) = [v123 windowsLocaleCodeFromLocaleIdentifier:v125];
                  int __src = (int)v123;

                  *(_DWORD *)(v130 + (v122 + 4)) = v123;
                  int __src = v122 - 8;
                  *(_DWORD *)(v130 + v126) = v122 - 8;
                  *(_DWORD *)(v130 + 8) = getChecksum32(202, (int *)(v130 + 16), v122 - 8);
                  *uint64_t v133 = v122 + 8;

                  int v13 = 0;
                  goto LABEL_39;
                }
                BOOL v60 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v60) {
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]7(v60, v61, v62, v63, v64, v65, v66, v67);
                }
LABEL_58:

                goto LABEL_38;
              }
            }
            int __src = 0;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]5();
            }
            goto LABEL_58;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]0();
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.9();
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.8();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.7();
    }

    goto LABEL_7;
  }
  int v13 = v38;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]0();
  }

LABEL_8:
  return v13;
}

- (int)encodeSecondaryQuery:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned int v129 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]8();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]();
    }
LABEL_7:
    int v13 = 12;
    goto LABEL_8;
  }
  uint64_t v15 = (unsigned char *)v12;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v12 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  if (v10 == 20)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(unsigned char *)(v12 + a4 + 20) = 1;
  unsigned int v16 = a4 + 21;
  size_t v17 = v10 - 21;
  size_t v18 = align4Pad(a4 + 21);
  if (v17 < v18)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_7;
  }
  bzero(&v15[v16], v18);
  unint64_t v19 = v17 - v18;
  if (v19 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.5();
    }
    goto LABEL_7;
  }
  int v20 = v18 + v16;
  id objb = [(wspQueryIn *)self wctx];
  [objb pidMap];
  char v21 = v116 = self;
  v22 = [v21 columnSet];
  int v114 = [v22 count];

  *(_DWORD *)&v15[v20] = v114;
  int v23 = v18 + 25;
  unsigned int v24 = v20 + 4;
  unint64_t v25 = v19 - 4;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id objc = [(wspQueryIn *)v116 wctx];
  uint64_t v26 = [objc pidMap];
  uint64_t v27 = [v26 columnSet];

  id obj = v27;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v125 objects:v131 count:16];
  if (!v28) {
    goto LABEL_30;
  }
  uint64_t v29 = v28;
  id v112 = v11;
  id v115 = v8;
  uint64_t v30 = v15;
  id v110 = a5;
  id v31 = 0;
  uint64_t v32 = *(void *)v126;
  do
  {
    uint64_t v33 = 0;
    uint64_t v34 = v31;
    do
    {
      if (*(void *)v126 != v32) {
        objc_enumerationMutation(obj);
      }
      id v31 = *(id *)(*((void *)&v125 + 1) + 8 * v33);

      int v35 = [v31 unsignedIntegerValue];
      if (v25 <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]7();
        }

        goto LABEL_39;
      }
      *(_DWORD *)&v30[v24] = v35;
      v23 += 4;
      v24 += 4;
      v25 -= 4;
      ++v33;
      uint64_t v34 = v31;
    }
    while (v29 != v33);
    uint64_t v29 = [obj countByEnumeratingWithState:&v125 objects:v131 count:16];
  }
  while (v29);

  a5 = v110;
  id v11 = v112;
  uint64_t v15 = v30;
  id v8 = v115;
LABEL_30:

  if (!v25)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.6();
    }
    goto LABEL_7;
  }
  id v113 = v11;
  v15[v24] = 1;
  uint64_t v36 = [(wspQueryIn *)v116 makeSecondaryCnodeRestriction];
  if (!v36)
  {
    BOOL v40 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v40) {
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.7(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_7;
  }
  uint64_t v37 = (cRowsetProperties *)v36;
  id obja = (int *)v15;
  int v38 = [[cRestrictionArray alloc] initWithRestriction:v36];
  int v39 = [(cRestrictionArray *)v38 encodeBuffer:v113 BufferOffset:v24 + 1 BytesWritten:&v129];
  if (!v39)
  {
    unint64_t v48 = v25 + ~(unint64_t)v129;
    if (!v48)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.7();
      }

      goto LABEL_7;
    }
    id v115 = v8;
    uint64_t v106 = v129;
    unsigned int v49 = v129 + v24 + 1;
    *((unsigned char *)obja + v49) = 1;
    unsigned int v50 = v49 + 1;
    size_t v51 = v48 - 1;
    size_t v52 = align4Pad(v49 + 1);
    if (v51 < v52)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.8();
      }
LABEL_58:

      goto LABEL_39;
    }
    size_t v108 = v52;
    bzero((char *)obja + v50, v52);
    unint64_t v53 = v51 - v108;
    if (v53 <= 3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.9();
      }
      goto LABEL_58;
    }
    int v54 = v108 + v50;
    *(int *)((char *)obja + v108 + v50) = 1;
    if (v53 - 4 <= 3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]0();
      }
      goto LABEL_58;
    }
    int v111 = a5;
    uint64_t v103 = v37;
    uint64_t v104 = v38;
    *(int *)((char *)obja + (v54 + 4)) = 0;
    if (v53 - 8 > 3)
    {
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      int v58 = 0;
      unsigned int v101 = a4 + 16;
      int v59 = (char *)obja;
      *(int *)((char *)obja + (v54 + 8)) = 3;
      int v102 = v108 + v23 + v106;
      int v60 = v108 + v24 + v106;
      uint64_t v105 = v25 - v108 - v106;
      do
      {
        if ((unint64_t)(v105 + v56 - 14) <= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]2();
          }
          goto LABEL_62;
        }
        *(_DWORD *)&v59[(v60 + v57 + 14)] = v58;
        if ((unint64_t)(v105 + v56 - 18) <= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]3();
          }
          goto LABEL_62;
        }
        *(_DWORD *)&v59[(v60 + v57 + 18)] = v57 != 32;
        if ((unint64_t)(v105 + v56 - 22) <= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]4();
          }
          goto LABEL_62;
        }
        *(_DWORD *)&v59[(v60 + v57 + 22)] = 0;
        if ((unint64_t)(v105 + v56 - 26) <= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]5();
          }
          goto LABEL_62;
        }
        uint64_t v61 = v59;
        uint64_t v62 = (void *)MEMORY[0x263EFF960];
        uint64_t v63 = [MEMORY[0x263EFF960] currentLocale];
        uint64_t v64 = [v63 localeIdentifier];
        LODWORD(v62) = [v62 windowsLocaleCodeFromLocaleIdentifier:v64];

        *(_DWORD *)&v61[(v60 + v57 + 26)] = v62;
        ++v58;
        v57 += 16;
        v56 -= 16;
        int v59 = v61;
      }
      while (v57 != 48);
      if (v105 - 14 == v57)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]7();
        }
      }
      else
      {
        *((unsigned char *)obja + v108 + v24 + v106 + 62) = 0;
        int v65 = v102 + 63;
        uint64_t v66 = v108 + v24 + v106 + v57 + 15;
        unint64_t v67 = v105 - v57 - 15;
        unsigned int v68 = align4Pad(v108 + v24 + v106 + 63);
        if (v68)
        {
          if (v67 < v68)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]5();
            }
            goto LABEL_62;
          }
          v65 += v68;
          uint64_t v66 = v68 + v108 + v24 + v106 + 48 + 15;
          unint64_t v67 = v105 - v68 - v57 - 15;
        }
        uint64_t v107 = objc_alloc_init(cRowsetProperties);
        if (v107)
        {
          [(cRowsetProperties *)v107 setBooleanOptions:8404995];
          int v69 = [(cRowsetProperties *)v107 encodeBuffer:v113 BufferOffset:v66 BytesWritten:&v129];
          if (v69)
          {
            int v13 = v69;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]4();
            }
LABEL_90:

            goto LABEL_40;
          }
          unsigned int v78 = v129;
          unint64_t v79 = v67 - v129;
          if (v79 > 3)
          {
            unsigned int v80 = v129 + v66;
            uint64_t v81 = [(wspQueryIn *)v116 wctx];
            uint64_t v82 = [v81 pidMap];
            uint64_t v83 = [v82 pidMap];
            int v84 = [v83 count];

            *(int *)((char *)obja + v80) = v84;
            int v109 = v65 + v78 + 4;
            uint64_t v85 = v80 + 4;
            long long v123 = 0u;
            long long v124 = 0u;
            unint64_t v86 = v79 - 4;
            long long v121 = 0u;
            long long v122 = 0u;
            v87 = [(wspQueryIn *)v116 wctx];
            int v88 = [v87 pidMap];
            BOOL v89 = [v88 pidMap];

            uint64_t v90 = [v89 countByEnumeratingWithState:&v121 objects:v130 count:16];
            if (v90)
            {
              uint64_t v91 = v90;
              id v92 = 0;
              uint64_t v93 = *(void *)v122;
              while (2)
              {
                uint64_t v94 = 0;
                uint64_t v95 = v92;
                do
                {
                  if (*(void *)v122 != v93) {
                    objc_enumerationMutation(v89);
                  }
                  id v92 = *(id *)(*((void *)&v121 + 1) + 8 * v94);

                  int v96 = [v92 encodeBuffer:v113 BufferOffset:v85 BytesWritten:&v129];
                  if (v96)
                  {
                    int v13 = v96;
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]3();
                    }

                    goto LABEL_90;
                  }
                  v109 += v129;
                  uint64_t v85 = v129 + v85;
                  v86 -= v129;
                  ++v94;
                  uint64_t v95 = v92;
                }
                while (v91 != v94);
                uint64_t v91 = [v89 countByEnumeratingWithState:&v121 objects:v130 count:16];
                if (v91) {
                  continue;
                }
                break;
              }
            }
            if (v86 > 3)
            {
              *(int *)((char *)obja + v85) = 0;
              if (v86 - 4 > 3)
              {
                uint64_t v97 = (void *)MEMORY[0x263EFF960];
                uint64_t v98 = [MEMORY[0x263EFF960] currentLocale];
                int v99 = [v98 localeIdentifier];
                LODWORD(v97) = [v97 windowsLocaleCodeFromLocaleIdentifier:v99];

                *(int *)((char *)obja + (v85 + 4)) = (int)v97;
                *(int *)((char *)obja + v101) = v109 - 8;
                int Checksum32 = getChecksum32(202, obja + 4, v109 - 8);
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
                  -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]2(v109, v85 + 8);
                }
                obja[2] = Checksum32;
                unsigned int *v111 = v85 + 8;

                int v13 = 0;
                goto LABEL_40;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]1();
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]0();
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]9();
          }

          uint64_t v55 = v107;
          goto LABEL_63;
        }
        BOOL v70 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v70) {
          -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]8(v70, v71, v72, v73, v74, v75, v76, v77);
        }
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:]1();
    }
LABEL_62:
    uint64_t v55 = v103;
LABEL_63:

LABEL_39:
    int v13 = 12;
LABEL_40:
    id v8 = v115;
    goto LABEL_8;
  }
  int v13 = v39;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:]6();
  }

LABEL_8:
  return v13;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
}

- (cNodeRestriction)primaryCnodeRestriction
{
  return (cNodeRestriction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrimaryCnodeRestriction:(id)a3
{
}

- (cNodeRestriction)secondaryCnodeRestriction
{
  return (cNodeRestriction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecondaryCnodeRestriction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCnodeRestriction, 0);
  objc_storeStrong((id *)&self->_primaryCnodeRestriction, 0);

  objc_storeStrong((id *)&self->_wctx, 0);
}

- (void)initWithCtx:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makePrimaryCnodeRestriction
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "makeBaseRestrictionNode: cnodeInner append sfgaoRestrict error: %d\n", v1, v2, v3, v4, v5);
}

- (void)makeSecondaryCnodeRestriction
{
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for Size field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSet Count, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CRestrictionPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.7()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CSortPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for Csort align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CInGroupSortAggregSets Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CInGroupSortAggregSets reserved: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CSortSet count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.12()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort pidColumn: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.13()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort dwOrder: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.14()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort dwIndividual: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.15()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort lcid: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.16()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CCategorizationSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.18()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for PidMapper Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.22()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnGroup field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.23()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for Lcid field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.24()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: Scope encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.25()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: SystemShellOmitFromView encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.26()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: SystemShellSFGAOFlagsStrings encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.27()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: fullPropSpec encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.28()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: cRowProperties encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.29()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for RowSetProperties align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.30()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: encdoe cRestrictionArray error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.31()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSet index: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.32()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodePrimaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for Size field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSet Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CRestrictionPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_235F82000, &_os_log_internal, a3, "wspQueryIn:encodeSecondaryQuery: makeSecondaryCnodeRestriction returned nil\n", a5, a6, a7, a8, 0);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.17()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CCategorizationSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.19()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for PidMapper Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.20()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnGroup field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.21()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for Lcid field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:(int)a1 BufferOffset:(int)a2 BytesWritten:.cold.22(int a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2[0] = 67109632;
  v2[1] = a1 + 8;
  __int16 v3 = 1024;
  int v4 = a2;
  __int16 v5 = 2048;
  uint64_t v6 = 16;
  _os_log_debug_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SECONDQUERY: nWritten: %u, bOffset: %u, sizeofhdr: %lu\n", (uint8_t *)v2, 0x18u);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.23()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: fullPropSpec encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.24()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: cRowProperties encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.25()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for RowSetProperties align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.26()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: encdoe cRestrictionArray error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.27()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSet index: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.28()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryIn:encodeSecondaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end