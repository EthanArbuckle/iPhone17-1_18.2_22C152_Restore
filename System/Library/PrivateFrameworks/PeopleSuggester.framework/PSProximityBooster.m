@interface PSProximityBooster
@end

@implementation PSProximityBooster

void __27___PSProximityBooster_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __27___PSProximityBooster_init__block_invoke_cold_1();
  }
}

void __27___PSProximityBooster_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __27___PSProximityBooster_init__block_invoke_7_cold_1();
  }
}

void __27___PSProximityBooster_init__block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __27___PSProximityBooster_init__block_invoke_10_cold_1((uint64_t)v4, a3, v5);
  }
}

void __27___PSProximityBooster_init__block_invoke_15()
{
  v0 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __27___PSProximityBooster_init__block_invoke_15_cold_1();
  }
}

void __27___PSProximityBooster_init__block_invoke_19()
{
  v0 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __27___PSProximityBooster_init__block_invoke_19_cold_1();
  }
}

void __47___PSProximityBooster_startMonitoringProximity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging heuristicsChannel];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_1();
  }
}

void __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) peopleDiscovery];
  v3 = [v2 discoveredPeople];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "contactID", (void)v13);
        if (v9) {
          [*(id *)(a1 + 40) addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v4 count];
  v11 = +[_PSLogging heuristicsChannel];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_2();
    }
  }
  else if (v12)
  {
    __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_1();
  }
}

uint64_t __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_32(uint64_t a1, void *a2)
{
  v3 = [a2 recipients];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    uint64_t v5 = [v4 contact];
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __27___PSProximityBooster_init__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "Found new person: %@", v1, 0xCu);
}

void __27___PSProximityBooster_init__block_invoke_7_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "Lost person: %@", v1, 0xCu);
}

void __27___PSProximityBooster_init__block_invoke_10_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1A314B000, a3, OS_LOG_TYPE_DEBUG, "Changed person: %@, changes: %@", (uint8_t *)&v6, 0x16u);
}

void __27___PSProximityBooster_init__block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "People discovery session invalidated", v1, 2u);
}

void __27___PSProximityBooster_init__block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "People discovery session interrupted", v1, 2u);
}

void __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "Activated people discovery", v1, 2u);
}

void __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "Error activating people discovery: %@", v1, 0xCu);
}

void __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "No nearby people to boost suggestions", v1, 2u);
}

void __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A314B000, v1, OS_LOG_TYPE_DEBUG, "Boosting suggestions with nearby people: %@, nearbyContactIDs: %@", v2, 0x16u);
}

@end