@interface SEMOntologyMapper
+ (id)_entitySpanForCascadeMatch:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5 label:(id)a6;
+ (id)_radioStationSignalTypeAsString:(unsigned int)a3;
+ (id)ontologyGraphFromSpanMatch:(id)a3;
+ (optional<std::tuple<const)_ontologyMappingFromCascadeSpanMatch:(NSString *const>> *__return_ptr)retstr;
+ (optional<std::tuple<const)_ontologyMappingFromFieldType:(NSString *const>> *__return_ptr)retstr;
+ (void)_appendSpanProperties:(id)a3 forAppShortcutEntityMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forAppShortcutPhraseMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forContactMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forCustomTermMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forGlobalTermMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forHomeMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forHomeServiceAreaMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forInstalledAppMatch:(id)a4;
+ (void)_appendSpanProperties:(id)a3 forLearnedContactMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forLearnedMediaEntityMatch:(id)a4 entityInfo:(id)a5;
+ (void)_appendSpanProperties:(id)a3 forRadioStationMatch:(id)a4 entityInfo:(id)a5;
+ (void)_setIdentifiersOnEdgeNode:(id)a3 entitySpan:(id)a4 spanInfo:(id)a5 probability:(float)a6;
@end

@implementation SEMOntologyMapper

+ (id)ontologyGraphFromSpanMatch:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v7 = objc_msgSend_entityInfo(v3, v4, v5, v6);
  int v11 = objc_msgSend_entityType(v7, v8, v9, v10);

  if (v11 == 1)
  {
    v12 = objc_alloc_init(MEMORY[0x263F739F0]);
    v13 = objc_opt_class();
    if (v13)
    {
      objc_msgSend__ontologyMappingFromCascadeSpanMatch_(v13, v14, (uint64_t)v3, v15);
      if (buf[24])
      {
        id v69 = *(id *)&buf[16];
        v19 = objc_msgSend_spanInfo(v3, v16, v17, v18);
        uint64_t v23 = objc_msgSend_spanRange(v19, v20, v21, v22);
        int v25 = (int)v24;
        v27 = objc_msgSend_createEntityNode_(v12, v24, *(uint64_t *)buf, v26);
        v31 = objc_msgSend_spanValue(v3, v28, v29, v30);
        v34 = objc_msgSend_createStringNode_(v12, v32, (uint64_t)v31, v33);

        uint64_t v35 = (v23 + v25);
        objc_msgSend_addUtteranceAlignmentWithAsrIndex_StartIndex_endIndex_startUnicodeScalarIndex_endUnicodeScalarIndex_(v34, v36, 0, v23, v35, v23, v35);
        v37 = objc_opt_class();
        v39 = objc_msgSend__entitySpanForCascadeMatch_startIndex_endIndex_label_(v37, v38, (uint64_t)v3, v23, v35, v69);
        objc_msgSend_addEntitySpan_(v34, v40, (uint64_t)v39, v41);
        v42 = objc_opt_class();
        objc_msgSend_score(v3, v43, v44, v45);
        objc_msgSend__setIdentifiersOnEdgeNode_entitySpan_spanInfo_probability_(v42, v46, (uint64_t)v34, (uint64_t)v39, v19);
        objc_msgSend_setSuccessor_successor_enumeration_(v27, v47, *(uint64_t *)&buf[8], (uint64_t)v34, 0);
        objc_msgSend_getRoot(v12, v48, v49, v50);
        v51 = (siri::ontology::oname::graph::ontology_init *)objc_claimAutoreleasedReturnValue();
        uint64_t v52 = siri::ontology::oname::graph::ontology_init::Argument_entity(v51);
        objc_msgSend_setSuccessor_successor_enumeration_(v51, v53, v52, (uint64_t)v27, 0);

        v54 = v12;
LABEL_12:
        if (buf[24]) {

        }
        goto LABEL_14;
      }
    }
    else
    {
      memset(buf, 0, 32);
    }
    v58 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 136315394;
      v71 = "+[SEMOntologyMapper ontologyGraphFromSpanMatch:]";
      __int16 v72 = 2112;
      id v73 = v3;
      _os_log_error_impl(&dword_25C7CA000, v58, OS_LOG_TYPE_ERROR, "%s No ontology mapping is defined for spanMatch: %@", v70, 0x16u);
    }
    v54 = 0;
    goto LABEL_12;
  }
  v12 = (id)qword_26B3549D8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v60 = objc_msgSend_entityInfo(v3, v55, v56, v57);
    unsigned int v64 = objc_msgSend_entityType(v60, v61, v62, v63);
    v68 = SEMEntityTypeDescription(v64, v65, v66, v67);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "+[SEMOntologyMapper ontologyGraphFromSpanMatch:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v68;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v3;
    _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, "%s Ontology conversion not supported for entity type (%@) of match: %@", buf, 0x20u);
  }
  v54 = 0;
LABEL_14:

  return v54;
}

