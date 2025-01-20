@interface _LTUnvalidatedEdgeInfo(Daemon)
+ (id)unvalidatedEdgeWithEMTAlternative:()Daemon;
+ (id)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:;
@end

@implementation _LTUnvalidatedEdgeInfo(Daemon)

+ (id)unvalidatedEdgeWithEMTAlternative:()Daemon
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 alternativeDescription];
    uint64_t v6 = [v5 alternativeType];
    if (v6 == 1)
    {
      v10 = [v5 meaningDescription];
      v7 = v10;
      if (v10)
      {
        v11 = [v10 definition];
        if ([v11 length])
        {
          v8 = objc_msgSend(a1, "meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:", objc_msgSend(v4, "translationPhraseIndex"), objc_msgSend(v4, "selectionSpanIndex"), v11);
        }
        else
        {
          v14 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:]();
          }
          v8 = 0;
        }

        goto LABEL_22;
      }
      v13 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:]();
      }
    }
    else
    {
      if (v6)
      {
        v8 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v7 = [v5 genderDescription];
      if (v7)
      {
        v8 = objc_msgSend(a1, "genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:", objc_msgSend(v4, "translationPhraseIndex"), objc_msgSend(v4, "selectionSpanIndex"), objc_msgSend(v7, "gender") != 0, objc_msgSend(v7, "defaultGender") != 0);
LABEL_22:

        goto LABEL_23;
      }
      v12 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:]();
      }
    }
    v8 = 0;
    goto LABEL_22;
  }
  v9 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:].cold.4();
  }
  v8 = 0;
LABEL_24:

  return v8;
}

+ (id)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (int)objc_msgSend(v6, "alternative_description_index");
  if ([v7 count] > v8)
  {
    v9 = [v7 objectAtIndexedSubscript:v8];
    uint64_t v10 = objc_msgSend(v9, "alternative_type");
    if (v10)
    {
      if (v10 != 1)
      {
        v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v11 = objc_msgSend(v9, "meaning_description");
      v12 = v11;
      if (v11)
      {
        v13 = [v11 definition];
        if ([v13 length])
        {
          v14 = objc_msgSend(a1, "meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:", (int)objc_msgSend(v6, "translation_phrase_index"), (int)objc_msgSend(v6, "selection_span_index"), v13);
        }
        else
        {
          v18 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:]();
          }
          v14 = 0;
        }

        goto LABEL_22;
      }
      v16 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:]();
      }
    }
    else
    {
      v12 = objc_msgSend(v9, "gender_description");
      if (v12)
      {
        v14 = objc_msgSend(a1, "genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:", (int)objc_msgSend(v6, "translation_phrase_index"), (int)objc_msgSend(v6, "selection_span_index"), objc_msgSend(v12, "gender") != 0, objc_msgSend(v12, "default_gender") != 0);
LABEL_22:

        goto LABEL_23;
      }
      v17 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:]();
      }
    }
    v14 = 0;
    goto LABEL_22;
  }
  v15 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:].cold.4(v15, v7, v8);
  }
  v14 = 0;
LABEL_24:

  return v14;
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_10(&dword_2600DC000, v0, v1, "Got unexpected EMT Alternative Description where type is gender but there's no gender description", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_10(&dword_2600DC000, v0, v1, "Got unexpected EMT Alternative Description where type is meaning but there's no meaning description", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Can't create edge from EMTMeaningDescription since the definition is empty", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Can't create disambiguation info because the version of EmbeddedAcousticRecognition on the system is too old", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_10(&dword_2600DC000, v0, v1, "Got unexpected FT Alternative Description where type is meaning but there's no meaning description", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Can't create edge from FTMTAlternativeDescription since the definition is empty", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_10(&dword_2600DC000, v0, v1, "Got unexpected FT Alternative Description where type is gender but there's no gender description", v2, v3, v4, v5, v6);
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = a3;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 count];
  _os_log_fault_impl(&dword_2600DC000, v5, OS_LOG_TYPE_FAULT, "Can't create unvalidated edge info from FTAlternative because description index %zu doesn't exist; descriptions has %zu items",
    (uint8_t *)&v6,
    0x16u);
}

@end