@interface FMMetricsDistiller
+ (id)packetFromMetrics:(id)a3 withSessionId:(unint64_t)a4 andUnlockSessionId:(unint64_t)a5 withSecondsFromStart:(double)a6 andMessageSessionId:(unint64_t)a7 withSecondsFromStart:(double)a8;
@end

@implementation FMMetricsDistiller

+ (id)packetFromMetrics:(id)a3 withSessionId:(unint64_t)a4 andUnlockSessionId:(unint64_t)a5 withSecondsFromStart:(double)a6 andMessageSessionId:(unint64_t)a7 withSecondsFromStart:(double)a8
{
  id v13 = a3;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  memset(v138, 0, sizeof(v138));
  long long v137 = 0u;
  long long v136 = 0u;
  memset(v135, 0, sizeof(v135));
  int v134 = 5;
  uint64_t v14 = a5 != 0;
  if (a7) {
    v14 |= 2uLL;
  }
  *(void *)((char *)&v135[1] + 12) = v14;
  *(void *)((char *)&v135[1] + 4) = a4;
  *(void *)((char *)&v135[2] + 4) = a5;
  *(double *)((char *)&v135[2] + 12) = a6;
  *(void *)((char *)&v135[3] + 4) = a7;
  *(double *)((char *)&v135[3] + 12) = a8;
  v15 = sub_100007078();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    unint64_t v125 = a5;
    __int16 v126 = 2048;
    double v127 = a6;
    __int16 v128 = 2048;
    unint64_t v129 = a7;
    __int16 v130 = 2048;
    double v131 = a8;
    __int16 v132 = 2048;
    unint64_t v133 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "lock_session_id = %llu, secondsFromStart = %f, message_session_id = %llu, secondsFromStart = %f, session_id = %llu", buf, 0x34u);
  }

  v16 = [v13 objectForKeyedSubscript:kCVAFaceTracking_TrackedFacesArray];
  v17 = [v16 firstObject];

  if (v17)
  {
    v18 = [v17 objectForKeyedSubscript:kCVAFaceTracking_FailureType];
    v19 = v18;
    if (v18 && ([v18 isEqualToNumber:&off_10000C760] & 1) == 0)
    {
      v20 = sub_100007078();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        unsigned int v100 = [v19 intValue];
        *(_DWORD *)buf = 67109120;
        LODWORD(v125) = v100;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "kCVAFaceTracking_FailureType => %d", buf, 8u);
      }
      v99 = 0;
      goto LABEL_147;
    }
    v20 = [v17 objectForKeyedSubscript:kCVAFaceTracking_FaceID];
    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v22 = sub_100007078();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100007150();
      }
      v99 = 0;
      goto LABEL_146;
    }
    v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:v20];
    v22 = v21;
    if (!v21)
    {
      v23 = sub_100007078();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100007184();
      }
      v99 = 0;
      goto LABEL_145;
    }
    [v21 getUUIDBytes:v135];
    v23 = [v17 objectForKeyedSubscript:kCVAFaceTracking_Identity];
    if (v23)
    {
      v24 = [v17 objectForKeyedSubscript:kCVAFaceTracking_RawData];
      v25 = v24;
      if (v24)
      {
        v26 = [v24 objectForKeyedSubscript:kCVAFaceTracking_Pose];
        v123 = [v26 objectForKeyedSubscript:kCVAFaceTracking_Rotation];
        if (!v123)
        {
          v33 = sub_100007078();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
            sub_1000071EC();
          }
          v99 = 0;
          goto LABEL_143;
        }
        v121 = v23;
        v122 = v26;
        v120 = v25;
        uint64_t v27 = 0;
        v28 = (char *)&v135[4] + 4;
        do
        {
          v29 = [v123 objectAtIndexedSubscript:v27];
          for (uint64_t i = 0; i != 3; ++i)
          {
            v31 = [v29 objectAtIndexedSubscript:i];
            [v31 floatValue];
            *(_DWORD *)&v28[4 * i] = v32;
          }
          ++v27;
          v28 += 12;
        }
        while (v27 != 3);
        v26 = v122;
        v33 = [v122 objectForKeyedSubscript:kCVAFaceTracking_Translation];
        if (!v33)
        {
          sub_100007078();
          v119 = v23 = v121;
          if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT)) {
            sub_100007220();
          }
          v99 = 0;
          v25 = v120;
          goto LABEL_142;
        }
        uint64_t v34 = 0;
        v23 = v121;
        do
        {
          v35 = [v33 objectAtIndexedSubscript:v34];
          [v35 floatValue];
          *((_DWORD *)&v136 + v34 + 2) = v36;

          ++v34;
        }
        while (v34 != 3);
        v37 = [v17 objectForKeyedSubscript:kCVAFaceTracking_SmoothData];
        v119 = v37;
        if (!v37)
        {
          v118 = sub_100007078();
          v26 = v122;
          if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT)) {
            sub_100007254();
          }
          v99 = 0;
          v25 = v120;
          goto LABEL_141;
        }
        v117 = v33;
        v118 = [v37 objectForKeyedSubscript:kCVAFaceTracking_Geometry];
        uint64_t v38 = [v118 objectForKeyedSubscript:kCVAFaceTracking_GeometryLeftEye];
        v116 = (void *)v38;
        if (!v38)
        {
          v45 = sub_100007078();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
            sub_100007288();
          }
          v99 = 0;
          v25 = v120;
          v26 = v122;
          goto LABEL_140;
        }
        uint64_t v39 = 0;
        v40 = (void *)v38;
        do
        {
          v41 = [v40 objectAtIndexedSubscript:v39];
          [v41 floatValue];
          v138[v39 - 3] = v42;

          ++v39;
        }
        while (v39 != 3);
        uint64_t v43 = [v118 objectForKeyedSubscript:kCVAFaceTracking_GeometryRightEye];
        if (!v43)
        {
          v45 = 0;
          v115 = sub_100007078();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT)) {
            sub_1000072BC();
          }
          v99 = 0;
          v25 = v120;
          v26 = v122;
          goto LABEL_139;
        }
        uint64_t v44 = 0;
        v45 = v43;
        do
        {
          v46 = [v45 objectAtIndexedSubscript:v44];
          [v46 floatValue];
          v138[v44] = v47;

          ++v44;
        }
        while (v44 != 3);
        v25 = v120;
        v48 = [v120 objectForKeyedSubscript:kCVAFaceTracking_Animation];
        v115 = v48;
        if (!v48)
        {
          v114 = sub_100007078();
          v26 = v122;
          if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT)) {
            sub_1000072F0();
          }
          v99 = 0;
          goto LABEL_138;
        }
        v49 = v48;
        v50 = [v48 objectForKeyedSubscript:kCVAFaceTracking_AnimationLeftEyePitch];
        v26 = v122;
        v114 = v50;
        if (!v50)
        {
          v113 = sub_100007078();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT)) {
            sub_100007324();
          }
          v99 = 0;
          goto LABEL_137;
        }
        [v50 floatValue];
        v138[3] = v51;
        v52 = [v49 objectForKeyedSubscript:kCVAFaceTracking_AnimationLeftEyeYaw];
        v113 = v52;
        if (!v52)
        {
          v112 = sub_100007078();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT)) {
            sub_100007358();
          }
          v99 = 0;
          goto LABEL_136;
        }
        [v52 floatValue];
        v138[4] = v53;
        v54 = [v49 objectForKeyedSubscript:kCVAFaceTracking_AnimationRightEyePitch];
        v112 = v54;
        if (!v54)
        {
          v111 = sub_100007078();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT)) {
            sub_10000738C();
          }
          v99 = 0;
          goto LABEL_135;
        }
        [v54 floatValue];
        v138[5] = v55;
        v56 = [v49 objectForKeyedSubscript:kCVAFaceTracking_AnimationRightEyeYaw];
        v111 = v56;
        if (!v56)
        {
          v60 = sub_100007078();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
            sub_1000073C0();
          }
          v99 = 0;
          goto LABEL_134;
        }
        [v56 floatValue];
        v138[6] = v57;
        v58 = [v49 objectForKeyedSubscript:kCVAFaceTracking_AnimationGaze];
        if (!v58)
        {
          v60 = 0;
          v110 = sub_100007078();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT)) {
            sub_1000073F4();
          }
          v99 = 0;
          v25 = v120;
          goto LABEL_133;
        }
        for (uint64_t j = 0; j != 3; ++j)
        {
          [v58 objectAtIndexedSubscript:j];
          v61 = v60 = v58;
          [v61 floatValue];
          v138[j + 7] = v62;

          v58 = v60;
        }
        v63 = [v115 objectForKeyedSubscript:kCVAFaceTracking_AnimationBlendshapes];
        v110 = v63;
        if (v63)
        {
          v64 = v63;
          if ([v63 length] == (id)204)
          {
            [v64 getBytes:&v138[10] length:204];
            v109 = [v120 objectForKeyedSubscript:kCVA_djFOfwkPKZLtBeTcoU4KH4u1];
            if (!v109)
            {
              v66 = sub_100007078();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                sub_10000745C();
              }
              v99 = 0;
              goto LABEL_131;
            }
            v65 = [v109 objectForKeyedSubscript:kCVA_aZUZUIKi1SJ7vFd5h8tqxqYH];
            v66 = v65;
            if (v65)
            {
              v67 = [v65 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_0];
              if (v67)
              {
                v68 = v67;
                [v67 floatValue];
                DWORD1(v139) = v69;
                v70 = [v66 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_1];

                if (v70)
                {
                  [v70 floatValue];
                  DWORD2(v139) = v71;
                  v72 = [v66 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_4];

                  if (v72)
                  {
                    [v72 floatValue];
                    HIDWORD(v139) = v73;
                    v74 = [v66 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_5];

                    if (v74)
                    {
                      [v74 floatValue];
                      LODWORD(v140) = v75;
                      v76 = [v66 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_7];

                      if (v76)
                      {
                        [v76 floatValue];
                        DWORD1(v140) = v77;
                        v78 = [v66 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_8];

                        if (v78)
                        {
                          [v78 floatValue];
                          DWORD2(v140) = v79;
                          v80 = [v66 objectForKeyedSubscript:kCVA_wxhFo3gWXB27xJ3OSacmO9bj_9];

                          v105 = v80;
                          if (v80)
                          {
                            [v80 floatValue];
                            HIDWORD(v140) = v81;
                            v82 = [v109 objectForKeyedSubscript:kCVA_wiynFaZQYeLg1fqOn2pZOXAG];
                            v83 = v82;
                            if (v82)
                            {
                              v84 = [v82 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_0];

                              if (v84)
                              {
                                [v84 floatValue];
                                LODWORD(v141) = v85;
                                v106 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_1];

                                if (v106)
                                {
                                  [v106 floatValue];
                                  DWORD1(v141) = v86;
                                  v87 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_2];

                                  if (v87)
                                  {
                                    v103 = v87;
                                    [v87 floatValue];
                                    DWORD2(v141) = v88;
                                    v89 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_3];

                                    if (v89)
                                    {
                                      v107 = v89;
                                      [v89 floatValue];
                                      HIDWORD(v141) = v90;
                                      v91 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_4];

                                      if (v91)
                                      {
                                        v104 = v91;
                                        [v91 floatValue];
                                        LODWORD(v142) = v92;
                                        v93 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_5];

                                        if (v93)
                                        {
                                          v108 = v93;
                                          [v93 floatValue];
                                          DWORD1(v142) = v94;
                                          v95 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_6];

                                          if (v95)
                                          {
                                            [v95 floatValue];
                                            DWORD2(v142) = v96;
                                            v105 = [v83 objectForKeyedSubscript:kCVA_smaCIWvZLZm3xF2T6BixNtj6_7];

                                            if (v105)
                                            {
                                              [v105 floatValue];
                                              HIDWORD(v142) = v97;
                                              int v98 = dword_1000112F0++;
                                              LODWORD(v135[1]) = v98;
                                              v99 = +[NSData dataWithBytes:&v134 length:436];
LABEL_171:

                                              goto LABEL_130;
                                            }
                                            v105 = sub_100007078();
                                            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                              sub_1000077D0();
                                            }
                                          }
                                          else
                                          {
                                            v105 = sub_100007078();
                                            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                              sub_10000779C();
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v105 = sub_100007078();
                                          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                            sub_100007768();
                                          }
                                        }
                                      }
                                      else
                                      {
                                        v105 = sub_100007078();
                                        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                          sub_100007734();
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v105 = sub_100007078();
                                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                        sub_100007700();
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v105 = sub_100007078();
                                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                      sub_1000076CC();
                                    }
                                  }
                                }
                                else
                                {
                                  v105 = sub_100007078();
                                  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                    sub_100007698();
                                  }
                                }
                              }
                              else
                              {
                                v105 = sub_100007078();
                                if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                                  sub_100007664();
                                }
                              }
                            }
                            else
                            {
                              v102 = sub_100007078();
                              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
                                sub_100007630();
                              }
                            }
                            v99 = 0;
                            goto LABEL_171;
                          }
                          v83 = sub_100007078();
                          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                            sub_1000075FC();
                          }
                        }
                        else
                        {
                          v83 = sub_100007078();
                          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                            sub_1000075C8();
                          }
                        }
                      }
                      else
                      {
                        v83 = sub_100007078();
                        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                          sub_100007594();
                        }
                      }
                    }
                    else
                    {
                      v83 = sub_100007078();
                      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                        sub_100007560();
                      }
                    }
                  }
                  else
                  {
                    v83 = sub_100007078();
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                      sub_10000752C();
                    }
                  }
                }
                else
                {
                  v83 = sub_100007078();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                    sub_1000074F8();
                  }
                }
              }
              else
              {
                v83 = sub_100007078();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                  sub_1000074C4();
                }
              }
            }
            else
            {
              v83 = sub_100007078();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                sub_100007490();
              }
            }
            v99 = 0;
LABEL_130:

LABEL_131:
            goto LABEL_132;
          }
          v109 = sub_100007078();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT)) {
            sub_100007804(v110, v109);
          }
        }
        else
        {
          v109 = sub_100007078();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT)) {
            sub_100007428();
          }
        }
        v99 = 0;
LABEL_132:
        v25 = v120;
        v26 = v122;

LABEL_133:
LABEL_134:

LABEL_135:
LABEL_136:

LABEL_137:
LABEL_138:

LABEL_139:
LABEL_140:

        v33 = v117;
        v23 = v121;
LABEL_141:

LABEL_142:
LABEL_143:

        goto LABEL_144;
      }
    }
    else
    {
      v25 = sub_100007078();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_1000071B8();
      }
    }
    v99 = 0;
LABEL_144:

LABEL_145:
LABEL_146:

LABEL_147:
    goto LABEL_148;
  }
  v19 = sub_100007078();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100007110();
  }
  v99 = 0;
LABEL_148:

  return v99;
}

@end