+ (optional<std::tuple<const)_ontologyMappingFromCascadeSpanMatch:(NSString *const>> *__return_ptr)retstr
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v48 = a4;
  v7 = objc_msgSend_entityInfo(v48, v4, v5, v6);
  v8 = sub_25C80E468(v7);

  if (!v8)
  {
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    goto LABEL_37;
  }
  uint64_t v49 = v8;
  v14 = objc_msgSend_fieldMatches(v48, v9, v10, v11);
  uint64_t v15 = 0;
  v16 = 0;
  unint64_t v17 = 0;
  uint64_t v50 = v14;
  while (1)
  {
    uint64_t v18 = objc_msgSend_objectAtIndex_(v14, v12, v17, v13);
    uint64_t v22 = objc_msgSend_entityFieldInfo(v18, v19, v20, v21);
    uint64_t v23 = sub_25C80E5BC(v22);

    if (!v23)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;

      v14 = v50;
      if (!v16) {
        goto LABEL_36;
      }
      goto LABEL_34;
    }
    uint64_t v27 = objc_msgSend_fieldType(v23, v24, v25, v26);
    objc_msgSend__ontologyMappingFromFieldType_(SEMOntologyMapper, v28, v27, v29);
    uint64_t v30 = (char *)operator new(0x38uLL);
    v32 = v30;
    *((void *)v30 + 1) = 0;
    uint64_t v33 = (atomic_ullong *)(v30 + 8);
    *((void *)v30 + 2) = 0;
    *(void *)uint64_t v30 = &unk_2709E02C8;
    v30[24] = 0;
    v34 = v30 + 24;
    v30[48] = 0;
    int v35 = v53;
    if ((_BYTE)v53)
    {
      *(_OWORD *)(v30 + 24) = *(_OWORD *)buf;
      *((void *)v30 + 5) = *(id *)&buf[16];
      v32[48] = 1;
    }
    if (v16)
    {
      sub_25C7D2280(v16);
      int v35 = v53;
    }
    if (v35) {

    }
    if (v17) {
      break;
    }
LABEL_18:
    atomic_fetch_add_explicit(v33, 1uLL, memory_order_relaxed);
    if (v16) {
      sub_25C7D2280(v16);
    }

    v14 = v50;
    ++v17;
    uint64_t v15 = v34;
    v16 = (std::__shared_weak_count *)v32;
    if (v17 >= objc_msgSend_count(v50, v41, v42, v43))
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
      if (v32[48])
      {
        *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)(v32 + 24);
        retstr->var0.var1.var0.var2 = *((id *)v32 + 5);
        retstr->var1 = 1;
      }
      v16 = (std::__shared_weak_count *)v32;
LABEL_34:
      sub_25C7D2280(v16);
      goto LABEL_35;
    }
  }
  id v51 = 0;
  int v36 = objc_msgSend_itemTypeForFieldType_error_(MEMORY[0x263F50070], v31, v27, (uint64_t)&v51);
  id v40 = v51;
  if (!v40 && v36 == objc_msgSend_itemType(v49, v37, v38, v39))
  {
    if (!v32[48] || !v15[24]) {
      sub_25C804710();
    }
    if (*((void *)v32 + 3) != *(void *)v15
      || *((void *)v32 + 4) != *((void *)v15 + 1)
      || *((void *)v32 + 5) != *((void *)v15 + 2))
    {
      uint64_t v45 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "+[SEMOntologyMapper _ontologyMappingFromCascadeSpanMatch:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v48;
        _os_log_error_impl(&dword_25C7CA000, v45, OS_LOG_TYPE_ERROR, "%s Merged fields of span match: %@ not homologous to a single ontology mapping", buf, 0x16u);
      }
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
      goto LABEL_31;
    }
    goto LABEL_18;
  }
  uint64_t v44 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "+[SEMOntologyMapper _ontologyMappingFromCascadeSpanMatch:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2112;
    id v53 = v40;
    _os_log_error_impl(&dword_25C7CA000, v44, OS_LOG_TYPE_ERROR, "%s Span match has unexpected fieldType: %@ error: %@", buf, 0x20u);
  }
  retstr->var0.var0 = 0;
  retstr->var1 = 0;

LABEL_31:
  sub_25C7D2280((std::__shared_weak_count *)v32);
  v14 = v50;
  if (!v16) {
    goto LABEL_36;
  }
LABEL_35:
  sub_25C7D2280(v16);
LABEL_36:

  v8 = v49;
LABEL_37:

  return result;
}

+ (optional<std::tuple<const)_ontologyMappingFromFieldType:(NSString *const>> *__return_ptr)retstr
{
  if ((int)a4 > 19678)
  {
    if ((int)a4 > 38253)
    {
      if ((int)a4 > 53616)
      {
        if ((int)a4 > 61512)
        {
          switch(a4)
          {
            case 0xF2CFu:
              uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
              uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
              v7 = @"learnedMediaSong";
              goto LABEL_134;
            case 0xF2D0u:
              uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
              uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
              v7 = @"learnedMediaArtist";
              goto LABEL_134;
            case 0xF2D1u:
              uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
              uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
              v7 = @"learnedMediaAlbum";
              goto LABEL_134;
            case 0xF2D2u:
              uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
              uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
              v7 = @"learnedMediaEntity";
              goto LABEL_134;
            default:
              if (a4 == 61513) {
                goto LABEL_100;
              }
              if (a4 != 63372) {
                goto LABEL_117;
              }
              uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Group((siri::ontology::oname::graph::ontology_init *)result);
              uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
              v7 = @"smsGroupName";
              break;
          }
          goto LABEL_134;
        }
        if ((int)a4 <= 54388)
        {
          if (a4 == 53617)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_WorkoutInstructor((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"workoutInstructorName";
            goto LABEL_134;
          }
          if (a4 == 54388)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_CalendarEvent((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"calendarEventTopic";
            goto LABEL_134;
          }
          goto LABEL_117;
        }
        if (a4 == 54389)
        {
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PointOfInterest((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"calendarEventLocation";
          goto LABEL_134;
        }
        if (a4 != 61355)
        {
          if (a4 == 61512)
          {
LABEL_100:
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserProfile((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"userAccount";
            goto LABEL_134;
          }
          goto LABEL_117;
        }
        goto LABEL_41;
      }
      if ((int)a4 > 49068)
      {
        switch(a4)
        {
          case 0xBFADu:
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"carRadioStationName";
            goto LABEL_134;
          case 0xBFAEu:
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"carRadioStationCallSign";
            goto LABEL_134;
          case 0xBFAFu:
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_frequencyName(v5);
            v7 = @"carRadioFrequency";
            goto LABEL_134;
          case 0xBFB0u:
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_frequencyName(v5);
            v7 = @"carRadioChannel";
            goto LABEL_134;
          default:
            if (a4 != 53604) {
              goto LABEL_117;
            }
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"learnedContact";
            break;
        }
        goto LABEL_134;
      }
      if ((int)a4 <= 42188)
      {
        if (a4 != 38254)
        {
          if (a4 == 42188)
          {
LABEL_84:
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"playlistTitle";
            goto LABEL_134;
          }
          goto LABEL_117;
        }
        goto LABEL_91;
      }
      if (a4 == 42189 || a4 == 42190)
      {
LABEL_72:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"mediaPlayerItem";
        goto LABEL_134;
      }
      if (a4 != 44938) {
        goto LABEL_117;
      }
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Workout((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"healthActivity";
    }
    else
    {
      if ((int)a4 <= 25885)
      {
        if ((int)a4 > 19692)
        {
          if ((int)a4 > 19757)
          {
            switch(a4)
            {
              case 0x4D2Eu:
                uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PersonRelationship((siri::ontology::oname::graph::ontology_init *)result);
                uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_relationshipType(v5);
                v7 = @"personRelationship";
                goto LABEL_134;
              case 0x4D2Fu:
                uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
                uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
                v7 = @"RelatedPerson";
                goto LABEL_134;
              case 0x4D35u:
                uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ContactAddress((siri::ontology::oname::graph::ontology_init *)result);
                uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_label(v5);
                v7 = @"emailType";
                goto LABEL_134;
            }
            goto LABEL_117;
          }
          if (a4 == 19693)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Organization((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"personCompany";
            goto LABEL_134;
          }
          if (a4 == 19747)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ContactAddress((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_label(v5);
            v7 = @"contactType";
            goto LABEL_134;
          }
          if (a4 != 19749) {
            goto LABEL_117;
          }
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ContactAddress((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_label(v5);
          v7 = @"addressType";
          goto LABEL_134;
        }
        if ((a4 - 19679) >= 5) {
          goto LABEL_117;
        }
LABEL_41:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"personFullName";
        goto LABEL_134;
      }
      if ((int)a4 > 32967)
      {
        if ((int)a4 <= 36063)
        {
          if (a4 == 32968 || a4 == 34312)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = @"appPlaylistTitle";
            goto LABEL_134;
          }
          goto LABEL_117;
        }
        if (a4 != 36064)
        {
          if (a4 != 36439 && a4 != 36441) {
            goto LABEL_117;
          }
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_App((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"appName";
          goto LABEL_134;
        }
LABEL_79:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"appShowTitle";
        goto LABEL_134;
      }
      if ((int)a4 > 27130)
      {
        if ((a4 - 27131) < 2)
        {
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"findMyDeviceOwnerName";
          goto LABEL_134;
        }
        int v8 = 30601;
        goto LABEL_122;
      }
      if (a4 == 25886)
      {
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PaymentAccount((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"paymentsAccountName";
        goto LABEL_134;
      }
      if (a4 == 26515)
      {
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ReminderList((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"notebookTitle";
        goto LABEL_134;
      }
      if (a4 != 27126) {
        goto LABEL_117;
      }
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
      v7 = @"findMyDeviceName";
    }
LABEL_134:
    result = v7;
    retstr->var0.var1.var0.var0 = (OntologyNodeName *)v5;
    retstr->var0.var1.var0.var1 = v6;
    retstr->var0.var1.var0.var2 = result;
    BOOL v9 = 1;
    goto LABEL_135;
  }
  if ((int)a4 > 15574)
  {
    if ((int)a4 > 17036)
    {
      switch(a4)
      {
        case 0x487Bu:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"musicAlbum";
          goto LABEL_134;
        case 0x487Cu:
        case 0x4884u:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"musicArtist";
          goto LABEL_134;
        case 0x487Du:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"audiobookTitle";
          goto LABEL_134;
        case 0x487Eu:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"audiobookAuthor";
          goto LABEL_134;
        case 0x487Fu:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"musicGenre";
          goto LABEL_134;
        case 0x4880u:
        case 0x4886u:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"mediaTitle";
          goto LABEL_134;
        case 0x4881u:
          goto LABEL_72;
        case 0x4882u:
          goto LABEL_84;
        case 0x4883u:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"musicTitle";
          goto LABEL_134;
        case 0x4885u:
          uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = @"mediaEpisodeTitle";
          goto LABEL_134;
        default:
          if (a4 == 17037)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = @"homeAutomationTargetAreaName";
          }
          else
          {
            if (a4 != 17041) {
              goto LABEL_117;
            }
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = @"homeAutomationTargetMapName";
          }
          break;
      }
      goto LABEL_134;
    }
    if ((a4 - 15768) < 6)
    {
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PostalAddress((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_value(v5);
      v7 = @"location";
      goto LABEL_134;
    }
    if (a4 != 15575)
    {
      if (a4 == 16254)
      {
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Organization((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"paymentsOrganizationName";
        goto LABEL_134;
      }
      goto LABEL_117;
    }
    goto LABEL_79;
  }
  if ((int)a4 > 7824)
  {
    if ((int)a4 > 12998)
    {
      if ((int)a4 <= 14029)
      {
        if ((a4 - 12999) >= 2) {
          goto LABEL_117;
        }
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Medication((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = @"medicationName";
        goto LABEL_134;
      }
      if (a4 != 14030)
      {
        if (a4 != 14709)
        {
          if (a4 == 14819)
          {
            uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = @"carProfileName";
            goto LABEL_134;
          }
          goto LABEL_117;
        }
        goto LABEL_92;
      }
LABEL_91:
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"appAudiobookAuthor";
      goto LABEL_134;
    }
    if ((int)a4 <= 8198)
    {
      if (a4 != 7825 && a4 != 7830) {
        goto LABEL_117;
      }
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_AppEntity((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"appEntity";
      goto LABEL_134;
    }
    if (a4 == 8199)
    {
LABEL_92:
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"appAudiobookTitle";
      goto LABEL_134;
    }
    int v8 = 12013;
LABEL_122:
    if (a4 == v8)
    {
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_VoiceCommand((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"voiceCommandName";
      goto LABEL_134;
    }
    goto LABEL_117;
  }
  if ((int)a4 > 7700)
  {
    switch(a4)
    {
      case 0x1E15u:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationHome";
        goto LABEL_134;
      case 0x1E16u:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationAccessoryName";
        goto LABEL_134;
      case 0x1E18u:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationRoom";
        goto LABEL_134;
      case 0x1E19u:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationScene";
        goto LABEL_134;
      case 0x1E1Au:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationServiceName";
        goto LABEL_134;
      case 0x1E1Cu:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationServiceGroup";
        goto LABEL_134;
      case 0x1E1Du:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationTrigger";
        goto LABEL_134;
      case 0x1E1Eu:
        uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = @"homeAutomationZone";
        goto LABEL_134;
      case 0x1E2Au:
        goto LABEL_90;
      default:
        goto LABEL_117;
    }
  }
  switch(a4)
  {
    case 0x323u:
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
      v7 = @"carName";
      goto LABEL_134;
    case 0xE24u:
LABEL_90:
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"appMusicArtistName";
      goto LABEL_134;
    case 0x15DEu:
      uint64_t v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_NoteFolder((siri::ontology::oname::graph::ontology_init *)result);
      uint64_t v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = @"notebookFolderTitle";
      goto LABEL_134;
  }
LABEL_117:
  BOOL v9 = 0;
  retstr->var0.var0 = 0;
LABEL_135:
  retstr->var1 = v9;
  return result;
}

+ (void)_setIdentifiersOnEdgeNode:(id)a3 entitySpan:(id)a4 spanInfo:(id)a5 probability:(float)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v39 = a4;
  uint64_t v11 = objc_msgSend_originAppId(v39, v8, v9, v10);
  uint64_t v15 = objc_msgSend_originEntityId(v39, v12, v13, v14);
  objc_msgSend_addIdentifierWithValue_appBundleId_namespaceString_probability_nluComponent_(v40, v16, (uint64_t)v15, (uint64_t)v11, *MEMORY[0x263F73860], a6, 1, 0x100000001);

  if (qword_26B354A60 != -1) {
    dispatch_once(&qword_26B354A60, &unk_2709E0298);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v20 = objc_msgSend_properties(v39, v17, v18, v19);
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v20);
        }
        v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v29 = (void *)qword_26B354A58;
        uint64_t v30 = objc_msgSend_key(v28, v22, v23, v24);
        LODWORD(v29) = objc_msgSend_containsObject_(v29, v31, (uint64_t)v30, v32);

        if (v29)
        {
          uint64_t v33 = objc_msgSend_valueString(v28, v22, v23, v24);
          v37 = objc_msgSend_key(v28, v34, v35, v36);
          objc_msgSend_addIdentifierWithValue_appBundleId_namespaceString_probability_nluComponent_(v40, v38, (uint64_t)v33, (uint64_t)v11, v37, a6, 1, 0x100000001);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v25);
  }
}

+ (id)_entitySpanForCascadeMatch:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5 label:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a6;
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = objc_msgSend_entityInfo(v9, v11, v12, v13);
  uint64_t v15 = sub_25C80E468(v14);

  if (!v15)
  {
    matched = 0;
    goto LABEL_56;
  }
  int v19 = objc_msgSend_itemType(v15, v16, v17, v18);
  if (v19 <= 19667)
  {
    if (v19 <= 12009)
    {
      if (v19 > 7689)
      {
        if (v19 <= 7821)
        {
          if (v19 == 7690)
          {
            objc_msgSend__appendSpanProperties_forHomeMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
            goto LABEL_55;
          }
          int v21 = 7719;
          goto LABEL_53;
        }
        if (v19 == 7822)
        {
          objc_msgSend__appendSpanProperties_forAppShortcutEntityMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
          goto LABEL_55;
        }
        int v23 = 8194;
LABEL_42:
        if (v19 != v23) {
          goto LABEL_55;
        }
        goto LABEL_47;
      }
      if (v19 == 800) {
        goto LABEL_54;
      }
      if (v19 != 3615)
      {
        int v21 = 5595;
        goto LABEL_53;
      }
    }
    else
    {
      if (v19 > 14815)
      {
        if (v19 > 16250)
        {
          if (v19 != 16251)
          {
            if (v19 == 17034) {
              objc_msgSend__appendSpanProperties_forHomeServiceAreaMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
            }
            goto LABEL_55;
          }
          goto LABEL_54;
        }
        if (v19 != 14816)
        {
          int v21 = 15572;
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      if (v19 <= 14024)
      {
        if (v19 == 12010)
        {
          objc_msgSend__appendSpanProperties_forAppShortcutPhraseMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
          goto LABEL_55;
        }
        int v21 = 13884;
        goto LABEL_53;
      }
      if (v19 != 14025)
      {
        int v21 = 14706;
        goto LABEL_53;
      }
    }
LABEL_47:
    objc_msgSend__appendSpanProperties_forGlobalTermMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
    goto LABEL_55;
  }
  if (v19 > 38250)
  {
    if (v19 > 53600)
    {
      if (v19 > 62157)
      {
        if (v19 == 62158)
        {
          objc_msgSend__appendSpanProperties_forLearnedMediaEntityMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
          goto LABEL_55;
        }
        int v21 = 63369;
      }
      else
      {
        if (v19 == 53601)
        {
          objc_msgSend__appendSpanProperties_forLearnedContactMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
          goto LABEL_55;
        }
        int v21 = 61352;
      }
      goto LABEL_53;
    }
    if (v19 > 49065)
    {
      if (v19 == 49066)
      {
        objc_msgSend__appendSpanProperties_forRadioStationMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
        goto LABEL_55;
      }
      int v21 = 53482;
      goto LABEL_53;
    }
    if (v19 != 38251)
    {
      int v21 = 44935;
      goto LABEL_53;
    }
LABEL_54:
    objc_msgSend__appendSpanProperties_forCustomTermMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
    goto LABEL_55;
  }
  if (v19 > 32964)
  {
    if (v19 <= 36058)
    {
      if (v19 == 32965) {
        goto LABEL_54;
      }
      int v23 = 34307;
      goto LABEL_42;
    }
    if (v19 != 36059)
    {
      if (v19 == 36434) {
        objc_msgSend__appendSpanProperties_forInstalledAppMatch_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9);
      }
      goto LABEL_55;
    }
    goto LABEL_47;
  }
  if (v19 > 26511)
  {
    if (v19 != 26512)
    {
      int v21 = 30598;
      goto LABEL_53;
    }
    goto LABEL_54;
  }
  if (v19 == 19668)
  {
    objc_msgSend__appendSpanProperties_forContactMatch_entityInfo_(SEMOntologyMapper, v20, (uint64_t)v53, (uint64_t)v9, v15);
    goto LABEL_55;
  }
  int v21 = 25883;
LABEL_53:
  if (v19 == v21) {
    goto LABEL_54;
  }
LABEL_55:
  id v24 = objc_alloc(MEMORY[0x263F73A08]);
  v28 = objc_msgSend_spanValue(v9, v25, v26, v27);
  uint64_t v30 = objc_msgSend_initWithKey_valueString_(v24, v29, *MEMORY[0x263F73890], (uint64_t)v28);
  objc_msgSend_addObject_(v53, v31, (uint64_t)v30, v32);

  uint64_t v33 = sub_25C80E2A0(v9);
  id v34 = v10;
  uint64_t v35 = v8;
  id v39 = objc_msgSend_sourceItemIdentifier(v33, v36, v37, v38);

  id v40 = objc_alloc(MEMORY[0x263F739E8]);
  long long v44 = objc_msgSend_sourceIdentifierOrConstant(v15, v41, v42, v43);
  id v48 = objc_msgSend_spanInfo(v9, v45, v46, v47);
  uint64_t v49 = sub_25C8047E8(v48);
  uint64_t v50 = v40;
  id v10 = v34;
  matched = objc_msgSend_initWithOriginAppId_sourceComponent_label_matchInfo_properties_startIndex_endIndex_alternatives_originEntityId_(v50, v51, (uint64_t)v44, 1, v34, v49, v53, v35, a5, 0, v39);

LABEL_56:
  return matched;
}

+ (void)_appendSpanProperties:(id)a3 forCustomTermMatch:(id)a4 entityInfo:(id)a5
{
  id v50 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = objc_msgSend_content(v8, v9, v10, v11);
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0
    && (objc_msgSend_content(v8, v14, v15, v16),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_vocabularyIdentifier(v17, v18, v19, v20),
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        v17,
        v21))
  {
    id v22 = objc_alloc(MEMORY[0x263F73A08]);
    id v24 = objc_msgSend_initWithKey_valueString_(v22, v23, *MEMORY[0x263F73858], v21);
    objc_msgSend_addObject_(v50, v25, (uint64_t)v24, v26);

    uint64_t v27 = (void *)v21;
  }
  else
  {
    uint64_t v27 = 0;
  }
  v28 = objc_msgSend_fieldMatches(v7, v14, v15, v16);
  uint64_t v32 = objc_msgSend_firstObject(v28, v29, v30, v31);
  uint64_t v36 = objc_msgSend_entityFieldInfo(v32, v33, v34, v35);
  uint64_t v37 = sub_25C80E5BC(v36);

  if (objc_msgSend_fieldType(v37, v38, v39, v40) == 803)
  {
    id v41 = objc_alloc(MEMORY[0x263F73A08]);
    uint64_t v45 = objc_msgSend_spanValue(v7, v42, v43, v44);
    uint64_t v47 = objc_msgSend_initWithKey_valueString_(v41, v46, *MEMORY[0x263F73818], (uint64_t)v45);
    objc_msgSend_addObject_(v50, v48, (uint64_t)v47, v49);
  }
}

+ (void)_appendSpanProperties:(id)a3 forContactMatch:(id)a4 entityInfo:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v10 = objc_msgSend_fieldMatches(a4, v7, v8, v9);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v54, (uint64_t)v58, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = objc_msgSend_entityFieldInfo(*(void **)(*((void *)&v54 + 1) + 8 * i), v12, v13, v14);
        uint64_t v19 = sub_25C80E5BC(v18);

        if (v19)
        {
          switch(objc_msgSend_fieldType(v19, v20, v21, v22))
          {
            case 0x4CDFu:
              id v23 = objc_alloc(MEMORY[0x263F73A08]);
              uint64_t v26 = objc_msgSend_initWithKey_(v23, v24, 0x2709E1CF0, v25);
              objc_msgSend_addObject_(v6, v27, (uint64_t)v26, v28);
              goto LABEL_14;
            case 0x4CE0u:
              id v29 = objc_alloc(MEMORY[0x263F73A08]);
              uint64_t v26 = objc_msgSend_initWithKey_(v29, v30, 0x2709E1D10, v31);
              objc_msgSend_addObject_(v6, v32, (uint64_t)v26, v33);
              goto LABEL_14;
            case 0x4CE1u:
              id v34 = objc_alloc(MEMORY[0x263F73A08]);
              uint64_t v26 = objc_msgSend_initWithKey_(v34, v35, 0x2709E1D30, v36);
              objc_msgSend_addObject_(v6, v37, (uint64_t)v26, v38);
              goto LABEL_14;
            case 0x4CE2u:
              id v39 = objc_alloc(MEMORY[0x263F73A08]);
              uint64_t v26 = objc_msgSend_initWithKey_(v39, v40, 0x2709E1D50, v41);
              objc_msgSend_addObject_(v6, v42, (uint64_t)v26, v43);
              goto LABEL_14;
            case 0x4CE3u:
              id v49 = objc_alloc(MEMORY[0x263F73A08]);
              uint64_t v26 = objc_msgSend_initWithKey_(v49, v50, 0x2709E1D70, v51);
              objc_msgSend_addObject_(v6, v52, (uint64_t)v26, v53);
              goto LABEL_14;
            case 0x4CEDu:
              id v44 = objc_alloc(MEMORY[0x263F73A08]);
              uint64_t v26 = objc_msgSend_initWithKey_(v44, v45, 0x2709E1D90, v46);
              objc_msgSend_addObject_(v6, v47, (uint64_t)v26, v48);
LABEL_14:

              break;
            default:
              break;
          }
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v54, (uint64_t)v58, 16);
    }
    while (v15);
  }
}

+ (void)_appendSpanProperties:(id)a3 forInstalledAppMatch:(id)a4
{
  id v23 = a3;
  uint64_t v8 = objc_msgSend_spanInfo(a4, v5, v6, v7);
  if ((objc_msgSend_isPartialMatch(v8, v9, v10, v11) & 1) != 0
    || (objc_msgSend_isApproximateMatch(v8, v12, v13, v14) & 1) != 0
    || objc_msgSend_isAliasMatch(v8, v15, v16, v17))
  {
    id v18 = objc_alloc(MEMORY[0x263F73A08]);
    uint64_t v20 = objc_msgSend_initWithKey_valueString_(v18, v19, *MEMORY[0x263F73820], *MEMORY[0x263F73820]);
    objc_msgSend_addObject_(v23, v21, (uint64_t)v20, v22);
  }
}

+ (void)_appendSpanProperties:(id)a3 forHomeMatch:(id)a4 entityInfo:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_content(v9, v10, v11, v12);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v17 = objc_msgSend_entityType(v13, v14, v15, v16) - 1;
    if (v17 >= 8)
    {
      uint64_t v28 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        int v40 = 136315394;
        uint64_t v41 = "+[SEMOntologyMapper _appendSpanProperties:forHomeMatch:entityInfo:]";
        __int16 v42 = 2112;
        id v43 = v8;
        _os_log_error_impl(&dword_25C7CA000, v28, OS_LOG_TYPE_ERROR, "%s Could not extract identifier value matched entity, omitting home entity type identifiers. %@", (uint8_t *)&v40, 0x16u);
      }
      id v18 = 0;
    }
    else
    {
      id v18 = **((id **)&unk_2654DEC60 + (int)v17);
      if (v18)
      {
        id v19 = objc_alloc(MEMORY[0x263F73A08]);
        uint64_t v21 = objc_msgSend_initWithKey_valueString_(v19, v20, *MEMORY[0x263F73848], (uint64_t)v18);
        objc_msgSend_addObject_(v7, v22, (uint64_t)v21, v23);
      }
    }
    id v29 = sub_25C80E2A0(v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend_assistantHomeKitIdentifier(v29, v30, v31, v32),
          (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v34 = objc_alloc(MEMORY[0x263F73A08]);
      uint64_t v36 = objc_msgSend_initWithKey_valueString_(v34, v35, *MEMORY[0x263F73810], (uint64_t)v33);
      objc_msgSend_addObject_(v7, v37, (uint64_t)v36, v38);
    }
    else
    {
      id v39 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        int v40 = 136315394;
        uint64_t v41 = "+[SEMOntologyMapper _appendSpanProperties:forHomeMatch:entityInfo:]";
        __int16 v42 = 2112;
        id v43 = v8;
        _os_log_error_impl(&dword_25C7CA000, v39, OS_LOG_TYPE_ERROR, "%s Could not find assistantHomeKitId for span match: %@", (uint8_t *)&v40, 0x16u);
      }
    }
  }
  else
  {
    id v18 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      int v40 = 136315906;
      uint64_t v41 = "+[SEMOntologyMapper _appendSpanProperties:forHomeMatch:entityInfo:]";
      __int16 v42 = 2112;
      id v43 = v25;
      __int16 v44 = 2112;
      uint64_t v45 = v27;
      __int16 v46 = 2112;
      id v47 = v8;
      _os_log_error_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_ERROR, "%s Unexpected content class: %@ expected: %@ for match: %@", (uint8_t *)&v40, 0x2Au);
    }
  }
}

+ (void)_appendSpanProperties:(id)a3 forAppShortcutPhraseMatch:(id)a4 entityInfo:(id)a5
{
  id v28 = a3;
  id v9 = objc_msgSend_content(a5, v6, v7, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_msgSend_baseTemplate(v9, v10, v11, v12);
    unsigned int v17 = objc_msgSend_templateParameterValue(v9, v14, v15, v16);
    if (v13)
    {
      id v18 = objc_alloc(MEMORY[0x263F73A08]);
      uint64_t v20 = objc_msgSend_initWithKey_valueString_(v18, v19, 0x2709E2110, (uint64_t)v13);
      objc_msgSend_addObject_(v28, v21, (uint64_t)v20, v22);
    }
    if (v17)
    {
      id v23 = objc_alloc(MEMORY[0x263F73A08]);
      id v25 = objc_msgSend_initWithKey_valueString_(v23, v24, 0x2709E2130, (uint64_t)v17);
      objc_msgSend_addObject_(v28, v26, (uint64_t)v25, v27);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
}

+ (void)_appendSpanProperties:(id)a3 forAppShortcutEntityMatch:(id)a4 entityInfo:(id)a5
{
  id v31 = a3;
  id v9 = objc_msgSend_content(a5, v6, v7, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_msgSend_providerClass(v9, v10, v11, v12);
    id v19 = objc_msgSend_entityInstanceIdentifier(v9, v14, v15, v16);
    if (v13)
    {
      id v20 = objc_alloc(MEMORY[0x263F73A08]);
      uint64_t v22 = objc_msgSend_initWithKey_valueString_(v20, v21, *MEMORY[0x263F73808], (uint64_t)v13);
      objc_msgSend_addObject_(v31, v23, (uint64_t)v22, v24);
    }
    if (v19)
    {
      id v25 = objc_msgSend_stringWithFormat_(NSString, v17, @"%@", v18, v19);
      id v26 = objc_alloc(MEMORY[0x263F73A08]);
      id v28 = objc_msgSend_initWithKey_valueString_(v26, v27, *MEMORY[0x263F73800], (uint64_t)v25);
      objc_msgSend_addObject_(v31, v29, (uint64_t)v28, v30);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
}

+ (void)_appendSpanProperties:(id)a3 forRadioStationMatch:(id)a4 entityInfo:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_content(a5, v9, v10, v11);
  id v22 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_25C803B70;
  v19[3] = &unk_2654DEC40;
  id v13 = v8;
  id v20 = v13;
  id v14 = v7;
  id v21 = v14;
  char v16 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v12, v15, (uint64_t)&v22, (uint64_t)v19);
  id v17 = v22;

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = "+[SEMOntologyMapper _appendSpanProperties:forRadioStationMatch:entityInfo:]";
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_error_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_ERROR, "%s Failed to enumerate radio station fields: %@ error: %@", buf, 0x20u);
    }
  }
}

+ (void)_appendSpanProperties:(id)a3 forGlobalTermMatch:(id)a4 entityInfo:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_25C80E2A0(v8);
  id v14 = objc_msgSend_sourceItemIdentifier(v10, v11, v12, v13);

  uint64_t v17 = objc_msgSend_rangeOfString_(v14, v15, @"#", v16);
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v23 = objc_msgSend_substringFromIndex_(v14, v18, (uint64_t)&v18[v17], v19);
    if (!v23)
    {
LABEL_18:

      goto LABEL_19;
    }
    int v24 = objc_msgSend_itemType(v9, v20, v21, v22);
    if (v24 <= 14024)
    {
      if (v24 == 3615)
      {
        __int16 v25 = off_2654DEB98;
      }
      else
      {
        if (v24 != 8194) {
          goto LABEL_16;
        }
        __int16 v25 = off_2654DEBA0;
      }
    }
    else
    {
      switch(v24)
      {
        case 14025:
          __int16 v25 = off_2654DEBA8;
          break;
        case 34307:
          __int16 v25 = off_2654DEB90;
          break;
        case 36059:
          __int16 v25 = off_2654DEBB0;
          break;
        default:
          goto LABEL_16;
      }
    }
    id v26 = *v25;
    if (v26)
    {
      __int16 v27 = v26;
      id v28 = objc_alloc(MEMORY[0x263F73A08]);
      uint64_t v30 = objc_msgSend_initWithKey_valueString_(v28, v29, (uint64_t)v27, (uint64_t)v23);
      objc_msgSend_addObject_(v7, v31, (uint64_t)v30, v32);

      goto LABEL_18;
    }
LABEL_16:
    uint64_t v33 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v34 = 136315394;
      uint64_t v35 = "+[SEMOntologyMapper _appendSpanProperties:forGlobalTermMatch:entityInfo:]";
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_error_impl(&dword_25C7CA000, v33, OS_LOG_TYPE_ERROR, "%s Could not extract identifier namespace from span match: %@, omitting global term identifiers.", (uint8_t *)&v34, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:
}

+ (void)_appendSpanProperties:(id)a3 forLearnedContactMatch:(id)a4 entityInfo:(id)a5
{
  id v19 = a3;
  id v9 = objc_msgSend_content(a5, v6, v7, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_msgSend_suggestedContactId(v9, v10, v11, v12);
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x263F73A08]);
      uint64_t v16 = objc_msgSend_initWithKey_valueString_(v14, v15, 0x2709E22F0, (uint64_t)v13);
      objc_msgSend_addObject_(v19, v17, (uint64_t)v16, v18);
    }
  }
}

+ (void)_appendSpanProperties:(id)a3 forLearnedMediaEntityMatch:(id)a4 entityInfo:(id)a5
{
  id v28 = a3;
  id v9 = objc_msgSend_content(a5, v6, v7, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_msgSend_suggestedAdamId(v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_userPhrasedVersion(v9, v14, v15, v16);
    if (v13)
    {
      id v18 = objc_alloc(MEMORY[0x263F73A08]);
      id v20 = objc_msgSend_initWithKey_valueString_(v18, v19, 0x2709E23B0, (uint64_t)v13);
      objc_msgSend_addObject_(v28, v21, (uint64_t)v20, v22);
    }
    if (v17)
    {
      id v23 = objc_alloc(MEMORY[0x263F73A08]);
      __int16 v25 = objc_msgSend_initWithKey_valueString_(v23, v24, 0x2709E2390, (uint64_t)v17);
      objc_msgSend_addObject_(v28, v26, (uint64_t)v25, v27);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
}

+ (void)_appendSpanProperties:(id)a3 forHomeServiceAreaMatch:(id)a4 entityInfo:(id)a5
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_content(a5, v9, v10, v11);
  uint64_t v16 = objc_msgSend_area(v12, v13, v14, v15);
  id v20 = objc_msgSend_map(v12, v17, v18, v19);
  if (objc_msgSend_hasMatterDeviceIdentifier(v12, v21, v22, v23))
  {
    uint64_t v27 = NSString;
    uint64_t v28 = objc_msgSend_matterDeviceIdentifier(v12, v24, v25, v26);
    id v31 = objc_msgSend_stringWithFormat_(v27, v29, @"%llu", v30, v28);
    id v32 = objc_alloc(MEMORY[0x263F73A08]);
    int v34 = objc_msgSend_initWithKey_valueString_(v32, v33, 0x2709E1F50, (uint64_t)v31);
    objc_msgSend_addObject_(v7, v35, (uint64_t)v34, v36);
  }
  int v37 = objc_msgSend_serviceAreaType(v12, v24, v25, v26);
  if (!v37)
  {
    uint64_t v59 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    v81 = "+[SEMOntologyMapper _appendSpanProperties:forHomeServiceAreaMatch:entityInfo:]";
    __int16 v82 = 2112;
    id v83 = v8;
    v60 = "%s ServiceAreaType Unknown. %@";
    goto LABEL_18;
  }
  if (v37 != 2)
  {
    if (v37 == 1)
    {
      id v38 = objc_alloc(MEMORY[0x263F73A08]);
      int v40 = objc_msgSend_initWithKey_valueString_(v38, v39, *MEMORY[0x263F73848], 0x2709E1F10);
      objc_msgSend_addObject_(v7, v41, (uint64_t)v40, v42);

      if (v16 && objc_msgSend_hasAreaIdentifier(v16, v43, v44, v45))
      {
        id v49 = NSString;
        uint64_t v50 = objc_msgSend_areaIdentifier(v16, v46, v47, v48);
        uint64_t v53 = objc_msgSend_stringWithFormat_(v49, v51, @"%u", v52, v50);
        id v54 = objc_alloc(MEMORY[0x263F73A08]);
        long long v56 = objc_msgSend_initWithKey_valueString_(v54, v55, 0x2709E1F90, (uint64_t)v53);
        objc_msgSend_addObject_(v7, v57, (uint64_t)v56, v58);
LABEL_14:

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    uint64_t v59 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    v81 = "+[SEMOntologyMapper _appendSpanProperties:forHomeServiceAreaMatch:entityInfo:]";
    __int16 v82 = 2112;
    id v83 = v8;
    v60 = "%s Could not extract service area type, omitting service idea type & identifier. %@";
LABEL_18:
    _os_log_error_impl(&dword_25C7CA000, v59, OS_LOG_TYPE_ERROR, v60, buf, 0x16u);
    goto LABEL_16;
  }
  id v61 = objc_alloc(MEMORY[0x263F73A08]);
  uint64_t v63 = objc_msgSend_initWithKey_valueString_(v61, v62, *MEMORY[0x263F73848], 0x2709E1F30);
  objc_msgSend_addObject_(v7, v64, (uint64_t)v63, v65);

  if (v20 && objc_msgSend_hasMapIdentifier(v20, v66, v67, v68))
  {
    __int16 v72 = NSString;
    uint64_t v73 = objc_msgSend_mapIdentifier(v20, v69, v70, v71);
    uint64_t v53 = objc_msgSend_stringWithFormat_(v72, v74, @"%u", v75, v73);
    id v76 = objc_alloc(MEMORY[0x263F73A08]);
    long long v56 = objc_msgSend_initWithKey_valueString_(v76, v77, 0x2709E1F70, (uint64_t)v53);
    objc_msgSend_addObject_(v7, v78, (uint64_t)v56, v79);
    goto LABEL_14;
  }
LABEL_16:
}

+ (id)_radioStationSignalTypeAsString:(unsigned int)a3
{
  if (a3 - 1 > 4) {
    return @"Unknown";
  }
  else {
    return off_2654DECA0[a3 - 1];
  }
}

@end