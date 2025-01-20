@interface USUsageQuerying
+ (_DKKnowledgeStore)userKnowledgeStore;
+ (id)_chronologicalPublisherWithOptions:(id)a3 eventStreams:(id)a4;
+ (id)_generatePickupsByBundleIdentifierWithPickupIntervals:(id)a3 applicationUsageIntervals:(id)a4 pickupsWithoutApplicationUsage:(unint64_t *)a5 firstPickup:(id *)a6;
+ (id)_newReportWithNonIntersectingScreenTimeIntervals:(id)a3 pickupsByBundleIdentifier:(id)a4 pickupsWithoutApplicationUsage:(unint64_t)a5 firstPickup:(id)a6 longestSession:(id)a7 applicationUsageIntervals:(id)a8 webUsageIntervals:(id)a9 categoryUsageIntervals:(id)a10 aggregatedApplicationUsageIntervals:(id)a11 aggregatedWebUsageIntervals:(id)a12 categoryByBundleIdentifier:(id)a13 categoryByWebDomain:(id)a14 notifications:(id)a15 interval:(id)a16 timeZone:(id)a17 lastEventDate:(id)a18;
+ (id)getLocalDeviceIdentifierAndReturnError:(id *)a3;
+ (void)_completion:(id)a3 options:(id)a4;
+ (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 adjustedStartDate:(id)a5 eventStreams:(id)a6 categoryByBundleIdentifier:(id)a7 categoryByWebDomain:(id)a8 usageReportHandler:(id)a9 completionHandler:(id)a10;
+ (void)synchronizeUsageWithCompletionHandler:(id)a3;
- (BMCoreDuetStream)duetStream;
- (USUsageQuerying)init;
- (USUsageQuerying)initWithContext:(id)a3 coreDuetStream:(id)a4;
- (USUsageQuerying)initWithContext:(id)a3 eventStorage:(id)a4;
- (_CDUserContext)context;
- (double)_computeUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 applicationUsageEvents:(id)a6 webUsageEvents:(id)a7 nowPlayingEvents:(id)a8 videoUsageEvents:(id)a9 categoryByBundleIdentifier:(id)a10 categoryByWebDomain:(id)a11 interval:(id)a12 referenceDate:(id)a13 focalOnly:(BOOL)a14;
- (double)_generateUsageTimeWithApplicationUsageIntervals:(id)a3 webUsageIntervalsByDevice:(id)a4 categoryUsageIntervalsByDevice:(id)a5 aggregatedApplicationUsageIntervalsByDevice:(id)a6 aggregatedWebUsageIntervalsByDevice:(id)a7 categoryByBundleIdentifier:(id)a8 categoryByWebDomain:(id)a9 applications:(id)a10 webDomains:(id)a11 categories:(id)a12;
- (id)_computeApplicationUsageWithEvents:(id)a3 unboundApplicationUsageIntervalsByDevice:(id *)a4 timeZoneByDevice:(id)a5 lastEventDateByDevice:(id)a6 categoryUsageIntervalsByDevice:(id)a7 aggregatedApplicationUsageIntervalsByDevice:(id)a8 categoryByBundleIdentifier:(id)a9 partition:(id)a10 referenceDate:(id)a11 focalOnly:(BOOL)a12;
- (id)_computeNotificationsWithEvents:(id)a3 timeZoneByDevice:(id)a4 lastEventDateByDevice:(id)a5 partition:(id)a6;
- (id)_computeScreenTime:(BOOL)a3 withEvents:(id)a4 intersectingScreenTimeIntervalsByDevice:(id *)a5 longestSessionByDevice:(id *)a6 timeZoneByDevice:(id)a7 lastEventDateByDevice:(id)a8 partition:(id)a9 referenceDate:(id)a10;
- (id)_computeWebUsageWithEvents:(id)a3 timeZoneByDevice:(id)a4 lastEventDateByDevice:(id)a5 categoryUsageIntervalsByDevice:(id)a6 aggregatedApplicationUsageIntervalsByDevice:(id)a7 aggregatedWebUsageIntervalsByDevice:(id)a8 categoryByWebDomain:(id)a9 partition:(id)a10 referenceDate:(id)a11 focalOnly:(BOOL)a12;
- (id)_currentNowPlayingUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4;
- (id)_currentScreenTimeIntervalDuringInterval:(id)a3 usageStartDate:(id *)a4 referenceDate:(id)a5;
- (id)_generateUncategorizedLocalWebUsageWithWebUsageIntervals:(id)a3 uncategorizedDomains:(id)a4;
- (id)_getBundleIdentiersFromApplicationUsageEvents:(id)a3 videoUsageEvents:(id)a4 interval:(id)a5 referenceDate:(id)a6 focalOnly:(BOOL)a7;
- (id)_getWebDomainsFromWebUsageEvents:(id)a3 videoUsageEvents:(id)a4 interval:(id)a5 referenceDate:(id)a6 focalOnly:(BOOL)a7;
- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 error:(id *)a7;
- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 focalOnly:(BOOL)a7 error:(id *)a8;
- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 segmentInterval:(double)a7 error:(id *)a8;
- (void)_computeNowPlayingUsageWithEvents:(id)a3 categoryUsageIntervalsByDevice:(id)a4 timeZoneByDevice:(id)a5 lastEventDateByDevice:(id)a6 partition:(id)a7 referenceDate:(id)a8;
- (void)_computeUncategorizedLocalWebUsageWithWebUsageEvents:(id)a3 uncategorizedDomains:(id)a4 interval:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7;
- (void)_computeUsageWithDisplayBacklitEvents:(id)a3 applicationUsageEvents:(id)a4 webUsageEvents:(id)a5 nowPlayingEvents:(id)a6 videoUsageEvents:(id)a7 notificationEvents:(id)a8 categoryByBundleIdentifier:(id)a9 categoryByWebDomain:(id)a10 interval:(id)a11 partitionInterval:(double)a12 referenceDate:(id)a13 focalOnly:(BOOL)a14 completionHandler:(id)a15;
- (void)_enumerateCurrentApplicationUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 focalOnly:(BOOL)a5 block:(id)a6;
- (void)_enumerateCurrentVideoUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 block:(id)a5;
- (void)_enumerateCurrentWebUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 focalOnly:(BOOL)a5 block:(id)a6;
- (void)_enumerateEvents:(id)a3 intervalEndDate:(id)a4 block:(id)a5;
- (void)_updateApplicationUsageWithInterval:(id)a3 unboundInterval:(id)a4 bundleIdentifier:(id)a5 trustedApplicationUsage:(BOOL)a6 deviceIdentifier:(id)a7 event:(id)a8 applicationUsageIntervalsByDevice:(id)a9 unboundApplicationUsageIntervalsByDevice:(id)a10 categoryUsageIntervalsByDevice:(id)a11 aggregatedApplicationUsageIntervalsByDevice:(id)a12 categoryByBundleIdentifier:(id)a13 timeZoneByDevice:(id)a14 lastEventDateByDevice:(id)a15;
- (void)_updateLocalReports:(id)a3 remoteReports:(id)a4 aggregateReports:(id)a5 nonIntersectingScreenTimeIntervals:(id)a6 intersectingScreenTimeIntervals:(id)a7 longestSessionByDevice:(id)a8 applicationUsageIntervals:(id)a9 unboundApplicationUsageIntervals:(id)a10 webUsageIntervalsByDevice:(id)a11 categoryUsageIntervalsByDevice:(id)a12 aggregatedApplicationUsageIntervalsByDevice:(id)a13 aggregatedWebUsageIntervalsByDevice:(id)a14 categoryByBundleIdentifier:(id)a15 categoryByWebDomain:(id)a16 notificationsByDevice:(id)a17 interval:(id)a18 timeZoneByDevice:(id)a19 lastEventDateByDevice:(id)a20;
- (void)_updateNotificationsWithEvent:(id)a3 bundleIdentifier:(id)a4 trustedNotification:(BOOL)a5 deviceIdentifier:(id)a6 notificationsByDevice:(id)a7 timeZoneByDevice:(id)a8 lastEventDateByDevice:(id)a9;
- (void)_updateNowPlayingUsageWithInterval:(id)a3 event:(id)a4 deviceIdentifier:(id)a5 categoryUsageIntervalsByDevice:(id)a6 timeZoneByDevice:(id)a7 lastEventDateByDevice:(id)a8;
- (void)_updateScreenTimeWithInterval:(id)a3 rawInterval:(id)a4 deviceIdentifier:(id)a5 partition:(id)a6 event:(id)a7 nonIntersectingScreenTimeIntervalsByDevice:(id)a8 intersectingScreenTimeIntervalsByDevice:(id)a9 longestSessionByDevice:(id)a10 timeZoneByDevice:(id)a11 lastEventDateByDevice:(id)a12;
- (void)_updateWebUsageWithInterval:(id)a3 webDomain:(id)a4 trustedWebUsage:(BOOL)a5 deviceIdentifier:(id)a6 event:(id)a7 webUsageIntervalsByDevice:(id)a8 categoryUsageIntervalsByDevice:(id)a9 aggregatedApplicationUsageIntervalsByDevice:(id)a10 aggregatedWebUsageIntervalsByDevice:(id)a11 categoryByWebDomain:(id)a12 timeZoneByDevice:(id)a13 lastEventDateByDevice:(id)a14;
- (void)queryForUncategorizedLocalWebUsageDuringInterval:(id)a3 completionHandler:(id)a4;
- (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 completionHandler:(id)a5;
- (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 focalOnly:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation USUsageQuerying

- (USUsageQuerying)initWithContext:(id)a3 coreDuetStream:(id)a4
{
  v6 = (_CDUserContext *)a3;
  v7 = (BMCoreDuetStream *)a4;
  v13.receiver = self;
  v13.super_class = (Class)USUsageQuerying;
  v8 = [(USUsageQuerying *)&v13 init];
  context = v8->_context;
  v8->_context = v6;
  v10 = v6;

  duetStream = v8->_duetStream;
  v8->_duetStream = v7;

  return v8;
}

- (USUsageQuerying)initWithContext:(id)a3 eventStorage:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F2A778];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithKnowledgeStore:v7 clientContext:v8 identifier:@"CoreDuetStream"];

  v10 = [(USUsageQuerying *)self initWithContext:v8 coreDuetStream:v9];
  return v10;
}

- (USUsageQuerying)init
{
  v3 = [MEMORY[0x263F351B8] userContext];
  v4 = [MEMORY[0x263F2A9B8] coreDuetStream];
  v5 = [(USUsageQuerying *)self initWithContext:v3 coreDuetStream:v4];

  return v5;
}

+ (_DKKnowledgeStore)userKnowledgeStore
{
  if (userKnowledgeStore_onceToken != -1) {
    dispatch_once(&userKnowledgeStore_onceToken, &__block_literal_global);
  }
  v2 = (void *)userKnowledgeStore_userKnowledgeStore;
  return (_DKKnowledgeStore *)v2;
}

uint64_t __37__USUsageQuerying_userKnowledgeStore__block_invoke()
{
  userKnowledgeStore_userKnowledgeStore = [MEMORY[0x263F350B8] userKnowledgeStore];
  return MEMORY[0x270F9A758]();
}

+ (id)getLocalDeviceIdentifierAndReturnError:(id *)a3
{
  v4 = [a1 userKnowledgeStore];
  v5 = [v4 sourceDeviceIdentityWithError:a3];

  return v5;
}

+ (void)synchronizeUsageWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  MainBundle = CFBundleGetMainBundle();
  Identifier = (__CFString *)CFBundleGetIdentifier(MainBundle);
  if (Identifier)
  {
    v6 = Identifier;
  }
  else
  {
    id v7 = [MEMORY[0x263F08AB0] processInfo];
    v6 = [v7 processName];
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Requesting high urgency synchronization on behalf of %{public}@", (uint8_t *)&v11, 0xCu);
  }
  qos_class_t v8 = qos_class_self();
  v9 = dispatch_get_global_queue(v8, 0);
  v10 = [MEMORY[0x263F350B8] userKnowledgeStore];
  [v10 synchronizeWithUrgency:10 client:@"UsageTracking" responseQueue:v9 completion:v3];
}

- (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 completionHandler:(id)a5
{
}

- (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 focalOnly:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v149 = a5;
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v145 = a6;
  v146 = objc_opt_new();
  v150 = self;
  v10 = [(USUsageQuerying *)self duetStream];
  id v11 = v9;
  v12 = objc_opt_new();
  uint64_t v13 = [MEMORY[0x263F35090] allDevices];
  [v12 setDeviceIDs:v13];

  v14 = [MEMORY[0x263F35148] displayIsBacklit];
  v160 = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v160 count:1];
  [v12 setEventStreams:v15];

  v16 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  id v162 = v16;
  v17 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  v163 = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:2];
  [v12 setSortDescriptors:v18];

  v19 = (void *)MEMORY[0x263F35110];
  v20 = [v11 startDate];
  v21 = [v11 endDate];
  v22 = [v19 predicateForEventsIntersectingDateRangeFrom:v20 to:v21];

  v23 = (void *)MEMORY[0x263F35110];
  v24 = [MEMORY[0x263F35050] yes];
  v25 = [v23 predicateForEventsWithCategoryValue:v24];

  id v26 = objc_alloc(MEMORY[0x263F08730]);
  v167 = v22;
  v168 = v25;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:2];

  v28 = (void *)[v26 initWithType:1 subpredicates:v27];
  [v12 setPredicate:v28];

  v29 = [v10 publisherForQuery:v12];

  v144 = [v29 collect];

  v142 = [(USUsageQuerying *)self duetStream];
  v30 = (void *)MEMORY[0x263F35110];
  id v31 = v11;
  v32 = [v31 startDate];
  v33 = [v31 endDate];
  v34 = [v30 predicateForEventsIntersectingDateRangeFrom:v32 to:v33];

  v35 = [MEMORY[0x263F35080] usageType];
  v138 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v35 andIntegerValue:1];
  v147 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v35];
  v36 = [MEMORY[0x263F08730] notPredicateWithSubpredicate:v147];
  v37 = (void *)MEMORY[0x263F08730];
  id v162 = v138;
  v163 = v36;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:2];
  v39 = [v37 orPredicateWithSubpredicates:v38];

  id v40 = objc_alloc(MEMORY[0x263F08730]);
  v167 = v34;
  v168 = v39;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:2];
  v42 = (void *)[v40 initWithType:1 subpredicates:v41];

  v43 = objc_opt_new();
  v44 = [MEMORY[0x263F35090] allDevices];
  [v43 setDeviceIDs:v44];

  v45 = [MEMORY[0x263F35148] appUsageStream];
  v166 = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v166 count:1];
  [v43 setEventStreams:v46];

  if (v149) {
    v47 = v42;
  }
  else {
    v47 = v34;
  }
  [v43 setPredicate:v47];
  v48 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  v160 = v48;
  v49 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  v161 = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v160 count:2];

  [v43 setSortDescriptors:v50];
  v51 = [v142 publisherForQuery:v43];

  v148 = [v51 collect];

  v139 = [(USUsageQuerying *)v150 duetStream];
  id v52 = v31;
  v53 = (void *)MEMORY[0x263F35110];
  v54 = [v52 startDate];
  v55 = [v52 endDate];
  v56 = [v53 predicateForEventsIntersectingDateRangeFrom:v54 to:v55];

  v57 = [MEMORY[0x263F35080] usageType];
  id v58 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v57 andIntegerValue:1];
  v59 = v58;
  if (!v149)
  {
    v60 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v57 andIntegerValue:0];
    id v61 = objc_alloc(MEMORY[0x263F08730]);
    id v162 = v58;
    v163 = v60;
    v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:2];
    v59 = (void *)[v61 initWithType:2 subpredicates:v62];
  }
  v63 = objc_opt_new();
  v64 = [MEMORY[0x263F35090] allDevices];
  [v63 setDeviceIDs:v64];

  v65 = [MEMORY[0x263F35148] appWebUsageStream];
  v166 = v65;
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v166 count:1];
  [v63 setEventStreams:v66];

  id v67 = objc_alloc(MEMORY[0x263F08730]);
  v167 = v56;
  v168 = v59;
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:2];
  v69 = (void *)[v67 initWithType:1 subpredicates:v68];
  [v63 setPredicate:v69];

  v70 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  v160 = v70;
  v71 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  v161 = v71;
  v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v160 count:2];
  [v63 setSortDescriptors:v72];

  v73 = [v139 publisherForQuery:v63];

  v143 = [v73 collect];

  v136 = [(USUsageQuerying *)v150 duetStream];
  v74 = (void *)MEMORY[0x263F35110];
  id v75 = v52;
  v76 = [v75 startDate];
  v77 = [v75 endDate];
  v134 = [v74 predicateForEventsIntersectingDateRangeFrom:v76 to:v77];

  v78 = (void *)MEMORY[0x263F35110];
  v79 = [MEMORY[0x263F350F0] playing];
  v133 = [v78 predicateForObjectsWithMetadataKey:v79 andIntegerValue:1];

  v80 = (void *)MEMORY[0x263F35110];
  v81 = [MEMORY[0x263F350F0] mediaType];
  v82 = [v80 predicateForObjectsWithMetadataKey:v81 andStringValue:*MEMORY[0x263F54C48]];

  v140 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:@"com.apple.quicklook.QuickLookUIService"];
  v135 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:@"com.apple.quicklook.extension.previewUI"];
  id v83 = objc_alloc(MEMORY[0x263F08730]);
  v167 = v140;
  v168 = v135;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:2];
  v85 = (void *)[v83 initWithType:2 subpredicates:v84];

  v86 = objc_opt_new();
  v87 = [MEMORY[0x263F35090] allDevices];
  [v86 setDeviceIDs:v87];

  v88 = [MEMORY[0x263F35148] nowPlayingStream];
  v166 = v88;
  v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v166 count:1];
  [v86 setEventStreams:v89];

  id v90 = objc_alloc(MEMORY[0x263F08730]);
  id v162 = v134;
  v163 = v133;
  v164 = v82;
  v165 = v85;
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:4];
  v92 = (void *)[v90 initWithType:1 subpredicates:v91];
  [v86 setPredicate:v92];

  v93 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  v160 = v93;
  v94 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  v161 = v94;
  v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v160 count:2];

  [v86 setSortDescriptors:v95];
  v96 = [v136 publisherForQuery:v86];

  v141 = [v96 collect];

  v97 = [(USUsageQuerying *)v150 duetStream];
  id v98 = v75;
  v99 = objc_opt_new();
  v100 = [MEMORY[0x263F35090] allDevices];
  [v99 setDeviceIDs:v100];

  v101 = [MEMORY[0x263F35148] appMediaUsageStream];
  v167 = v101;
  v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:1];
  [v99 setEventStreams:v102];

  v103 = (void *)MEMORY[0x263F35110];
  v104 = [v98 startDate];
  v105 = [v98 endDate];
  v106 = [v103 predicateForEventsIntersectingDateRangeFrom:v104 to:v105];
  [v99 setPredicate:v106];

  v107 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  id v162 = v107;
  v108 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  v163 = v108;
  v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:2];

  [v99 setSortDescriptors:v109];
  v110 = [v97 publisherForQuery:v99];

  v137 = [v110 collect];

  v111 = [(USUsageQuerying *)v150 duetStream];
  id v112 = v98;
  v113 = objc_opt_new();
  v114 = [MEMORY[0x263F35090] allDevices];
  [v113 setDeviceIDs:v114];

  v115 = [MEMORY[0x263F35148] notificationUsageStream];
  v167 = v115;
  v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:1];
  [v113 setEventStreams:v116];

  v117 = (void *)MEMORY[0x263F35110];
  v118 = [v112 startDate];
  v119 = [v112 endDate];
  v120 = [v117 predicateForEventsWithStartInDateRangeFrom:v118 to:v119];

  v121 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:@"Receive"];
  id v122 = objc_alloc(MEMORY[0x263F08730]);
  id v162 = v120;
  v163 = v121;
  v123 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:2];

  v124 = (void *)[v122 initWithType:1 subpredicates:v123];
  [v113 setPredicate:v124];

  v125 = [v111 publisherForQuery:v113];

  v126 = [v125 collect];

  v159[0] = v148;
  v159[1] = v143;
  v159[2] = v141;
  v159[3] = v137;
  v159[4] = v126;
  v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:5];
  v128 = [v144 zipWithOthers:v127];
  v157[0] = MEMORY[0x263EF8330];
  v157[1] = 3221225472;
  v157[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke;
  v157[3] = &unk_26431DE98;
  id v158 = v145;
  v151[0] = MEMORY[0x263EF8330];
  v151[1] = 3221225472;
  v151[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2;
  v151[3] = &unk_26431DEE8;
  v151[4] = v150;
  id v152 = v112;
  BOOL v156 = v149;
  id v153 = v146;
  id v154 = v158;
  double v155 = a4;
  id v129 = v158;
  id v130 = v146;
  id v131 = v112;
  id v132 = (id)[v128 sinkWithCompletion:v157 receiveInput:v151];
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == 1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [v5 error];
    (*(void (**)(uint64_t, void, void, void, void *))(v3 + 16))(v3, 0, 0, 0, v4);
  }
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count] != 6)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    v33 = [NSString stringWithUTF8String:"-[USUsageQuerying queryUsageDuringInterval:partitionInterval:focalOnly:completionHandler:]_block_invoke_2"];
    [v32 handleFailureInFunction:v33 file:@"USUsageQuerying.m" lineNumber:129 description:@"Expecting event types count to be 6"];
  }
  v39 = [v3 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 objectAtIndexedSubscript:1];
  v38 = [v3 objectAtIndexedSubscript:2];
  v37 = [v3 objectAtIndexedSubscript:3];
  uint64_t v5 = [v3 objectAtIndexedSubscript:4];
  id v40 = v3;
  v6 = [v3 objectAtIndexedSubscript:5];
  id v7 = [MEMORY[0x263F35008] appBundleID];
  qos_class_t v8 = [MEMORY[0x263F350E8] bundleID];
  uint64_t v35 = a1;
  v36 = (void *)v5;
  v41 = (void *)v4;
  id v9 = [*(id *)(a1 + 32) _getBundleIdentiersFromApplicationUsageEvents:v4 videoUsageEvents:v5 interval:*(void *)(a1 + 40) referenceDate:*(void *)(a1 + 48) focalOnly:*(unsigned __int8 *)(a1 + 72)];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v59 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v16 = [v15 metadata];
        v17 = [v16 objectForKeyedSubscript:v7];

        v18 = [v15 metadata];
        v19 = [v18 objectForKeyedSubscript:v8];

        if (v17) {
          v20 = v17;
        }
        else {
          v20 = v19;
        }
        id v21 = v20;
        if (v21)
        {
          [v9 addObject:v21];
        }
        else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_2(&buf, v57);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_1();
    }
    v22 = [MEMORY[0x263F318B0] sharedCategories];
    v42 = [v9 array];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_38;
    v43[3] = &unk_26431DEC0;
    id v23 = *(id *)(v35 + 56);
    uint64_t v24 = *(void *)(v35 + 32);
    id v53 = v23;
    v43[4] = v24;
    id v44 = v38;
    v25 = v36;
    id v45 = v36;
    id v46 = *(id *)(v35 + 40);
    id v26 = *(id *)(v35 + 48);
    char v55 = *(unsigned char *)(v35 + 72);
    id v47 = v26;
    id v48 = v22;
    v27 = v39;
    id v49 = v39;
    id v50 = v41;
    v28 = v37;
    id v51 = v37;
    id v52 = v10;
    v29 = v38;
    uint64_t v54 = *(void *)(v35 + 64);
    id v30 = v22;
    [v30 categoriesForBundleIDs:v42 completionHandler:v43];

    id v31 = v41;
  }
  else
  {
    LOBYTE(v34) = *(unsigned char *)(v35 + 72);
    v29 = v38;
    v27 = v39;
    id v31 = v41;
    v25 = v36;
    v28 = v37;
    [*(id *)(v35 + 32) _computeUsageWithDisplayBacklitEvents:v39 applicationUsageEvents:v41 webUsageEvents:v38 nowPlayingEvents:v37 videoUsageEvents:v36 notificationEvents:v10 categoryByBundleIdentifier:*(double *)(v35 + 64) categoryByWebDomain:0 interval:0 partitionInterval:*(void *)(v35 + 40) referenceDate:*(void *)(v35 + 48) focalOnly:v34 completionHandler:*(void *)(v35 + 56)];
  }
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _getWebDomainsFromWebUsageEvents:*(void *)(a1 + 40) videoUsageEvents:*(void *)(a1 + 48) interval:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 64) focalOnly:*(unsigned __int8 *)(a1 + 128)];
    if ([v4 count])
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
        __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_38_cold_1();
      }
      uint64_t v5 = *(void **)(a1 + 72);
      v6 = [v4 array];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_39;
      v10[3] = &unk_26431DEC0;
      id v7 = *(id *)(a1 + 112);
      uint64_t v8 = *(void *)(a1 + 32);
      id v20 = v7;
      v10[4] = v8;
      id v11 = *(id *)(a1 + 80);
      id v12 = *(id *)(a1 + 88);
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 96);
      id v15 = *(id *)(a1 + 48);
      id v16 = *(id *)(a1 + 104);
      id v17 = v3;
      id v18 = *(id *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 120);
      id v19 = *(id *)(a1 + 64);
      char v22 = *(unsigned char *)(a1 + 128);
      [v5 categoriesForDomainNames:v6 completionHandler:v10];
    }
    else
    {
      LOBYTE(v9) = *(unsigned char *)(a1 + 128);
      [*(id *)(a1 + 32) _computeUsageWithDisplayBacklitEvents:*(void *)(a1 + 80) applicationUsageEvents:*(void *)(a1 + 88) webUsageEvents:*(void *)(a1 + 40) nowPlayingEvents:*(void *)(a1 + 96) videoUsageEvents:*(void *)(a1 + 48) notificationEvents:*(void *)(a1 + 104) categoryByBundleIdentifier:*(double *)(a1 + 120) categoryByWebDomain:v3 interval:0 partitionInterval:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 64) focalOnly:v9 completionHandler:*(void *)(a1 + 112)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
  }
}

uint64_t __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_39(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    LOBYTE(v4) = *(unsigned char *)(a1 + 128);
    return [*(id *)(a1 + 32) _computeUsageWithDisplayBacklitEvents:*(void *)(a1 + 40) applicationUsageEvents:*(void *)(a1 + 48) webUsageEvents:*(void *)(a1 + 56) nowPlayingEvents:*(void *)(a1 + 64) videoUsageEvents:*(void *)(a1 + 72) notificationEvents:*(void *)(a1 + 80) categoryByBundleIdentifier:*(double *)(a1 + 120) categoryByWebDomain:*(void *)(a1 + 88) interval:a2 partitionInterval:*(void *)(a1 + 96) referenceDate:*(void *)(a1 + 104) focalOnly:v4 completionHandler:*(void *)(a1 + 112)];
  }
  else
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 112) + 16);
    return v3();
  }
}

- (void)_computeUsageWithDisplayBacklitEvents:(id)a3 applicationUsageEvents:(id)a4 webUsageEvents:(id)a5 nowPlayingEvents:(id)a6 videoUsageEvents:(id)a7 notificationEvents:(id)a8 categoryByBundleIdentifier:(id)a9 categoryByWebDomain:(id)a10 interval:(id)a11 partitionInterval:(double)a12 referenceDate:(id)a13 focalOnly:(BOOL)a14 completionHandler:(id)a15
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v67 = a9;
  id v66 = a10;
  id v27 = a11;
  id v65 = a13;
  id v47 = (void (**)(id, void *, void *, void *, void))a15;
  v64 = objc_opt_new();
  uint64_t v63 = objc_opt_new();
  v62 = objc_opt_new();
  uint64_t v54 = v21;
  long long v61 = (void *)[v21 mutableCopy];
  id v53 = v22;
  v28 = (void *)[v22 mutableCopy];
  id v52 = v23;
  v29 = (void *)[v23 mutableCopy];
  id v51 = v24;
  long long v58 = (void *)[v24 mutableCopy];
  id v49 = v26;
  v57 = (void *)[v26 mutableCopy];
  long long v60 = v28;
  [v28 addObjectsFromArray:v25];
  long long v59 = v29;
  id v50 = v25;
  [v29 addObjectsFromArray:v25];
  id v30 = [v27 startDate];
  id v31 = [v27 endDate];
  id v48 = v27;
  [v27 duration];
  if (v32 <= a12)
  {
    id v33 = v31;
  }
  else
  {
    id v33 = [v30 dateByAddingTimeInterval:a12];
  }
  v73 = v33;
  v56 = v31;
  if ([v30 compare:v31] == -1)
  {
    do
    {
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v30 endDate:v73];
      v36 = objc_opt_new();
      v37 = objc_opt_new();
      v38 = objc_opt_new();
      v39 = objc_opt_new();
      id v40 = objc_opt_new();
      id v75 = 0;
      v76[0] = 0;
      v72 = [(USUsageQuerying *)self _computeScreenTime:1 withEvents:v61 intersectingScreenTimeIntervalsByDevice:v76 longestSessionByDevice:&v75 timeZoneByDevice:v39 lastEventDateByDevice:v40 partition:v35 referenceDate:v65];
      id v71 = v76[0];
      id v70 = v75;
      id v74 = 0;
      LOBYTE(v45) = a14;
      v69 = [(USUsageQuerying *)self _computeApplicationUsageWithEvents:v60 unboundApplicationUsageIntervalsByDevice:&v74 timeZoneByDevice:v39 lastEventDateByDevice:v40 categoryUsageIntervalsByDevice:v36 aggregatedApplicationUsageIntervalsByDevice:v37 categoryByBundleIdentifier:v67 partition:v35 referenceDate:v65 focalOnly:v45];
      id v68 = v74;
      LOBYTE(v46) = a14;
      v41 = [(USUsageQuerying *)self _computeWebUsageWithEvents:v59 timeZoneByDevice:v39 lastEventDateByDevice:v40 categoryUsageIntervalsByDevice:v36 aggregatedApplicationUsageIntervalsByDevice:v37 aggregatedWebUsageIntervalsByDevice:v38 categoryByWebDomain:v66 partition:v35 referenceDate:v65 focalOnly:v46];
      [(USUsageQuerying *)self _computeNowPlayingUsageWithEvents:v58 categoryUsageIntervalsByDevice:v36 timeZoneByDevice:v39 lastEventDateByDevice:v40 partition:v35 referenceDate:v65];
      if ([v57 count])
      {
        v42 = [(USUsageQuerying *)self _computeNotificationsWithEvents:v57 timeZoneByDevice:v39 lastEventDateByDevice:v40 partition:v35];
      }
      else
      {
        v42 = 0;
      }
      -[USUsageQuerying _updateLocalReports:remoteReports:aggregateReports:nonIntersectingScreenTimeIntervals:intersectingScreenTimeIntervals:longestSessionByDevice:applicationUsageIntervals:unboundApplicationUsageIntervals:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByBundleIdentifier:categoryByWebDomain:notificationsByDevice:interval:timeZoneByDevice:lastEventDateByDevice:](self, "_updateLocalReports:remoteReports:aggregateReports:nonIntersectingScreenTimeIntervals:intersectingScreenTimeIntervals:longestSessionByDevice:applicationUsageIntervals:unboundApplicationUsageIntervals:webUsageIntervalsByDevice:categoryUsageIntervalsByDevice:aggregatedApplicationUsageIntervalsByDevice:aggregatedWebUsageIntervalsByDevice:categoryByBundleIdentifier:categoryByWebDomain:notificationsByDevice:interval:timeZoneByDevice:lastEventDateByDevice:", v64, v63, v62, v72, v71, v70, v69, v68, v41, v36, v37, v38, v67, v66,
        v42,
        v35,
        v39,
        v40);
      id v34 = v73;

      [v56 timeIntervalSinceDate:v34];
      if (v43 <= a12)
      {
        id v44 = v56;
      }
      else
      {
        id v44 = [v34 dateByAddingTimeInterval:a12];
      }
      v73 = v44;

      id v30 = v34;
    }
    while ([v34 compare:v56] == -1);
  }
  else
  {
    id v34 = v30;
  }
  v47[2](v47, v64, v63, v62, 0);
}

- (void)_updateLocalReports:(id)a3 remoteReports:(id)a4 aggregateReports:(id)a5 nonIntersectingScreenTimeIntervals:(id)a6 intersectingScreenTimeIntervals:(id)a7 longestSessionByDevice:(id)a8 applicationUsageIntervals:(id)a9 unboundApplicationUsageIntervals:(id)a10 webUsageIntervalsByDevice:(id)a11 categoryUsageIntervalsByDevice:(id)a12 aggregatedApplicationUsageIntervalsByDevice:(id)a13 aggregatedWebUsageIntervalsByDevice:(id)a14 categoryByBundleIdentifier:(id)a15 categoryByWebDomain:(id)a16 notificationsByDevice:(id)a17 interval:(id)a18 timeZoneByDevice:(id)a19 lastEventDateByDevice:(id)a20
{
  id v83 = a3;
  id v85 = a4;
  id v77 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a9;
  id v29 = a10;
  id v30 = a11;
  id v31 = a12;
  id v32 = a13;
  id v33 = a14;
  id v82 = a15;
  id v81 = a16;
  id v80 = a17;
  id v79 = a18;
  id v34 = a19;
  id v78 = a20;
  v84 = v34;
  uint64_t v35 = v34;
  v36 = v85;
  if ([v35 count])
  {
    id v67 = v33;
    id v68 = v32;
    id v69 = v31;
    id v70 = v30;
    id v71 = v29;
    id v72 = v28;
    v73 = v27;
    id v74 = v26;
    id v75 = v25;
    uint64_t v114 = 0;
    v115 = &v114;
    uint64_t v116 = 0x2020000000;
    uint64_t v117 = 0;
    uint64_t v108 = 0;
    v109 = &v108;
    uint64_t v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__0;
    id v112 = __Block_byref_object_dispose__0;
    id v113 = 0;
    v37 = objc_opt_new();
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke;
    v86[3] = &unk_26431DF38;
    id v38 = v25;
    id v87 = v38;
    id v39 = v28;
    id v88 = v39;
    id v89 = v29;
    id v40 = v30;
    id v90 = v40;
    id v41 = v31;
    id v91 = v41;
    id v42 = v68;
    id v92 = v42;
    id v43 = v67;
    id v93 = v43;
    id v94 = v74;
    id v44 = v73;
    id v95 = v44;
    id v62 = v80;
    id v96 = v62;
    v97 = self;
    v105 = &v114;
    v106 = &v108;
    id v66 = v37;
    id v98 = v66;
    id v45 = v78;
    id v99 = v45;
    SEL v107 = a2;
    id v61 = v82;
    id v100 = v61;
    id v60 = v81;
    id v101 = v60;
    id v46 = v79;
    id v102 = v46;
    id v103 = v83;
    id v104 = v85;
    [v84 enumerateKeysAndObjectsUsingBlock:v86];
    id v65 = [v84 objectForKeyedSubscript:@"AllDevices"];
    v64 = [v38 objectForKeyedSubscript:@"AllDevices"];
    id v47 = [v39 objectForKeyedSubscript:@"AllDevices"];
    id v48 = [v40 objectForKeyedSubscript:@"AllDevices"];
    id v49 = [v41 objectForKeyedSubscript:@"AllDevices"];
    id v50 = [v42 objectForKeyedSubscript:@"AllDevices"];
    id v51 = [v43 objectForKeyedSubscript:@"AllDevices"];
    id v52 = [v44 objectForKeyedSubscript:@"AllDevices"];
    uint64_t v53 = [v62 objectForKeyedSubscript:@"AllDevices"];
    uint64_t v54 = (void *)v53;
    char v55 = (void *)MEMORY[0x263EFFA78];
    if (v53) {
      char v55 = (void *)v53;
    }
    id v56 = v55;

    v57 = [v45 objectForKeyedSubscript:@"AllDevices"];
    if (!v57)
    {
      long long v59 = [MEMORY[0x263F08690] currentHandler];
      [v59 handleFailureInMethod:a2 object:self file:@"USUsageQuerying.m" lineNumber:359 description:@"lastEventDate for a USUsageReport must not be nil"];
    }
    long long v58 = objc_msgSend((id)objc_opt_class(), "_newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:", v64, v66, v115[3], v109[5], v52, v47, v48, v49, v50, v51, v61, v60, v56, v46,
                    v65,
                    v57);
    [v77 addObject:v58];

    _Block_object_dispose(&v108, 8);
    _Block_object_dispose(&v114, 8);
    v36 = v85;
    id v26 = v74;
    id v25 = v75;
    id v28 = v72;
    id v27 = v73;
    id v30 = v70;
    id v29 = v71;
    id v32 = v68;
    id v31 = v69;
    id v33 = v67;
  }
}

void __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"AllDevices"]) {
    goto LABEL_17;
  }
  id v41 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  uint64_t v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  uint64_t v9 = [*(id *)(a1 + 56) objectForKeyedSubscript:v5];
  uint64_t v10 = [*(id *)(a1 + 64) objectForKeyedSubscript:v5];
  id v40 = [*(id *)(a1 + 72) objectForKeyedSubscript:v5];
  id v39 = [*(id *)(a1 + 80) objectForKeyedSubscript:v5];
  uint64_t v11 = [*(id *)(a1 + 88) objectForKeyedSubscript:v5];
  id v38 = [*(id *)(a1 + 96) objectForKeyedSubscript:v5];
  uint64_t v12 = [*(id *)(a1 + 104) objectForKeyedSubscript:v5];
  id v13 = (void *)v12;
  id v14 = (void *)MEMORY[0x263EFFA78];
  if (v12) {
    id v14 = (void *)v12;
  }
  id v15 = v14;

  uint64_t v45 = 0;
  id v44 = 0;
  uint64_t v35 = (void *)v8;
  v36 = (void *)v11;
  id v16 = [(id)objc_opt_class() _generatePickupsByBundleIdentifierWithPickupIntervals:v11 applicationUsageIntervals:v8 pickupsWithoutApplicationUsage:&v45 firstPickup:&v44];
  id v17 = v44;
  id v18 = v44;
  id v19 = v18;
  *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) += v45;
  uint64_t v20 = *(void *)(*(void *)(a1 + 184) + 8);
  if (!*(void *)(v20 + 40)) {
    goto LABEL_7;
  }
  if (objc_msgSend(v18, "compare:") == -1)
  {
    uint64_t v20 = *(void *)(*(void *)(a1 + 184) + 8);
LABEL_7:
    objc_storeStrong((id *)(v20 + 40), v17);
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke_2;
  v42[3] = &unk_26431DF10;
  id v43 = *(id *)(a1 + 120);
  [v16 enumerateKeysAndObjectsUsingBlock:v42];
  id v21 = [*(id *)(a1 + 128) objectForKeyedSubscript:v5];
  id v37 = v6;
  if (!v21)
  {
    [MEMORY[0x263F08690] currentHandler];
    uint64_t v29 = v10;
    id v31 = v30 = v9;
    [v31 handleFailureInMethod:*(void *)(a1 + 192) object:*(void *)(a1 + 112) file:@"USUsageQuerying.m" lineNumber:333 description:@"lastEventDate for a USUsageReport must not be nil"];

    uint64_t v9 = v30;
    uint64_t v10 = v29;
    id v6 = v37;
  }
  id v33 = v6;
  id v22 = (void *)v10;
  uint64_t v32 = v10;
  id v23 = (void *)v9;
  id v24 = objc_msgSend((id)objc_opt_class(), "_newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:", v41, v16, v45, v19, v38, v7, v9, v32, v40, v39, *(void *)(a1 + 136), *(void *)(a1 + 144), v15, *(void *)(a1 + 152),
                  v33,
                  v21);

  if ([v5 isEqualToString:@"LocalDevice"])
  {
    [*(id *)(a1 + 160) addObject:v24];
    id v25 = v35;
  }
  else
  {
    id v26 = [*(id *)(a1 + 168) objectForKeyedSubscript:v5];
    id v27 = v26;
    if (v26)
    {
      [v26 addObject:v24];
    }
    else
    {
      id v34 = v7;
      id v28 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v24, 0);
      [*(id *)(a1 + 168) setObject:v28 forKeyedSubscript:v5];

      id v7 = v34;
    }
    id v25 = v35;
  }
  id v6 = v37;
LABEL_17:
}

void __473__USUsageQuerying__updateLocalReports_remoteReports_aggregateReports_nonIntersectingScreenTimeIntervals_intersectingScreenTimeIntervals_longestSessionByDevice_applicationUsageIntervals_unboundApplicationUsageIntervals_webUsageIntervalsByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByBundleIdentifier_categoryByWebDomain_notificationsByDevice_interval_timeZoneByDevice_lastEventDateByDevice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v12 = [v5 objectForKeyedSubscript:v7];
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v12 unsignedIntegerValue];
  uint64_t v10 = [v6 unsignedIntegerValue];

  uint64_t v11 = [v8 numberWithUnsignedInteger:v10 + v9];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
}

+ (id)_generatePickupsByBundleIdentifierWithPickupIntervals:(id)a3 applicationUsageIntervals:(id)a4 pickupsWithoutApplicationUsage:(unint64_t *)a5 firstPickup:(id *)a6
{
  id v24 = a6;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v27 = a4;
  id v29 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  uint64_t v8 = 0;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v47 count:16];
  if (!v9)
  {
    unint64_t v26 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = *(void *)v31;
  unint64_t v26 = 0;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      objc_msgSend(v12, "duration", v24);
      double v14 = v13;
      if (v13 >= 5.0)
      {
        id v15 = v27;
        id v16 = v12;
        uint64_t v41 = 0;
        id v42 = &v41;
        uint64_t v43 = 0x3032000000;
        id v44 = __Block_byref_object_copy__0;
        uint64_t v45 = __Block_byref_object_dispose__0;
        id v46 = 0;
        v39[0] = 0;
        v39[1] = v39;
        v39[2] = 0x3032000000;
        v39[3] = __Block_byref_object_copy__0;
        v39[4] = __Block_byref_object_dispose__0;
        id v40 = 0;
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __USTrustIdentifierKeyedNonIntersectingIntervalsGetKeyOfEarliestIntersectionWithThreshold_block_invoke;
        v34[3] = &unk_26431E3C0;
        id v17 = v16;
        id v35 = v17;
        v36 = v39;
        id v37 = &v41;
        uint64_t v38 = 0x4014000000000000;
        [v15 enumerateKeysAndObjectsUsingBlock:v34];
        id v18 = (id)v42[5];

        _Block_object_dispose(v39, 8);
        _Block_object_dispose(&v41, 8);

        id v19 = [v18 identifier];
        if (v19)
        {
          uint64_t v20 = [v29 objectForKeyedSubscript:v19];
          id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + 1);
          [v29 setObject:v21 forKeyedSubscript:v19];

          if (!v8) {
            goto LABEL_9;
          }
        }
        else if (v14 >= 9.0)
        {
          ++v26;
          if (!v8)
          {
LABEL_9:
            uint64_t v8 = [v17 startDate];
          }
        }

        continue;
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v47 count:16];
  }
  while (v9);
LABEL_17:

  *a5 = v26;
  id v22 = v8;
  id *v24 = v22;

  return v29;
}

+ (id)_newReportWithNonIntersectingScreenTimeIntervals:(id)a3 pickupsByBundleIdentifier:(id)a4 pickupsWithoutApplicationUsage:(unint64_t)a5 firstPickup:(id)a6 longestSession:(id)a7 applicationUsageIntervals:(id)a8 webUsageIntervals:(id)a9 categoryUsageIntervals:(id)a10 aggregatedApplicationUsageIntervals:(id)a11 aggregatedWebUsageIntervals:(id)a12 categoryByBundleIdentifier:(id)a13 categoryByWebDomain:(id)a14 notifications:(id)a15 interval:(id)a16 timeZone:(id)a17 lastEventDate:(id)a18
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v59 = a4;
  id v61 = a6;
  id v62 = a7;
  id v67 = a8;
  id v66 = a9;
  id v68 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v69 = a15;
  id v63 = a16;
  id v64 = a17;
  id v65 = a18;
  v57 = v22;
  if (v22)
  {
    id v27 = v22;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v93 objects:&v101 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v94;
      double v30 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v94 != v29) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v93 + 1) + 8 * i) duration];
          double v30 = v30 + v32;
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v93 objects:&v101 count:16];
      }
      while (v28);
    }
    else
    {
      double v30 = 0.0;
    }
  }
  else
  {
    double v30 = 0.0;
  }
  uint64_t v101 = 0;
  id v102 = (double *)&v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v104 = 0;
  long long v33 = objc_opt_new();
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke;
  v89[3] = &unk_26431DF60;
  id v92 = &v101;
  id v34 = v25;
  id v90 = v34;
  id v35 = v33;
  id v91 = v35;
  [v67 enumerateKeysAndObjectsUsingBlock:v89];
  v36 = v23;
  *(void *)&long long v93 = 0;
  *((void *)&v93 + 1) = &v93;
  long long v94 = 0x2020000000uLL;
  id v37 = objc_opt_new();
  uint64_t v38 = objc_opt_new();
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2;
  v84[3] = &unk_26431DF88;
  id v88 = &v93;
  id v60 = v26;
  id v85 = v60;
  id v39 = v37;
  id v86 = v39;
  id v40 = v38;
  id v87 = v40;
  [v66 enumerateKeysAndObjectsUsingBlock:v84];
  if (v102[3] >= *(double *)(*((void *)&v93 + 1) + 24)) {
    double v41 = v102[3];
  }
  else {
    double v41 = *(double *)(*((void *)&v93 + 1) + 24);
  }
  if (v30 >= v41)
  {
    double v41 = v30;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 134218240;
    double v98 = v30;
    __int16 v99 = 2048;
    double v100 = v41;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Adjusting total Screen Time usage (%f) to be at least as long as the max application or web usage (%f)", buf, 0x16u);
  }
  id v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v69, "count"));
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_54;
  v81[3] = &unk_26431DFB0;
  id v56 = v34;
  id v82 = v56;
  id v43 = v42;
  id v83 = v43;
  [v69 enumerateKeysAndObjectsUsingBlock:v81];
  id v44 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v68, "count"));
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2_56;
  v72[3] = &unk_26431E078;
  id v45 = v39;
  id v73 = v45;
  id v46 = v43;
  id v74 = v46;
  id v47 = v35;
  id v75 = v47;
  id v48 = v36;
  id v76 = v48;
  id v49 = v59;
  id v77 = v49;
  id v50 = v40;
  id v78 = v50;
  id v51 = v24;
  id v79 = v51;
  id v52 = v44;
  id v80 = v52;
  [v68 enumerateKeysAndObjectsUsingBlock:v72];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_7;
  v70[3] = &unk_26431E0A0;
  id v53 = v52;
  id v71 = v53;
  [v46 enumerateKeysAndObjectsUsingBlock:v70];
  uint64_t v54 = [[USUsageReport alloc] initWithScreenTime:v62 longestSession:v53 categoryUsage:a5 pickupsWithoutApplicationUsage:v61 firstPickup:v63 interval:v64 timeZone:v41 lastEventDate:v65];

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v101, 8);

  return v54;
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) duration];
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v10 > *(double *)(v13 + 24)) {
    *(double *)(v13 + 24) = v10;
  }
  double v14 = [NSNumber numberWithDouble:v10];
  id v15 = [v5 identifier];
  id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
  uint64_t v17 = [v16 identifier];
  id v18 = (void *)v17;
  id v19 = (void *)*MEMORY[0x263F31838];
  if (v17) {
    id v19 = (void *)v17;
  }
  id v20 = v19;

  uint64_t v21 = [v16 canonicalBundleIdentifier];
  id v22 = (void *)v21;
  if (v21) {
    id v23 = (void *)v21;
  }
  else {
    id v23 = v15;
  }
  id v24 = v23;

  id v25 = +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v24, [v5 trusted]);

  id v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:v20];
  id v27 = [v26 objectForKeyedSubscript:v25];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = v14;
    id v30 = v5;
  }
  else
  {
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v14, v5, 0);
    if (v26)
    {
      id v27 = v26;
      uint64_t v29 = v28;
      id v30 = v25;
    }
    else
    {
      id v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v28, v25, 0);
      id v27 = *(void **)(a1 + 40);
      uint64_t v29 = v26;
      id v30 = v20;
    }
  }
  [v27 setObject:v29 forKeyedSubscript:v30];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * i) duration];
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v10 > *(double *)(v13 + 24)) {
    *(double *)(v13 + 24) = v10;
  }
  uint64_t v33 = [NSNumber numberWithDouble:v10];
  double v14 = [v5 identifier];
  id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
  uint64_t v16 = [v15 identifier];
  uint64_t v17 = (void *)v16;
  id v18 = (void *)*MEMORY[0x263F31838];
  if (v16) {
    id v18 = (void *)v16;
  }
  id v19 = v18;

  id v20 = [v15 canonicalBundleIdentifier];
  if (v20)
  {
    uint64_t v21 = +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v20, [v5 trusted]);
    id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v19];
    id v23 = [v22 objectForKeyedSubscript:v21];
    if (!v23)
    {
      id v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v33, v5, 0);
      if (!v22)
      {
        id v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v24, v21, 0);
        id v25 = *(void **)(a1 + 40);
LABEL_26:
        long long v31 = v22;
        id v32 = v19;
        goto LABEL_27;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v26 = [v15 primaryWebDomain];
    id v27 = (void *)v26;
    if (v26) {
      uint64_t v28 = (void *)v26;
    }
    else {
      uint64_t v28 = v14;
    }
    id v29 = v28;

    uint64_t v21 = +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v29, [v5 trusted]);

    id v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:v19];
    id v23 = [v22 objectForKeyedSubscript:v21];
    if (!v23)
    {
      id v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v33, v5, 0);
      if (!v22)
      {
        id v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v24, v21, 0);
        id v25 = *(void **)(a1 + 48);
        goto LABEL_26;
      }
LABEL_24:
      id v25 = v22;
      long long v31 = v24;
      id v32 = v21;
LABEL_27:
      [v25 setObject:v31 forKeyedSubscript:v32];
      id v30 = (void *)v33;
      goto LABEL_28;
    }
  }
  id v24 = v23;
  id v30 = (void *)v33;
  [v23 setObject:v33 forKeyedSubscript:v5];
LABEL_28:
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  id v6 = [v22 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = (void *)v8;
  double v10 = (void *)*MEMORY[0x263F31838];
  if (v8) {
    double v10 = (void *)v8;
  }
  id v11 = v10;

  uint64_t v12 = [v7 canonicalBundleIdentifier];
  uint64_t v13 = (void *)v12;
  if (v12) {
    double v14 = (void *)v12;
  }
  else {
    double v14 = v6;
  }
  id v15 = v14;

  uint64_t v16 = +[USTrustIdentifier identifierWithIdentifier:trusted:](USTrustIdentifier, "identifierWithIdentifier:trusted:", v15, [v22 trusted]);

  uint64_t v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
  id v18 = [v17 objectForKeyedSubscript:v16];
  if (v18)
  {
    id v19 = v18;
    id v20 = v5;
    id v21 = v22;
  }
  else
  {
    id v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v5, v22, 0);
    if (v17)
    {
      id v18 = v17;
      id v20 = v19;
      id v21 = v16;
    }
    else
    {
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v19, v16, 0);
      id v18 = *(void **)(a1 + 40);
      id v20 = v17;
      id v21 = v11;
    }
  }
  [v18 setObject:v20 forKeyedSubscript:v21];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_2_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  double v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_3;
  v40[3] = &unk_26431DFD8;
  id v41 = *(id *)(a1 + 56);
  id v11 = v8;
  id v42 = v11;
  id v12 = v9;
  id v43 = v12;
  id v44 = *(id *)(a1 + 64);
  id v13 = v7;
  id v45 = v13;
  id v30 = v10;
  [v10 enumerateKeysAndObjectsUsingBlock:v40];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_4;
  v36[3] = &unk_26431E000;
  id v37 = *(id *)(a1 + 56);
  id v14 = v12;
  id v38 = v14;
  id v15 = v13;
  id v39 = v15;
  id v29 = v11;
  [v11 enumerateKeysAndObjectsUsingBlock:v36];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_5;
  v34[3] = &unk_26431E028;
  id v16 = v15;
  id v35 = v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v34];
  uint64_t v17 = objc_opt_new();
  id v18 = [*(id *)(a1 + 72) objectForKeyedSubscript:v5];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_6;
  v31[3] = &unk_26431E050;
  id v32 = *(id *)(a1 + 80);
  id v19 = v17;
  id v33 = v19;
  [v18 enumerateKeysAndObjectsUsingBlock:v31];
  id v20 = v6;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
    double v24 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) duration];
        double v24 = v24 + v26;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v22);
  }
  else
  {
    double v24 = 0.0;
  }

  id v27 = *(void **)(a1 + 88);
  uint64_t v28 = [[USCategoryUsageReport alloc] initWithCategoryIdentifier:v5 totalUsageTime:v16 applicationUsage:v19 webUsage:v24];
  [v27 addObject:v28];

  [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:v5];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:&v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v57;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) duration];
        double v11 = v11 + v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:&v61 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  id v15 = (void *)v14;
  id v16 = (void *)MEMORY[0x263EFFA78];
  if (v14) {
    uint64_t v17 = (void *)v14;
  }
  else {
    uint64_t v17 = (void *)MEMORY[0x263EFFA78];
  }
  id v18 = v17;

  uint64_t v51 = v5;
  uint64_t v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  id v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (void *)v19;
  }
  else {
    uint64_t v21 = v16;
  }
  id v50 = v21;

  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v23 = v6;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [*(id *)(*((void *)&v52 + 1) + 8 * j) identifier];
        id v29 = [*(id *)(a1 + 56) objectForKeyedSubscript:v28];
        [v22 setObject:v29 forKeyedSubscript:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v25);
  }

  id v30 = (objc_class *)MEMORY[0x263EFF9A0];
  id v31 = v23;
  id v32 = objc_msgSend([v30 alloc], "initWithCapacity:", objc_msgSend(v31, "count"));
  uint64_t v61 = MEMORY[0x263EF8330];
  uint64_t v62 = 3221225472;
  id v63 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  id v64 = &unk_26431E460;
  id v65 = v32;
  id v33 = v32;
  long long v49 = v31;
  [v31 enumerateKeysAndObjectsUsingBlock:&v61];

  long long v48 = (void *)[v33 copy];
  long long v34 = (objc_class *)MEMORY[0x263EFF9A0];
  id v35 = v18;
  long long v36 = objc_msgSend([v34 alloc], "initWithCapacity:", objc_msgSend(v35, "count"));
  uint64_t v61 = MEMORY[0x263EF8330];
  uint64_t v62 = 3221225472;
  id v63 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  id v64 = &unk_26431E460;
  id v65 = v36;
  id v37 = v36;
  [v35 enumerateKeysAndObjectsUsingBlock:&v61];

  id v38 = (void *)[v37 copy];
  id v39 = (objc_class *)MEMORY[0x263EFF9A0];
  id v40 = v50;
  id v41 = objc_msgSend([v39 alloc], "initWithCapacity:", objc_msgSend(v40, "count"));
  uint64_t v61 = MEMORY[0x263EF8330];
  uint64_t v62 = 3221225472;
  id v63 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  id v64 = &unk_26431E460;
  id v65 = v41;
  id v42 = v41;
  [v40 enumerateKeysAndObjectsUsingBlock:&v61];

  id v43 = (void *)[v42 copy];
  id v44 = *(void **)(a1 + 64);
  id v45 = [USApplicationUsageReport alloc];
  long long v46 = [v51 identifier];
  long long v47 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v45, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v46, [v51 trusted], v48, v38, v43, v22, v11);
  [v44 addObject:v47];

  [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:v51];
  [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v51];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:&v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * i) duration];
        double v11 = v11 + v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:&v37 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  id v15 = (void *)v14;
  id v16 = (void *)MEMORY[0x263EFFA78];
  if (v14) {
    id v16 = (void *)v14;
  }
  id v17 = v16;

  id v18 = (objc_class *)MEMORY[0x263EFF9A0];
  id v19 = v6;
  id v20 = objc_msgSend([v18 alloc], "initWithCapacity:", objc_msgSend(v19, "count"));
  uint64_t v37 = MEMORY[0x263EF8330];
  uint64_t v38 = 3221225472;
  id v39 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  id v40 = &unk_26431E460;
  id v41 = v20;
  id v21 = v20;
  [v19 enumerateKeysAndObjectsUsingBlock:&v37];

  uint64_t v22 = (void *)[v21 copy];
  id v23 = (objc_class *)MEMORY[0x263EFF9A0];
  id v24 = v17;
  uint64_t v25 = objc_msgSend([v23 alloc], "initWithCapacity:", objc_msgSend(v24, "count"));
  uint64_t v37 = MEMORY[0x263EF8330];
  uint64_t v38 = 3221225472;
  id v39 = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  id v40 = &unk_26431E460;
  id v41 = v25;
  id v26 = v25;
  [v24 enumerateKeysAndObjectsUsingBlock:&v37];

  id v27 = (void *)[v26 copy];
  uint64_t v28 = *(void **)(a1 + 48);
  id v29 = [USApplicationUsageReport alloc];
  id v30 = [v5 identifier];
  uint64_t v31 = [v5 trusted];
  id v32 = [(USApplicationUsageReport *)v29 initWithCanonicalBundleIdentifier:v30 applicationUsageTrusted:v31 totalUsageTime:MEMORY[0x263EFFA78] applicationUsageByBundleIdentifier:v22 webUsageByDomain:v27 userNotificationsByBundleIdentifier:MEMORY[0x263EFFA78] pickupsByBundleIdentifier:v11];
  [v28 addObject:v32];

  [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:v5];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a2;
  uint64_t v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v16[3] = &unk_26431E460;
  id v17 = v8;
  id v9 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v10 = (void *)[v9 copy];

  double v11 = *(void **)(a1 + 32);
  id v12 = [USApplicationUsageReport alloc];
  double v13 = [v7 identifier];
  uint64_t v14 = [v7 trusted];

  id v15 = [(USApplicationUsageReport *)v12 initWithCanonicalBundleIdentifier:v13 applicationUsageTrusted:v14 totalUsageTime:MEMORY[0x263EFFA78] applicationUsageByBundleIdentifier:MEMORY[0x263EFFA78] webUsageByDomain:v10 userNotificationsByBundleIdentifier:MEMORY[0x263EFFA78] pickupsByBundleIdentifier:0.0];
  [v11 addObject:v15];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) duration];
        double v11 = v11 + v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  uint64_t v14 = (objc_class *)MEMORY[0x263EFF9A0];
  id v15 = v6;
  id v16 = objc_msgSend([v14 alloc], "initWithCapacity:", objc_msgSend(v15, "count"));
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v27[3] = &unk_26431E460;
  id v28 = v16;
  id v17 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v27];

  id v18 = (void *)[v17 copy];
  id v19 = *(void **)(a1 + 40);
  id v20 = [USWebUsageReport alloc];
  id v21 = [v5 identifier];
  uint64_t v22 = -[USWebUsageReport initWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](v20, "initWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", v21, [v5 trusted], v18, v11);
  [v19 addObject:v22];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_8;
  v13[3] = &unk_26431E028;
  id v14 = v8;
  id v9 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  uint64_t v10 = *(void **)(a1 + 32);
  double v11 = [USCategoryUsageReport alloc];
  id v12 = [(USCategoryUsageReport *)v11 initWithCategoryIdentifier:v7 totalUsageTime:v9 applicationUsage:MEMORY[0x263EFFA68] webUsage:0.0];

  [v10 addObject:v12];
}

void __376__USUsageQuerying__newReportWithNonIntersectingScreenTimeIntervals_pickupsByBundleIdentifier_pickupsWithoutApplicationUsage_firstPickup_longestSession_applicationUsageIntervals_webUsageIntervals_categoryUsageIntervals_aggregatedApplicationUsageIntervals_aggregatedWebUsageIntervals_categoryByBundleIdentifier_categoryByWebDomain_notifications_interval_timeZone_lastEventDate___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a2;
  uint64_t v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __rekeyUsageByTrustIdentifierToUsageByIdentifier_block_invoke;
  v15[3] = &unk_26431E460;
  id v16 = v8;
  id v9 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v10 = (void *)[v9 copy];

  double v11 = *(void **)(a1 + 32);
  id v12 = [USApplicationUsageReport alloc];
  double v13 = [v7 identifier];

  id v14 = [(USApplicationUsageReport *)v12 initWithCanonicalBundleIdentifier:v13 applicationUsageTrusted:1 totalUsageTime:MEMORY[0x263EFFA78] applicationUsageByBundleIdentifier:MEMORY[0x263EFFA78] webUsageByDomain:v10 userNotificationsByBundleIdentifier:MEMORY[0x263EFFA78] pickupsByBundleIdentifier:0.0];
  [v11 addObject:v14];
}

- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 error:(id *)a7
{
  return [(USUsageQuerying *)self queryForApplications:a3 webDomains:a4 categories:a5 interval:a6 focalOnly:1 error:a7];
}

- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 segmentInterval:(double)a7 error:(id *)a8
{
  id v33 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = [v16 endDate];
  id v18 = [v16 startDate];
  [v16 duration];
  if (v19 <= a7)
  {
    id v20 = v17;
  }
  else
  {
    id v20 = [v18 dateByAddingTimeInterval:a7];
  }
  id v21 = v20;
  double v22 = 0.0;
  id v32 = v16;
  if ([v18 compare:v17] == -1)
  {
    while (1)
    {
      uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263F08798]), "initWithStartDate:endDate:", v18, v21, v32);
      id v30 = [(USUsageQuerying *)self queryForApplications:v33 webDomains:v14 categories:v15 interval:v29 focalOnly:1 error:a8];
      long long v24 = v30;
      if (!v30) {
        break;
      }
      [v30 doubleValue];
      double v26 = v25;
      id v23 = v21;

      [v17 timeIntervalSinceDate:v23];
      if (v27 <= a7)
      {
        id v28 = v17;
      }
      else
      {
        id v28 = [v23 dateByAddingTimeInterval:a7];
      }
      id v21 = v28;
      double v22 = v22 + v26;

      id v18 = v23;
      if ([v23 compare:v17] != -1) {
        goto LABEL_6;
      }
    }
  }
  else
  {
    id v23 = v18;
LABEL_6:
    long long v24 = objc_msgSend(NSNumber, "numberWithDouble:", v22, v32);
    id v18 = v23;
  }

  return v24;
}

- (id)queryForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 focalOnly:(BOOL)a7 error:(id *)a8
{
  BOOL v122 = a7;
  v156[1] = *MEMORY[0x263EF8340];
  id v112 = a3;
  id v113 = a4;
  id v115 = a5;
  id v12 = a6;
  v111 = objc_opt_new();
  v124 = self;
  uint64_t v116 = [(USUsageQuerying *)self duetStream];
  double v13 = (void *)MEMORY[0x263F35110];
  id v14 = v12;
  id v15 = [v14 startDate];
  id v16 = [v14 endDate];
  id v17 = [v13 predicateForEventsIntersectingDateRangeFrom:v15 to:v16];

  id v18 = [MEMORY[0x263F35080] usageType];
  v118 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v18 andIntegerValue:1];
  v120 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v18];
  double v19 = [MEMORY[0x263F08730] notPredicateWithSubpredicate:v120];
  id v20 = (void *)MEMORY[0x263F08730];
  v148 = v118;
  BOOL v149 = v19;
  id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:2];
  double v22 = [v20 orPredicateWithSubpredicates:v21];

  id v23 = objc_alloc(MEMORY[0x263F08730]);
  v142 = v17;
  v143 = v22;
  long long v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:2];
  double v25 = (void *)[v23 initWithType:1 subpredicates:v24];

  double v26 = objc_opt_new();
  double v27 = [MEMORY[0x263F35090] allDevices];
  [v26 setDeviceIDs:v27];

  id v28 = [MEMORY[0x263F35148] appUsageStream];
  v156[0] = v28;
  uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:1];
  [v26 setEventStreams:v29];

  if (v122) {
    id v30 = v25;
  }
  else {
    id v30 = v17;
  }
  [v26 setPredicate:v30];
  uint64_t v31 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  id v154 = v31;
  id v32 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  double v155 = v32;
  id v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:2];

  [v26 setSortDescriptors:v33];
  long long v34 = [v116 publisherForQuery:v26];

  v121 = [v34 collect];

  long long v35 = [(USUsageQuerying *)v124 duetStream];
  id v36 = v14;
  uint64_t v37 = (void *)MEMORY[0x263F35110];
  uint64_t v38 = [v36 startDate];
  id v39 = [v36 endDate];
  id v40 = [v37 predicateForEventsIntersectingDateRangeFrom:v38 to:v39];

  id v41 = [MEMORY[0x263F35080] usageType];
  uint64_t v42 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v41 andIntegerValue:1];
  id v43 = v42;
  if (!v122)
  {
    id v44 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v41 andIntegerValue:0];
    id v45 = objc_alloc(MEMORY[0x263F08730]);
    v148 = v42;
    BOOL v149 = v44;
    long long v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:2];
    id v43 = (void **)[v45 initWithType:2 subpredicates:v46];
  }
  long long v47 = objc_opt_new();
  long long v48 = [MEMORY[0x263F35090] allDevices];
  [v47 setDeviceIDs:v48];

  long long v49 = [MEMORY[0x263F35148] appWebUsageStream];
  v156[0] = v49;
  id v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:1];
  [v47 setEventStreams:v50];

  id v51 = objc_alloc(MEMORY[0x263F08730]);
  v142 = v40;
  v143 = v43;
  long long v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:2];
  long long v53 = (void *)[v51 initWithType:1 subpredicates:v52];
  [v47 setPredicate:v53];

  long long v54 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  id v154 = v54;
  long long v55 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  double v155 = v55;
  long long v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:2];
  [v47 setSortDescriptors:v56];

  long long v57 = [v35 publisherForQuery:v47];

  v119 = [v57 collect];

  if ([v115 containsObject:*MEMORY[0x263F31820]])
  {
    long long v58 = [(USUsageQuerying *)v124 duetStream];
    long long v59 = (void *)MEMORY[0x263F35110];
    id v60 = v36;
    uint64_t v61 = [v60 startDate];
    uint64_t v62 = [v60 endDate];
    uint64_t v117 = [v59 predicateForEventsIntersectingDateRangeFrom:v61 to:v62];

    id v63 = (void *)MEMORY[0x263F35110];
    id v64 = [MEMORY[0x263F350F0] playing];
    uint64_t v110 = [v63 predicateForObjectsWithMetadataKey:v64 andIntegerValue:1];

    id v65 = (void *)MEMORY[0x263F35110];
    uint64_t v66 = [MEMORY[0x263F350F0] mediaType];
    v109 = [v65 predicateForObjectsWithMetadataKey:v66 andStringValue:*MEMORY[0x263F54C48]];

    id v67 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:@"com.apple.quicklook.QuickLookUIService"];
    id v68 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:@"com.apple.quicklook.extension.previewUI"];
    id v69 = objc_alloc(MEMORY[0x263F08730]);
    v142 = v67;
    v143 = v68;
    id v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:2];
    id v71 = (uint64_t (*)(uint64_t, uint64_t))[v69 initWithType:2 subpredicates:v70];

    id v72 = objc_opt_new();
    id v73 = [MEMORY[0x263F35090] allDevices];
    [v72 setDeviceIDs:v73];

    id v74 = [MEMORY[0x263F35148] nowPlayingStream];
    v156[0] = v74;
    id v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:1];
    [v72 setEventStreams:v75];

    id v76 = objc_alloc(MEMORY[0x263F08730]);
    v148 = v117;
    BOOL v149 = v110;
    uint64_t v150 = (uint64_t)v109;
    v151 = v71;
    id v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:4];
    id v78 = (void *)[v76 initWithType:1 subpredicates:v77];
    [v72 setPredicate:v78];

    id v79 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
    id v154 = v79;
    id v80 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
    double v155 = v80;
    id v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:2];

    [v72 setSortDescriptors:v81];
    id v82 = [v58 publisherForQuery:v72];

    id v83 = [v82 collect];
  }
  else
  {
    long long v58 = [MEMORY[0x263EFFA68] bpsPublisher];
    id v83 = [v58 collect];
  }

  v84 = [(USUsageQuerying *)v124 duetStream];
  id v85 = v36;
  id v86 = objc_opt_new();
  id v87 = [MEMORY[0x263F35090] allDevices];
  [v86 setDeviceIDs:v87];

  id v88 = [MEMORY[0x263F35148] appMediaUsageStream];
  v142 = v88;
  id v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:1];
  [v86 setEventStreams:v89];

  id v90 = (void *)MEMORY[0x263F35110];
  id v91 = [v85 startDate];
  id v92 = [v85 endDate];
  long long v93 = [v90 predicateForEventsIntersectingDateRangeFrom:v91 to:v92];
  [v86 setPredicate:v93];

  long long v94 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  v148 = v94;
  long long v95 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  BOOL v149 = v95;
  long long v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:2];

  [v86 setSortDescriptors:v96];
  v97 = [v84 publisherForQuery:v86];

  double v98 = [v97 collect];

  v148 = 0;
  BOOL v149 = (id *)&v148;
  uint64_t v150 = 0x3032000000;
  v151 = __Block_byref_object_copy__0;
  id v152 = __Block_byref_object_dispose__0;
  id v153 = 0;
  v142 = 0;
  v143 = &v142;
  uint64_t v144 = 0x3032000000;
  id v145 = __Block_byref_object_copy__0;
  v146 = __Block_byref_object_dispose__0;
  id v147 = 0;
  __int16 v99 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
  v141[0] = v119;
  v141[1] = v83;
  v141[2] = v98;
  double v100 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:3];
  uint64_t v101 = [v121 zipWithOthers:v100];
  v137[0] = MEMORY[0x263EF8330];
  v137[1] = 3221225472;
  v137[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke;
  v137[3] = &unk_26431E0C8;
  id v138 = v99;
  v139 = &v142;
  uint64_t v140 = 1;
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2;
  v126[3] = &unk_26431E140;
  v126[4] = v124;
  id v125 = v85;
  id v127 = v125;
  id v102 = v111;
  id v128 = v102;
  BOOL v136 = v122;
  id v123 = v112;
  id v129 = v123;
  id v103 = v138;
  id v130 = v103;
  uint64_t v135 = 1;
  id v104 = v113;
  id v131 = v104;
  id v105 = v115;
  id v132 = v105;
  v133 = (id *)&v148;
  v134 = &v142;
  id v106 = (id)[v101 sinkWithCompletion:v137 receiveInput:v126];

  [v103 lockWhenCondition:1];
  [v103 unlock];
  if (a8) {
    *a8 = v143[5];
  }
  id v107 = v149[5];

  _Block_object_dispose(&v142, 8);
  _Block_object_dispose(&v148, 8);

  return v107;
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state] == 1)
  {
    [*(id *)(a1 + 32) lock];
    [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 48)];
    uint64_t v3 = [v6 error];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] != 4)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    id v21 = [NSString stringWithUTF8String:"-[USUsageQuerying queryForApplications:webDomains:categories:interval:focalOnly:error:]_block_invoke_2"];
    [v20 handleFailureInFunction:v21 file:@"USUsageQuerying.m" lineNumber:675 description:@"Expecting event types count to be 4"];
  }
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:1];
  id v6 = [v3 objectAtIndexedSubscript:2];
  id v7 = [v3 objectAtIndexedSubscript:3];
  uint64_t v8 = [*(id *)(a1 + 32) _getBundleIdentiersFromApplicationUsageEvents:v4 videoUsageEvents:v7 interval:*(void *)(a1 + 40) referenceDate:*(void *)(a1 + 48) focalOnly:*(unsigned __int8 *)(a1 + 112)];
  if ([v8 count])
  {
    [v8 unionSet:*(void *)(a1 + 56)];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2_cold_1();
    }
    id v9 = [MEMORY[0x263F318B0] sharedCategories];
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x3032000000;
    id v43 = __Block_byref_object_copy__0;
    id v44 = __Block_byref_object_dispose__0;
    id v45 = 0;
    uint64_t v10 = [v8 array];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_68;
    v23[3] = &unk_26431E118;
    id v36 = &v40;
    id v11 = *(id *)(a1 + 64);
    uint64_t v38 = *(void *)(a1 + 104);
    uint64_t v12 = *(void *)(a1 + 32);
    id v24 = v11;
    uint64_t v25 = v12;
    id v26 = v5;
    id v27 = v7;
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    char v39 = *(unsigned char *)(a1 + 112);
    id v30 = *(id *)(a1 + 72);
    id v13 = v9;
    id v31 = v13;
    id v32 = *(id *)(a1 + 56);
    id v33 = *(id *)(a1 + 80);
    id v34 = v4;
    id v14 = v6;
    uint64_t v15 = *(void *)(a1 + 88);
    id v35 = v14;
    uint64_t v37 = v15;
    [v13 categoriesForBundleIDs:v10 completionHandler:v23];

    id v16 = (void *)v41[5];
    if (v16) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v16);
    }

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    LOBYTE(v22) = *(unsigned char *)(a1 + 112);
    [*(id *)(a1 + 32) _computeUsageForApplications:*(void *)(a1 + 56) webDomains:*(void *)(a1 + 72) categories:*(void *)(a1 + 80) applicationUsageEvents:v4 webUsageEvents:v5 nowPlayingEvents:v6 videoUsageEvents:v7 categoryByBundleIdentifier:0 categoryByWebDomain:0 interval:*(void *)(a1 + 40) referenceDate:*(void *)(a1 + 48) focalOnly:v22];
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
    double v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    [*(id *)(a1 + 64) lock];
    [*(id *)(a1 + 64) unlockWithCondition:*(void *)(a1 + 104)];
  }
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) _getWebDomainsFromWebUsageEvents:*(void *)(a1 + 48) videoUsageEvents:*(void *)(a1 + 56) interval:*(void *)(a1 + 64) referenceDate:*(void *)(a1 + 72) focalOnly:*(unsigned __int8 *)(a1 + 152)];
    [v7 unionSet:*(void *)(a1 + 80)];
    if ([v7 count])
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
        __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_68_cold_1();
      }
      uint64_t v8 = *(void **)(a1 + 88);
      id v9 = [v7 array];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_69;
      v19[3] = &unk_26431E0F0;
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v31 = *(void *)(a1 + 128);
      v19[4] = v10;
      id v20 = *(id *)(a1 + 96);
      id v21 = *(id *)(a1 + 80);
      id v22 = *(id *)(a1 + 104);
      id v23 = *(id *)(a1 + 112);
      id v24 = *(id *)(a1 + 48);
      id v25 = *(id *)(a1 + 120);
      id v26 = *(id *)(a1 + 56);
      id v27 = v5;
      id v28 = *(id *)(a1 + 64);
      id v11 = *(id *)(a1 + 72);
      char v34 = *(unsigned char *)(a1 + 152);
      uint64_t v12 = *(void *)(a1 + 136);
      id v29 = v11;
      uint64_t v32 = v12;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 144);
      id v30 = v13;
      uint64_t v33 = v14;
      [v8 categoriesForDomainNames:v9 completionHandler:v19];
    }
    else
    {
      LOBYTE(v18) = *(unsigned char *)(a1 + 152);
      [*(id *)(a1 + 40) _computeUsageForApplications:*(void *)(a1 + 96) webDomains:*(void *)(a1 + 80) categories:*(void *)(a1 + 104) applicationUsageEvents:*(void *)(a1 + 112) webUsageEvents:*(void *)(a1 + 48) nowPlayingEvents:*(void *)(a1 + 120) videoUsageEvents:*(void *)(a1 + 56) categoryByBundleIdentifier:v5 categoryByWebDomain:0 interval:*(void *)(a1 + 64) referenceDate:*(void *)(a1 + 72) focalOnly:v18];
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v16 = *(void *)(*(void *)(a1 + 136) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      [*(id *)(a1 + 32) lock];
      [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 144)];
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), a3);
    [*(id *)(a1 + 32) lock];
    [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 144)];
  }
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v12 = v5;
  if (a2)
  {
    LOBYTE(v11) = *(unsigned char *)(a1 + 152);
    [*(id *)(a1 + 32) _computeUsageForApplications:*(void *)(a1 + 40) webDomains:*(void *)(a1 + 48) categories:*(void *)(a1 + 56) applicationUsageEvents:*(void *)(a1 + 64) webUsageEvents:*(void *)(a1 + 72) nowPlayingEvents:*(void *)(a1 + 80) videoUsageEvents:*(void *)(a1 + 88) categoryByBundleIdentifier:*(void *)(a1 + 96) categoryByWebDomain:a2 interval:*(void *)(a1 + 104) referenceDate:*(void *)(a1 + 112) focalOnly:v11];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v7 = *(void *)(*(void *)(a1 + 136) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 128) + 8);
    id v10 = v5;
    uint64_t v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  [*(id *)(a1 + 120) lock];
  [*(id *)(a1 + 120) unlockWithCondition:*(void *)(a1 + 144)];
}

- (double)_computeUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 applicationUsageEvents:(id)a6 webUsageEvents:(id)a7 nowPlayingEvents:(id)a8 videoUsageEvents:(id)a9 categoryByBundleIdentifier:(id)a10 categoryByWebDomain:(id)a11 interval:(id)a12 referenceDate:(id)a13 focalOnly:(BOOL)a14
{
  id v18 = a3;
  id v19 = a4;
  id v48 = a6;
  id v43 = a13;
  id v39 = a12;
  id v20 = a11;
  id v21 = a10;
  id v22 = a9;
  id v40 = a8;
  id v23 = a7;
  id v42 = a5;
  uint64_t v24 = [v42 count];
  long long v46 = v19;
  uint64_t v25 = [v19 count];
  BOOL v26 = ([v18 count] | v25) != 0;
  id v44 = v20;
  if (v24) {
    id v27 = objc_opt_new();
  }
  else {
    id v27 = 0;
  }
  if (v26)
  {
    id v28 = objc_opt_new();
    if (v25) {
      uint64_t v38 = objc_opt_new();
    }
    else {
      uint64_t v38 = 0;
    }
  }
  else
  {
    uint64_t v38 = 0;
    id v28 = 0;
  }
  id v29 = (void *)[v48 mutableCopy];
  id v30 = (void *)[v23 mutableCopy];

  uint64_t v37 = (void *)[v40 mutableCopy];
  [v29 addObjectsFromArray:v22];
  [v30 addObjectsFromArray:v22];

  LOBYTE(v35) = a14;
  id v41 = [(USUsageQuerying *)self _computeApplicationUsageWithEvents:v29 unboundApplicationUsageIntervalsByDevice:0 timeZoneByDevice:0 lastEventDateByDevice:0 categoryUsageIntervalsByDevice:v27 aggregatedApplicationUsageIntervalsByDevice:v28 categoryByBundleIdentifier:v21 partition:v39 referenceDate:v43 focalOnly:v35];
  LOBYTE(v36) = a14;
  uint64_t v31 = [(USUsageQuerying *)self _computeWebUsageWithEvents:v30 timeZoneByDevice:0 lastEventDateByDevice:0 categoryUsageIntervalsByDevice:v27 aggregatedApplicationUsageIntervalsByDevice:v28 aggregatedWebUsageIntervalsByDevice:v38 categoryByWebDomain:v20 partition:v39 referenceDate:v43 focalOnly:v36];
  [(USUsageQuerying *)self _computeNowPlayingUsageWithEvents:v37 categoryUsageIntervalsByDevice:v27 timeZoneByDevice:0 lastEventDateByDevice:0 partition:v39 referenceDate:v43];

  [(USUsageQuerying *)self _generateUsageTimeWithApplicationUsageIntervals:v41 webUsageIntervalsByDevice:v31 categoryUsageIntervalsByDevice:v27 aggregatedApplicationUsageIntervalsByDevice:v28 aggregatedWebUsageIntervalsByDevice:v38 categoryByBundleIdentifier:v21 categoryByWebDomain:v44 applications:v18 webDomains:v46 categories:v42];
  double v33 = v32;

  return v33;
}

- (double)_generateUsageTimeWithApplicationUsageIntervals:(id)a3 webUsageIntervalsByDevice:(id)a4 categoryUsageIntervalsByDevice:(id)a5 aggregatedApplicationUsageIntervalsByDevice:(id)a6 aggregatedWebUsageIntervalsByDevice:(id)a7 categoryByBundleIdentifier:(id)a8 categoryByWebDomain:(id)a9 applications:(id)a10 webDomains:(id)a11 categories:(id)a12
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  id v118 = a3;
  id v122 = a4;
  id v120 = a5;
  id v17 = a6;
  id v121 = a7;
  id v128 = a8;
  id v130 = a9;
  id v18 = a10;
  id v19 = a11;
  id v123 = a12;
  id v147 = objc_opt_new();
  v119 = v18;
  v143 = v17;
  if ([v18 count])
  {
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v166 objects:v178 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v23 = 0;
      uint64_t v24 = *(void *)v167;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v167 != v24) {
            objc_enumerationMutation(v20);
          }
          BOOL v26 = [v128 objectForKeyedSubscript:*(void *)(*((void *)&v166 + 1) + 8 * i)];
          id v27 = [v26 equivalentBundleIdentifiers];

          if ((unint64_t)[v27 count] >= 2)
          {
            if (!v23) {
              id v23 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v20];
            }
            [v23 addObjectsFromArray:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v166 objects:v178 count:16];
      }
      while (v22);
    }
    else
    {
      id v23 = 0;
    }

    if (!v143)
    {
      uint64_t v114 = [MEMORY[0x263F08690] currentHandler];
      [v114 handleFailureInMethod:a2 object:self file:@"USUsageQuerying.m" lineNumber:811 description:@"Somehow had budgeted applications but no aggregated application usage intervals"];
    }
    if (v23) {
      id v28 = v23;
    }
    else {
      id v28 = v20;
    }
    id v29 = v28;
    id v30 = objc_opt_new();
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id v31 = v29;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v162 objects:v177 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v163;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v163 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v162 + 1) + 8 * j);
          uint64_t v37 = +[USTrustIdentifier identifierWithIdentifier:v36 trusted:1];
          [v30 addObject:v37];

          uint64_t v38 = +[USTrustIdentifier identifierWithIdentifier:v36 trusted:0];
          [v30 addObject:v38];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v162 objects:v177 count:16];
      }
      while (v33);
    }

    id v39 = v147;
    id v40 = v30;
    id v41 = [v143 objectForKeyedSubscript:@"AllDevices"];
    uint64_t v179 = MEMORY[0x263EF8330];
    uint64_t v180 = 3221225472;
    v181 = __unionIntervalsWithUsageTrustIntervalsByDeviceFilteredByItems_block_invoke;
    v182 = &unk_26431E410;
    id v183 = v40;
    id v184 = v39;
    id v42 = v40;
    id v43 = v39;
    [v41 enumerateKeysAndObjectsUsingBlock:&v179];

    id v17 = v143;
  }
  id v127 = [v17 objectForKeyedSubscript:@"AllDevices"];
  id v125 = [v121 objectForKeyedSubscript:@"AllDevices"];
  v124 = [v122 objectForKeyedSubscript:@"AllDevices"];
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id obj = v19;
  unint64_t v44 = 0x26431D000uLL;
  uint64_t v131 = [obj countByEnumeratingWithState:&v158 objects:v176 count:16];
  if (v131)
  {
    uint64_t v129 = *(void *)v159;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v159 != v129)
        {
          uint64_t v46 = v45;
          objc_enumerationMutation(obj);
          uint64_t v45 = v46;
        }
        uint64_t v133 = v45;
        uint64_t v47 = *(void *)(*((void *)&v158 + 1) + 8 * v45);
        id v48 = [v130 objectForKeyedSubscript:v47];
        uint64_t v49 = [v48 canonicalBundleIdentifier];
        id v132 = (void *)v49;
        if (v49)
        {
          uint64_t v50 = v49;
          [*(id *)(v44 + 2528) identifierWithIdentifier:v49 trusted:1];
          long long v52 = v51 = v44;
          long long v53 = [v127 objectForKeyedSubscript:v52];

          long long v54 = [*(id *)(v51 + 2528) identifierWithIdentifier:v50 trusted:0];
          id v134 = [v127 objectForKeyedSubscript:v54];
        }
        else
        {
          [v48 primaryWebDomain];
          long long v54 = v55 = v44;
          long long v56 = *(void **)(v55 + 2528);
          if (v54)
          {
            long long v57 = [v56 identifierWithIdentifier:v54 trusted:1];
            long long v53 = [v125 objectForKeyedSubscript:v57];

            long long v58 = [*(id *)(v55 + 2528) identifierWithIdentifier:v54 trusted:0];
            long long v59 = v125;
          }
          else
          {
            id v60 = [v56 identifierWithIdentifier:v47 trusted:1];
            long long v53 = [v124 objectForKeyedSubscript:v60];

            long long v58 = [*(id *)(v55 + 2528) identifierWithIdentifier:v47 trusted:0];
            long long v59 = v124;
          }
          id v134 = [v59 objectForKeyedSubscript:v58];
        }
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        id v136 = v53;
        uint64_t v144 = v48;
        uint64_t v139 = [v136 countByEnumeratingWithState:&v154 objects:v175 count:16];
        if (v139)
        {
          uint64_t v137 = *(void *)v155;
          do
          {
            for (uint64_t k = 0; k != v139; ++k)
            {
              if (*(void *)v155 != v137) {
                objc_enumerationMutation(v136);
              }
              uint64_t v145 = k;
              uint64_t v62 = *(void **)(*((void *)&v154 + 1) + 8 * k);
              id v63 = v147;
              id v64 = v62;
              long long v170 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v173 = 0u;
              id v65 = (void *)[v63 countByEnumeratingWithState:&v170 objects:&v179 count:16];
              if (v65)
              {
                uint64_t v66 = 0;
                uint64_t v67 = *(void *)v171;
                id v141 = v64;
                do
                {
                  id v68 = 0;
                  v148 = v65;
                  do
                  {
                    if (*(void *)v171 != v67) {
                      objc_enumerationMutation(v63);
                    }
                    id v69 = *(void **)(*((void *)&v170 + 1) + 8 * (void)v68);
                    if ([v69 intersectsDateInterval:v64])
                    {
                      id v70 = v63;
                      id v71 = [v69 startDate];
                      id v72 = [v64 startDate];
                      id v73 = [v71 earlierDate:v72];

                      id v74 = [v69 endDate];
                      [v64 endDate];
                      v76 = id v75 = (void *)v66;
                      id v77 = [v74 laterDate:v76];

                      uint64_t v66 = (uint64_t)v75;
                      uint64_t v78 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v73 endDate:v77];

                      if (v75) {
                        [v75 addObject:v69];
                      }
                      else {
                        uint64_t v66 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v69, 0);
                      }

                      id v64 = (id)v78;
                      id v63 = v70;
                      id v65 = v148;
                    }
                    id v68 = (char *)v68 + 1;
                  }
                  while (v65 != v68);
                  id v65 = (void *)[v63 countByEnumeratingWithState:&v170 objects:&v179 count:16];
                }
                while (v65);
                id v48 = v144;
                if (v66)
                {
                  [v63 removeObjectsInArray:v66];
                  id v17 = v143;
                  id v65 = (void *)v66;
                }
                else
                {
                  id v65 = 0;
                  id v17 = v143;
                }
                uint64_t k = v145;
                id v79 = v141;
              }
              else
              {
                id v79 = v64;
              }
              [v63 addObject:v64];
            }
            uint64_t v139 = [v136 countByEnumeratingWithState:&v154 objects:v175 count:16];
          }
          while (v139);
        }

        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        id v135 = v134;
        uint64_t v140 = [v135 countByEnumeratingWithState:&v150 objects:v174 count:16];
        if (v140)
        {
          uint64_t v138 = *(void *)v151;
          do
          {
            for (uint64_t m = 0; m != v140; ++m)
            {
              if (*(void *)v151 != v138) {
                objc_enumerationMutation(v135);
              }
              id v81 = *(void **)(*((void *)&v150 + 1) + 8 * m);
              id v82 = v147;
              id v83 = v81;
              long long v170 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v173 = 0u;
              uint64_t v84 = [v82 countByEnumeratingWithState:&v170 objects:&v179 count:16];
              if (v84)
              {
                uint64_t v85 = v84;
                uint64_t v146 = m;
                uint64_t v86 = 0;
                uint64_t v87 = *(void *)v171;
                id v142 = v83;
                uint64_t v149 = *(void *)v171;
                do
                {
                  for (uint64_t n = 0; n != v85; ++n)
                  {
                    if (*(void *)v171 != v87) {
                      objc_enumerationMutation(v82);
                    }
                    id v89 = *(void **)(*((void *)&v170 + 1) + 8 * n);
                    if ([v89 intersectsDateInterval:v83])
                    {
                      id v90 = v82;
                      id v91 = [v89 startDate];
                      id v92 = [v83 startDate];
                      long long v93 = [v91 earlierDate:v92];

                      long long v94 = [v89 endDate];
                      [v83 endDate];
                      v96 = long long v95 = (void *)v86;
                      v97 = [v94 laterDate:v96];

                      uint64_t v86 = (uint64_t)v95;
                      uint64_t v98 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v93 endDate:v97];

                      if (v95) {
                        [v95 addObject:v89];
                      }
                      else {
                        uint64_t v86 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v89, 0);
                      }

                      id v83 = (id)v98;
                      id v82 = v90;
                      uint64_t v87 = v149;
                    }
                  }
                  uint64_t v85 = [v82 countByEnumeratingWithState:&v170 objects:&v179 count:16];
                }
                while (v85);
                if (v86)
                {
                  [v82 removeObjectsInArray:v86];
                  id v17 = v143;
                  __int16 v99 = (void *)v86;
                }
                else
                {
                  __int16 v99 = 0;
                  id v17 = v143;
                }
                uint64_t m = v146;
                double v100 = v142;
              }
              else
              {
                __int16 v99 = 0;
                double v100 = v83;
              }
              [v82 addObject:v83];

              id v48 = v144;
            }
            uint64_t v140 = [v135 countByEnumeratingWithState:&v150 objects:v174 count:16];
          }
          while (v140);
        }

        uint64_t v45 = v133 + 1;
        unint64_t v44 = 0x26431D000;
      }
      while (v133 + 1 != v131);
      uint64_t v131 = [obj countByEnumeratingWithState:&v158 objects:v176 count:16];
    }
    while (v131);
  }

  if ([v123 count])
  {
    if (!v120)
    {
      id v115 = [MEMORY[0x263F08690] currentHandler];
      [v115 handleFailureInMethod:a2 object:self file:@"USUsageQuerying.m" lineNumber:860 description:@"Somehow had budgeted categories but no category usage intervals"];
    }
    id v101 = v147;
    id v102 = v123;
    id v103 = [v120 objectForKeyedSubscript:@"AllDevices"];
    uint64_t v179 = MEMORY[0x263EF8330];
    uint64_t v180 = 3221225472;
    v181 = __unionIntervalsWithUsageIntervalsByDeviceFilteredByItems_block_invoke;
    v182 = &unk_26431E3E8;
    id v183 = v102;
    id v184 = v101;
    id v104 = v102;
    id v105 = v101;
    [v103 enumerateKeysAndObjectsUsingBlock:&v179];
  }
  id v106 = v147;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  uint64_t v107 = [v106 countByEnumeratingWithState:&v170 objects:&v179 count:16];
  if (v107)
  {
    uint64_t v108 = v107;
    uint64_t v109 = *(void *)v171;
    double v110 = 0.0;
    do
    {
      for (iuint64_t i = 0; ii != v108; ++ii)
      {
        if (*(void *)v171 != v109) {
          objc_enumerationMutation(v106);
        }
        [*(id *)(*((void *)&v170 + 1) + 8 * ii) duration];
        double v110 = v110 + v112;
      }
      uint64_t v108 = [v106 countByEnumeratingWithState:&v170 objects:&v179 count:16];
    }
    while (v108);
  }
  else
  {
    double v110 = 0.0;
  }

  return v110;
}

- (void)queryForUncategorizedLocalWebUsageDuringInterval:(id)a3 completionHandler:(id)a4
{
  v47[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v35 = a4;
  uint64_t v37 = objc_opt_new();
  uint64_t v34 = [(USUsageQuerying *)self duetStream];
  uint64_t v7 = (void *)MEMORY[0x263F35110];
  id v8 = v6;
  uint64_t v9 = [v8 startDate];
  id v10 = [v8 endDate];
  uint64_t v33 = [v7 predicateForEventsIntersectingDateRangeFrom:v9 to:v10];

  uint64_t v11 = [MEMORY[0x263F35080] usageType];
  uint64_t v12 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v11 andIntegerValue:1];
  id v13 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v11 andIntegerValue:0];
  id v14 = objc_alloc(MEMORY[0x263F08730]);
  v47[0] = v12;
  v47[1] = v13;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
  uint64_t v16 = (void *)[v14 initWithType:2 subpredicates:v15];

  id v17 = objc_opt_new();
  id v18 = [MEMORY[0x263F35090] onlyLocalDevice];
  [v17 setDeviceIDs:v18];

  id v19 = [MEMORY[0x263F35148] appWebUsageStream];
  uint64_t v46 = v19;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  [v17 setEventStreams:v20];

  id v21 = objc_alloc(MEMORY[0x263F08730]);
  v45[0] = v33;
  v45[1] = v16;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  id v23 = (void *)[v21 initWithType:1 subpredicates:v22];
  [v17 setPredicate:v23];

  uint64_t v24 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  v44[0] = v24;
  uint64_t v25 = [MEMORY[0x263F35110] endDateSortDescriptorAscending:1];
  v44[1] = v25;
  BOOL v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];

  [v17 setSortDescriptors:v26];
  id v27 = [v34 publisherForQuery:v17];

  id v28 = [v27 collect];

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke;
  v42[3] = &unk_26431DE98;
  id v43 = v35;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2;
  v38[3] = &unk_26431E190;
  v38[4] = self;
  id v39 = v8;
  id v40 = v37;
  id v41 = v43;
  id v29 = v43;
  id v30 = v37;
  id v31 = v8;
  id v32 = (id)[v28 sinkWithCompletion:v42 receiveInput:v38];
}

void __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == 1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [v5 error];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

void __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[USUsageQuerying queryForUncategorizedLocalWebUsageDuringInterval:completionHandler:]_block_invoke_2"];
    [v9 handleFailureInFunction:v10 file:@"USUsageQuerying.m" lineNumber:902 description:@"Expecting event to be non-nil"];
  }
  uint64_t v4 = [a1[4] _getWebDomainsFromWebUsageEvents:v3 videoUsageEvents:0 interval:a1[5] referenceDate:a1[6] focalOnly:0];
  if ([v4 count])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2_cold_1();
    }
    id v5 = [MEMORY[0x263F318B0] sharedCategories];
    id v6 = [v4 array];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_80;
    v11[3] = &unk_26431E168;
    id v7 = a1[7];
    id v8 = a1[4];
    id v15 = v7;
    v11[4] = v8;
    id v12 = v3;
    id v13 = a1[5];
    id v14 = a1[6];
    [v5 unCategorizedDomainsFromDomains:v6 withCompletionHandler:v11];
  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

uint64_t __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_80(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _computeUncategorizedLocalWebUsageWithWebUsageEvents:*(void *)(a1 + 40) uncategorizedDomains:a2 interval:*(void *)(a1 + 48) referenceDate:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_computeUncategorizedLocalWebUsageWithWebUsageEvents:(id)a3 uncategorizedDomains:(id)a4 interval:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7
{
  id v12 = (void (**)(id, void *, void))a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v20 = (id)[a3 mutableCopy];
  LOBYTE(v19) = 0;
  uint64_t v16 = [(USUsageQuerying *)self _computeWebUsageWithEvents:v20 timeZoneByDevice:0 lastEventDateByDevice:0 categoryUsageIntervalsByDevice:0 aggregatedApplicationUsageIntervalsByDevice:0 aggregatedWebUsageIntervalsByDevice:0 categoryByWebDomain:0 partition:v14 referenceDate:v13 focalOnly:v19];

  id v17 = [v16 objectForKeyedSubscript:@"LocalDevice"];
  id v18 = [(USUsageQuerying *)self _generateUncategorizedLocalWebUsageWithWebUsageIntervals:v17 uncategorizedDomains:v15];

  v12[2](v12, v18, 0);
}

- (id)_generateUncategorizedLocalWebUsageWithWebUsageIntervals:(id)a3 uncategorizedDomains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__USUsageQuerying__generateUncategorizedLocalWebUsageWithWebUsageIntervals_uncategorizedDomains___block_invoke;
  v15[3] = &unk_26431E1B8;
  id v7 = v6;
  id v16 = v7;
  id v17 = &v18;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  id v8 = (void *)v19[5];
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __USKeyedNonIntersectingIntervalsCreateDurationDictionary_block_invoke;
    v24[3] = &unk_26431E438;
    id v11 = v10;
    id v25 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:v24];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = (void *)MEMORY[0x263EFFA78];
  if (v11) {
    id v12 = v11;
  }
  id v13 = v12;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __97__USUsageQuerying__generateUncategorizedLocalWebUsageWithWebUsageIntervals_uncategorizedDomains___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [v11 identifier];
  if ([*(id *)(a1 + 32) containsObject:v6] && objc_msgSend(v11, "trusted"))
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v7)
    {
      [v7 setObject:v5 forKeyedSubscript:v6];
    }
    else
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v5, v6, 0);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

- (id)_computeScreenTime:(BOOL)a3 withEvents:(id)a4 intersectingScreenTimeIntervalsByDevice:(id *)a5 longestSessionByDevice:(id *)a6 timeZoneByDevice:(id)a7 lastEventDateByDevice:(id)a8 partition:(id)a9 referenceDate:(id)a10
{
  BOOL v14 = a3;
  id v36 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v35 = a10;
  if (v14) {
    uint64_t v19 = objc_opt_new();
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v33 = a5;
  if (a5) {
    a5 = (id *)objc_opt_new();
  }
  uint64_t v34 = a6;
  if (a6) {
    a6 = (id *)objc_opt_new();
  }
  uint64_t v20 = [v18 endDate];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __175__USUsageQuerying__computeScreenTime_withEvents_intersectingScreenTimeIntervalsByDevice_longestSessionByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke;
  v38[3] = &unk_26431E1E0;
  id v21 = v18;
  id v39 = v21;
  id v40 = self;
  id v22 = v19;
  id v41 = v22;
  id v23 = a5;
  id v42 = v23;
  uint64_t v24 = a6;
  id v43 = v24;
  id v25 = v16;
  id v44 = v25;
  id v26 = v17;
  id v45 = v26;
  [(USUsageQuerying *)self _enumerateEvents:v36 intervalEndDate:v20 block:v38];

  id v37 = 0;
  id v27 = v35;
  id v28 = [(USUsageQuerying *)self _currentScreenTimeIntervalDuringInterval:v21 usageStartDate:&v37 referenceDate:v35];
  id v29 = v37;
  if (v28)
  {
    id v30 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v29 endDate:v35];
    [(USUsageQuerying *)self _updateScreenTimeWithInterval:v28 rawInterval:v30 deviceIdentifier:@"LocalDevice" partition:v21 event:0 nonIntersectingScreenTimeIntervalsByDevice:v22 intersectingScreenTimeIntervalsByDevice:v23 longestSessionByDevice:v24 timeZoneByDevice:v25 lastEventDateByDevice:v26];

    id v27 = v35;
  }
  if (v33) {
    id *v33 = v23;
  }
  if (v34) {
    id *v34 = v24;
  }
  id v31 = v22;

  return v31;
}

void __175__USUsageQuerying__computeScreenTime_withEvents_intersectingScreenTimeIntervalsByDevice_longestSessionByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 startDate];
  id v5 = [v20 startDate];
  id v6 = [v4 laterDate:v5];

  id v7 = [v3 endDate];

  uint64_t v8 = [v20 endDate];
  uint64_t v9 = [v7 earlierDate:v8];

  if ([v6 compare:v9] == 1) {
    id v10 = 0;
  }
  else {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v6 endDate:v9];
  }

  if (v10)
  {
    id v11 = [v20 source];
    uint64_t v12 = [v11 syncDeviceID];
    id v13 = (void *)v12;
    BOOL v14 = @"LocalDevice";
    if (v12) {
      BOOL v14 = (__CFString *)v12;
    }
    id v15 = v14;

    id v16 = objc_alloc(MEMORY[0x263F08798]);
    id v17 = [v20 startDate];
    id v18 = [v20 endDate];
    uint64_t v19 = (void *)[v16 initWithStartDate:v17 endDate:v18];

    [*(id *)(a1 + 40) _updateScreenTimeWithInterval:v10 rawInterval:v19 deviceIdentifier:v15 partition:*(void *)(a1 + 32) event:v20 nonIntersectingScreenTimeIntervalsByDevice:*(void *)(a1 + 48) intersectingScreenTimeIntervalsByDevice:*(void *)(a1 + 56) longestSessionByDevice:*(void *)(a1 + 64) timeZoneByDevice:*(void *)(a1 + 72) lastEventDateByDevice:*(void *)(a1 + 80)];
  }
}

- (void)_updateScreenTimeWithInterval:(id)a3 rawInterval:(id)a4 deviceIdentifier:(id)a5 partition:(id)a6 event:(id)a7 nonIntersectingScreenTimeIntervalsByDevice:(id)a8 intersectingScreenTimeIntervalsByDevice:(id)a9 longestSessionByDevice:(id)a10 timeZoneByDevice:(id)a11 lastEventDateByDevice:(id)a12
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v100 = a4;
  id v18 = a5;
  id v104 = a6;
  id v103 = a7;
  id v19 = a8;
  id v102 = a9;
  id v101 = a10;
  id v106 = a11;
  id v105 = a12;
  id v107 = v19;
  if (v19)
  {
    id v20 = v17;
    id v21 = [v19 objectForKeyedSubscript:v18];
    id v98 = v18;
    id v99 = v17;
    if (v21)
    {
      id v22 = v21;
      id v23 = v20;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      uint64_t v24 = [v22 countByEnumeratingWithState:&v110 objects:v114 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v96 = v20;
        id v26 = 0;
        uint64_t v27 = *(void *)v111;
        uint64_t v108 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v111 != v27) {
              objc_enumerationMutation(v22);
            }
            id v29 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            if ([v29 intersectsDateInterval:v23])
            {
              id v30 = v22;
              id v31 = [v29 startDate];
              id v32 = [v23 startDate];
              uint64_t v33 = [v31 earlierDate:v32];

              uint64_t v34 = [v29 endDate];
              [v23 endDate];
              v36 = id v35 = v26;
              id v37 = [v34 laterDate:v36];

              id v26 = v35;
              uint64_t v38 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v33 endDate:v37];

              if (v35) {
                [v35 addObject:v29];
              }
              else {
                id v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v29, 0);
              }

              id v23 = (id)v38;
              id v22 = v30;
              uint64_t v27 = v108;
            }
          }
          uint64_t v25 = [v22 countByEnumeratingWithState:&v110 objects:v114 count:16];
        }
        while (v25);
        if (v26) {
          [v22 removeObjectsInArray:v26];
        }
        id v19 = v107;
        id v20 = v96;
      }
      else
      {
        id v26 = 0;
      }
      [v22 addObject:v23];

      id v18 = v98;
      id v17 = v99;
    }
    else
    {
      id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v20, 0);
      [v19 setObject:v22 forKeyedSubscript:v18];
    }

    id v39 = v19;
    id v40 = v20;
    id v41 = [v39 objectForKeyedSubscript:@"AllDevices"];
    if (v41)
    {
      id v97 = v39;
      id v42 = v41;
      id v95 = v40;
      id v43 = v40;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      uint64_t v44 = [v42 countByEnumeratingWithState:&v110 objects:v114 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v109 = 0;
        uint64_t v46 = *(void *)v111;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v111 != v46) {
              objc_enumerationMutation(v42);
            }
            id v48 = *(void **)(*((void *)&v110 + 1) + 8 * j);
            if ([v48 intersectsDateInterval:v43])
            {
              id v49 = v42;
              uint64_t v50 = [v48 startDate];
              unint64_t v51 = [v43 startDate];
              long long v52 = [v50 earlierDate:v51];

              long long v53 = [v48 endDate];
              long long v54 = [v43 endDate];
              unint64_t v55 = [v53 laterDate:v54];

              uint64_t v56 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v52 endDate:v55];
              if (v109) {
                [v109 addObject:v48];
              }
              else {
                uint64_t v109 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v48, 0);
              }

              id v43 = (id)v56;
              id v42 = v49;
            }
          }
          uint64_t v45 = [v42 countByEnumeratingWithState:&v110 objects:v114 count:16];
        }
        while (v45);
        long long v57 = v109;
        if (v109) {
          [v42 removeObjectsInArray:v109];
        }
        id v18 = v98;
        id v19 = v107;
      }
      else
      {
        long long v57 = 0;
      }
      [v42 addObject:v43];

      id v17 = v99;
      id v40 = v95;
      id v39 = v97;
    }
    else
    {
      id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v40, 0);
      [v39 setObject:v42 forKeyedSubscript:@"AllDevices"];
    }
  }
  long long v58 = v101;
  long long v59 = v102;
  if (v102)
  {
    id v60 = [v100 startDate];
    int v61 = [v104 containsDate:v60];

    id v19 = v107;
    if (v61)
    {
      uint64_t v62 = [v102 objectForKeyedSubscript:v18];
      if (v62)
      {
        id v63 = v62;
        [v62 addObject:v100];
      }
      else
      {
        id v63 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v100, 0);
        [v102 setObject:v63 forKeyedSubscript:v18];
      }

      id v19 = v107;
    }
  }
  if (v101)
  {
    [v100 duration];
    double v65 = v64;
    uint64_t v66 = [v101 objectForKeyedSubscript:v18];
    [v66 duration];
    double v68 = v67;

    if (v65 > v68) {
      [v101 setObject:v100 forKeyedSubscript:v18];
    }
    id v69 = [v101 objectForKeyedSubscript:@"AllDevices"];
    [v69 duration];
    double v71 = v70;

    id v19 = v107;
    if (v65 > v71) {
      [v101 setObject:v100 forKeyedSubscript:@"AllDevices"];
    }
  }
  if (v106 && v105)
  {
    id v72 = v106;
    id v73 = v105;
    id v74 = v18;
    id v75 = v103;
    id v76 = v17;
    id v77 = v74;
    id v78 = v74;
    id v79 = [v72 objectForKeyedSubscript:v78];

    if (!v79)
    {
      id v80 = [v75 timeZone];
      if (v80)
      {
        [v72 setObject:v80 forKeyedSubscript:v78];
      }
      else
      {
        id v81 = [MEMORY[0x263EFFA18] localTimeZone];
        [v72 setObject:v81 forKeyedSubscript:v78];
      }
    }
    id v82 = [v76 endDate];
    id v83 = [v73 objectForKeyedSubscript:v78];
    uint64_t v84 = v83;
    if (!v83 || [v83 compare:v82] == -1) {
      [v73 setObject:v82 forKeyedSubscript:v78];
    }

    id v85 = v72;
    id v86 = v73;
    id v87 = v75;
    id v88 = v76;
    id v89 = [v85 objectForKeyedSubscript:@"AllDevices"];

    if (!v89)
    {
      id v90 = [v87 timeZone];
      if (v90)
      {
        [v85 setObject:v90 forKeyedSubscript:@"AllDevices"];
      }
      else
      {
        id v91 = [MEMORY[0x263EFFA18] localTimeZone];
        [v85 setObject:v91 forKeyedSubscript:@"AllDevices"];
      }
    }
    id v92 = [v88 endDate];
    long long v93 = [v86 objectForKeyedSubscript:@"AllDevices"];
    long long v94 = v93;
    if (!v93 || [v93 compare:v92] == -1) {
      [v86 setObject:v92 forKeyedSubscript:@"AllDevices"];
    }

    id v18 = v77;
    id v19 = v107;
    long long v58 = v101;
    long long v59 = v102;
  }
}

- (id)_currentScreenTimeIntervalDuringInterval:(id)a3 usageStartDate:(id *)a4 referenceDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263F351D0] keyPathForBacklightOnStatus];
  id v11 = [(USUsageQuerying *)self context];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];
  id v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:]();
    }
    goto LABEL_8;
  }
  if (![v12 BOOLValue])
  {
LABEL_8:
    id v21 = 0;
    goto LABEL_13;
  }
  BOOL v14 = [v11 lastModifiedDateForContextualKeyPath:v10];
  if (v14)
  {
    uint64_t v24 = a4;
    id v15 = v8;
    id v16 = v9;
    id v17 = [v15 startDate];
    id v18 = [v17 laterDate:v14];

    id v23 = v15;
    id v19 = [v15 endDate];
    id v20 = [v19 earlierDate:v16];

    if ([v18 compare:v20] == 1) {
      id v21 = 0;
    }
    else {
      id v21 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v18 endDate:v20];
    }

    id *v24 = v14;
  }
  else
  {
    id v21 = 0;
  }

LABEL_13:
  return v21;
}

- (id)_getBundleIdentiersFromApplicationUsageEvents:(id)a3 videoUsageEvents:(id)a4 interval:(id)a5 referenceDate:(id)a6 focalOnly:(BOOL)a7
{
  BOOL v37 = a7;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v36 = a4;
  id v39 = a5;
  id v11 = a6;
  uint64_t v12 = objc_opt_new();
  id v13 = [MEMORY[0x263F35008] appBundleID];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "metadata", v36);
        id v21 = [v20 objectForKeyedSubscript:v13];

        if (v21)
        {
          id v22 = v21;
        }
        else
        {
          id v23 = [v19 value];
          id v22 = [v23 stringValue];
        }
        [v12 addObject:v22];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v16);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v24 = v36;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "value", v36);
        id v30 = [v29 stringValue];

        [v12 addObject:v30];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v26);
  }

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke;
  v42[3] = &unk_26431E208;
  id v31 = v12;
  id v43 = v31;
  [(USUsageQuerying *)self _enumerateCurrentApplicationUsageIntervalsDuringInterval:v39 referenceDate:v11 focalOnly:v37 block:v42];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2;
  v40[3] = &unk_26431E230;
  id v32 = v31;
  id v41 = v32;
  [(USUsageQuerying *)self _enumerateCurrentVideoUsageIntervalsDuringInterval:v39 referenceDate:v11 block:v40];
  uint64_t v33 = v41;
  id v34 = v32;

  return v34;
}

void __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  [a2 duration];
  if (v6 > 0.0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __115__USUsageQuerying__getBundleIdentiersFromApplicationUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  [a2 duration];
  if (v6 > 0.0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)_computeApplicationUsageWithEvents:(id)a3 unboundApplicationUsageIntervalsByDevice:(id *)a4 timeZoneByDevice:(id)a5 lastEventDateByDevice:(id)a6 categoryUsageIntervalsByDevice:(id)a7 aggregatedApplicationUsageIntervalsByDevice:(id)a8 categoryByBundleIdentifier:(id)a9 partition:(id)a10 referenceDate:(id)a11 focalOnly:(BOOL)a12
{
  id v58 = a5;
  id v56 = a6;
  id v17 = a7;
  id v18 = a8;
  id v49 = a9;
  id v19 = a10;
  id v53 = a11;
  id v51 = a3;
  id v20 = objc_opt_new();
  id v60 = a4;
  if (a4) {
    id v21 = objc_opt_new();
  }
  else {
    id v21 = 0;
  }
  id v22 = [MEMORY[0x263F35008] appBundleID];
  id v23 = [MEMORY[0x263F35080] isUsageTrusted];
  id v24 = [v19 endDate];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke;
  v81[3] = &unk_26431E258;
  id v52 = v19;
  id v82 = v52;
  id v83 = v22;
  id v84 = v23;
  id v85 = self;
  id v25 = v20;
  id v86 = v25;
  id v26 = v21;
  id v87 = v26;
  id v27 = v17;
  id v88 = v27;
  id v28 = v18;
  id v89 = v28;
  id v50 = v49;
  id v90 = v50;
  id v29 = v58;
  id v91 = v29;
  id v30 = v56;
  id v92 = v30;
  id v59 = v23;
  id v57 = v22;
  [(USUsageQuerying *)self _enumerateEvents:v51 intervalEndDate:v24 block:v81];

  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_2;
  v71[3] = &unk_26431E280;
  id v31 = v53;
  id v72 = v31;
  id v73 = self;
  id v32 = v25;
  id v74 = v32;
  id v33 = v26;
  id v75 = v33;
  id v34 = v27;
  id v76 = v34;
  id v35 = v28;
  id v77 = v35;
  id v36 = v50;
  id v78 = v36;
  id v37 = v29;
  id v79 = v37;
  id v38 = v30;
  id v80 = v38;
  [(USUsageQuerying *)self _enumerateCurrentApplicationUsageIntervalsDuringInterval:v52 referenceDate:v31 focalOnly:a12 block:v71];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_3;
  v61[3] = &unk_26431E2A8;
  id v62 = v31;
  id v63 = self;
  id v39 = v32;
  id v64 = v39;
  id v40 = v33;
  id v65 = v40;
  id v66 = v34;
  id v67 = v35;
  id v68 = v36;
  id v69 = v37;
  id v70 = v38;
  id v54 = v38;
  id v41 = v37;
  id v42 = v36;
  id v43 = v35;
  id v44 = v34;
  id v45 = v31;
  [(USUsageQuerying *)self _enumerateCurrentVideoUsageIntervalsDuringInterval:v52 referenceDate:v45 block:v61];
  if (v60) {
    id *v60 = v40;
  }
  long long v46 = v70;
  id v47 = v39;

  return v47;
}

void __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke(uint64_t a1, void *a2)
{
  id v31 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 startDate];
  id v5 = [v31 startDate];
  double v6 = [v4 laterDate:v5];

  id v7 = [v3 endDate];

  id v8 = [v31 endDate];
  id v9 = [v7 earlierDate:v8];

  if ([v6 compare:v9] == 1) {
    id v10 = 0;
  }
  else {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v6 endDate:v9];
  }

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F08798]);
    uint64_t v12 = [v31 startDate];
    id v13 = [v31 endDate];
    id v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];

    uint64_t v15 = [v31 source];
    uint64_t v16 = [v15 syncDeviceID];
    id v17 = (void *)v16;
    id v18 = @"LocalDevice";
    if (v16) {
      id v18 = (__CFString *)v16;
    }
    id v19 = v18;

    id v20 = [v31 metadata];
    id v21 = [v20 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v21)
    {
      id v22 = v21;
    }
    else
    {
      id v23 = [v31 value];
      id v22 = [v23 stringValue];
    }
    id v24 = [v31 metadata];
    uint64_t v25 = [v24 objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v26 = (void *)v25;
    id v27 = (void *)MEMORY[0x263EFFA88];
    if (v25) {
      id v27 = (void *)v25;
    }
    id v28 = v27;

    id v29 = *(void **)(a1 + 56);
    uint64_t v30 = [v28 BOOLValue];

    [v29 _updateApplicationUsageWithInterval:v10 unboundInterval:v14 bundleIdentifier:v22 trustedApplicationUsage:v30 deviceIdentifier:v19 event:v31 applicationUsageIntervalsByDevice:*(void *)(a1 + 64) unboundApplicationUsageIntervalsByDevice:*(void *)(a1 + 72) categoryUsageIntervalsByDevice:*(void *)(a1 + 80) aggregatedApplicationUsageIntervalsByDevice:*(void *)(a1 + 88) categoryByBundleIdentifier:*(void *)(a1 + 96) timeZoneByDevice:*(void *)(a1 + 104) lastEventDateByDevice:*(void *)(a1 + 112)];
  }
}

void __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = (objc_class *)MEMORY[0x263F08798];
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = (id)[[v9 alloc] initWithStartDate:v11 endDate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) _updateApplicationUsageWithInterval:v12 unboundInterval:v13 bundleIdentifier:v10 trustedApplicationUsage:a5 deviceIdentifier:@"LocalDevice" event:0 applicationUsageIntervalsByDevice:*(void *)(a1 + 48) unboundApplicationUsageIntervalsByDevice:*(void *)(a1 + 56) categoryUsageIntervalsByDevice:*(void *)(a1 + 64) aggregatedApplicationUsageIntervalsByDevice:*(void *)(a1 + 72) categoryByBundleIdentifier:*(void *)(a1 + 80) timeZoneByDevice:*(void *)(a1 + 88) lastEventDateByDevice:*(void *)(a1 + 96)];
}

void __270__USUsageQuerying__computeApplicationUsageWithEvents_unboundApplicationUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_categoryByBundleIdentifier_partition_referenceDate_focalOnly___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10 = (objc_class *)MEMORY[0x263F08798];
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = (id)[[v10 alloc] initWithStartDate:v12 endDate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) _updateApplicationUsageWithInterval:v13 unboundInterval:v14 bundleIdentifier:v11 trustedApplicationUsage:a6 deviceIdentifier:@"LocalDevice" event:0 applicationUsageIntervalsByDevice:*(void *)(a1 + 48) unboundApplicationUsageIntervalsByDevice:*(void *)(a1 + 56) categoryUsageIntervalsByDevice:*(void *)(a1 + 64) aggregatedApplicationUsageIntervalsByDevice:*(void *)(a1 + 72) categoryByBundleIdentifier:*(void *)(a1 + 80) timeZoneByDevice:*(void *)(a1 + 88) lastEventDateByDevice:*(void *)(a1 + 96)];
}

- (void)_updateApplicationUsageWithInterval:(id)a3 unboundInterval:(id)a4 bundleIdentifier:(id)a5 trustedApplicationUsage:(BOOL)a6 deviceIdentifier:(id)a7 event:(id)a8 applicationUsageIntervalsByDevice:(id)a9 unboundApplicationUsageIntervalsByDevice:(id)a10 categoryUsageIntervalsByDevice:(id)a11 aggregatedApplicationUsageIntervalsByDevice:(id)a12 categoryByBundleIdentifier:(id)a13 timeZoneByDevice:(id)a14 lastEventDateByDevice:(id)a15
{
  BOOL v17 = a6;
  uint64_t v337 = *MEMORY[0x263EF8340];
  id v324 = a3;
  id v291 = a4;
  id v20 = a5;
  id v21 = a7;
  id v287 = a8;
  id v22 = a9;
  id v290 = a10;
  id v302 = a11;
  id v301 = a12;
  id v296 = a13;
  id v300 = a14;
  id v295 = a15;
  v299 = v20;
  BOOL v283 = v17;
  id v23 = +[USTrustIdentifier identifierWithIdentifier:v20 trusted:v17];
  id v24 = v22;
  id v25 = v21;
  id v26 = v23;
  id v27 = v324;
  id v28 = [v24 objectForKeyedSubscript:v25];
  id v292 = v25;
  if (v28)
  {
    id v29 = v28;
    id v30 = v26;
    id v31 = v27;
    id v32 = [v29 objectForKeyedSubscript:v30];
    if (v32)
    {
      id v33 = v32;
      id v317 = v31;
      id v34 = v31;
      long long v332 = 0u;
      long long v333 = 0u;
      long long v334 = 0u;
      long long v335 = 0u;
      id v35 = v33;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v332 objects:v336 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        id v288 = v30;
        id v293 = v29;
        id v297 = v27;
        id v303 = v26;
        id v310 = v24;
        id v38 = 0;
        uint64_t v39 = *(void *)v333;
        id v276 = v34;
        do
        {
          uint64_t v40 = 0;
          uint64_t v325 = v37;
          do
          {
            if (*(void *)v333 != v39) {
              objc_enumerationMutation(v35);
            }
            id v41 = *(void **)(*((void *)&v332 + 1) + 8 * v40);
            if ([v41 intersectsDateInterval:v34])
            {
              id v42 = v35;
              id v43 = [v41 startDate];
              id v44 = [v34 startDate];
              id v45 = [v43 earlierDate:v44];

              long long v46 = [v41 endDate];
              id v47 = [v34 endDate];
              long long v48 = [v46 laterDate:v47];

              uint64_t v49 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v45 endDate:v48];
              if (v38) {
                [v38 addObject:v41];
              }
              else {
                id v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v41, 0);
              }

              id v34 = (id)v49;
              id v35 = v42;
              uint64_t v37 = v325;
            }
            ++v40;
          }
          while (v37 != v40);
          uint64_t v37 = [v35 countByEnumeratingWithState:&v332 objects:v336 count:16];
        }
        while (v37);

        if (v38)
        {
          [v35 removeObjectsInArray:v38];
          id v50 = v38;
        }
        else
        {
          id v50 = 0;
        }
        id v26 = v303;
        id v24 = v310;
        id v27 = v297;
        id v29 = v293;
        id v30 = v288;
        id v52 = v276;
      }
      else
      {

        id v50 = 0;
        id v52 = v34;
      }
      [v35 addObject:v34];

      id v25 = v292;
      id v31 = v317;
    }
    else
    {
      id v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v31, 0);
      [v29 setObject:v35 forKeyedSubscript:v30];
    }
  }
  else
  {
    id v51 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v27, 0);
    id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v51, v26, 0);
    [v24 setObject:v29 forKeyedSubscript:v25];
  }
  id v53 = v24;
  id v54 = v26;
  id v55 = v27;
  id v56 = [v53 objectForKeyedSubscript:@"AllDevices"];
  id v298 = v55;
  v294 = v54;
  v289 = v53;
  if (v56)
  {
    id v57 = v56;
    id v58 = v54;
    id v59 = v55;
    id v60 = [v57 objectForKeyedSubscript:v58];
    if (v60)
    {
      id v61 = v60;
      id v62 = v59;
      long long v332 = 0u;
      long long v333 = 0u;
      long long v334 = 0u;
      long long v335 = 0u;
      id v63 = v61;
      id v64 = (void *)[v63 countByEnumeratingWithState:&v332 objects:v336 count:16];
      if (v64)
      {
        id v304 = v59;
        id v311 = v58;
        id v318 = v57;
        uint64_t v65 = 0;
        uint64_t v66 = *(void *)v333;
        id v277 = v62;
        id v67 = v62;
        do
        {
          id v68 = 0;
          v326 = v64;
          do
          {
            if (*(void *)v333 != v66) {
              objc_enumerationMutation(v63);
            }
            id v69 = *(void **)(*((void *)&v332 + 1) + 8 * (void)v68);
            if ([v69 intersectsDateInterval:v67])
            {
              id v70 = v63;
              double v71 = [v69 startDate];
              id v72 = [v67 startDate];
              id v73 = [v71 earlierDate:v72];

              id v74 = [v69 endDate];
              [v67 endDate];
              v76 = id v75 = (void *)v65;
              id v77 = [v74 laterDate:v76];

              uint64_t v65 = (uint64_t)v75;
              uint64_t v78 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v73 endDate:v77];

              if (v75) {
                [v75 addObject:v69];
              }
              else {
                uint64_t v65 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v69, 0);
              }

              id v67 = (void *)v78;
              id v63 = v70;
              id v64 = v326;
            }
            id v68 = (char *)v68 + 1;
          }
          while (v64 != v68);
          id v64 = (void *)[v63 countByEnumeratingWithState:&v332 objects:v336 count:16];
        }
        while (v64);

        if (v65)
        {
          [v63 removeObjectsInArray:v65];
          id v55 = v298;
          id v57 = v318;
          id v64 = (void *)v65;
        }
        else
        {
          id v64 = 0;
          id v55 = v298;
          id v57 = v318;
        }
        id v59 = v304;
        id v58 = v311;
        id v62 = v277;
      }
      else
      {

        id v67 = v62;
      }
      [v63 addObject:v67];

      id v25 = v292;
    }
    else
    {
      id v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v59, 0);
      [v57 setObject:v63 forKeyedSubscript:v58];
    }

    id v80 = v57;
    id v79 = v289;
    id v54 = v294;
  }
  else
  {
    id v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v55, 0);
    id v79 = v53;
    id v80 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v57, v54, 0);
    [v79 setObject:v80 forKeyedSubscript:@"AllDevices"];
  }

  if (v302)
  {
    id v81 = [v296 objectForKeyedSubscript:v299];
    uint64_t v82 = [v81 identifier];
    id v83 = (void *)v82;
    id v84 = (void *)*MEMORY[0x263F31838];
    if (v82) {
      id v84 = (void *)v82;
    }
    id v85 = v84;

    id v86 = v302;
    id v87 = v25;
    id v88 = v85;
    id v89 = v55;
    id v90 = [v86 objectForKeyedSubscript:v87];
    if (v90)
    {
      id v91 = v90;
      id v92 = v88;
      id v278 = v89;
      id v93 = v89;
      long long v94 = v92;
      id v95 = v93;
      id v96 = [v91 objectForKeyedSubscript:v94];
      if (v96)
      {
        v261 = v94;
        id v266 = v91;
        id v271 = v88;
        id v97 = v96;
        id v98 = v95;
        long long v332 = 0u;
        long long v333 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        id v99 = v97;
        uint64_t v100 = [v99 countByEnumeratingWithState:&v332 objects:v336 count:16];
        if (v100)
        {
          uint64_t v101 = v100;
          id v259 = v86;
          v327 = 0;
          uint64_t v102 = *(void *)v333;
          id v103 = v98;
          uint64_t v305 = *(void *)v333;
          id v312 = v98;
          do
          {
            uint64_t v104 = 0;
            uint64_t v319 = v101;
            do
            {
              if (*(void *)v333 != v102) {
                objc_enumerationMutation(v99);
              }
              id v105 = *(void **)(*((void *)&v332 + 1) + 8 * v104);
              if ([v105 intersectsDateInterval:v103])
              {
                id v106 = v99;
                id v107 = v95;
                id v108 = v87;
                uint64_t v109 = [v105 startDate];
                long long v110 = [v103 startDate];
                long long v111 = [v109 earlierDate:v110];

                long long v112 = [v105 endDate];
                long long v113 = [v103 endDate];
                uint64_t v114 = [v112 laterDate:v113];

                uint64_t v115 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v111 endDate:v114];
                if (v327) {
                  [v327 addObject:v105];
                }
                else {
                  v327 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v105, 0);
                }
                id v87 = v108;

                id v103 = (void *)v115;
                id v95 = v107;
                id v99 = v106;
                uint64_t v102 = v305;
                id v98 = v312;
                uint64_t v101 = v319;
              }
              ++v104;
            }
            while (v101 != v104);
            uint64_t v101 = [v99 countByEnumeratingWithState:&v332 objects:v336 count:16];
          }
          while (v101);

          uint64_t v116 = v327;
          if (v327) {
            [v99 removeObjectsInArray:v327];
          }
          id v55 = v298;
          id v86 = v259;
        }
        else
        {

          uint64_t v116 = 0;
          id v103 = v98;
        }
        id v88 = v271;
        [v99 addObject:v103];

        id v25 = v292;
        long long v94 = v261;
        id v91 = v266;
      }
      else
      {
        id v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v95, 0);
        [v91 setObject:v99 forKeyedSubscript:v94];
      }

      id v118 = v91;
      uint64_t v117 = v278;
    }
    else
    {
      id v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v89, 0);
      uint64_t v117 = v89;
      id v118 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v91, v88, 0);
      [v86 setObject:v118 forKeyedSubscript:v87];
    }

    id v119 = v86;
    id v120 = v88;
    id v121 = v117;
    id v122 = [v119 objectForKeyedSubscript:@"AllDevices"];
    if (v122)
    {
      id v123 = v122;
      id v124 = v120;
      id v125 = v121;
      v126 = [v123 objectForKeyedSubscript:v124];
      if (v126)
      {
        id v127 = v126;
        id v320 = v125;
        id v128 = v125;
        long long v332 = 0u;
        long long v333 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        id v129 = v127;
        uint64_t v130 = [v129 countByEnumeratingWithState:&v332 objects:v336 count:16];
        if (v130)
        {
          uint64_t v131 = v130;
          id v267 = v124;
          id v272 = v123;
          id v279 = v121;
          id v306 = v120;
          id v313 = v119;
          id v132 = 0;
          uint64_t v133 = *(void *)v333;
          id v262 = v128;
          id v134 = v129;
          do
          {
            uint64_t v135 = 0;
            uint64_t v328 = v131;
            do
            {
              if (*(void *)v333 != v133) {
                objc_enumerationMutation(v134);
              }
              id v136 = *(void **)(*((void *)&v332 + 1) + 8 * v135);
              if ([v136 intersectsDateInterval:v128])
              {
                uint64_t v137 = v134;
                uint64_t v138 = [v136 startDate];
                uint64_t v139 = [v128 startDate];
                uint64_t v140 = [v138 earlierDate:v139];

                id v141 = [v136 endDate];
                id v142 = [v128 endDate];
                v143 = [v141 laterDate:v142];

                uint64_t v144 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v140 endDate:v143];
                if (v132) {
                  [v132 addObject:v136];
                }
                else {
                  id v132 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v136, 0);
                }

                id v128 = (id)v144;
                id v134 = v137;
                uint64_t v131 = v328;
              }
              ++v135;
            }
            while (v131 != v135);
            uint64_t v131 = [v134 countByEnumeratingWithState:&v332 objects:v336 count:16];
          }
          while (v131);

          if (v132)
          {
            [v134 removeObjectsInArray:v132];
            id v55 = v298;
            id v129 = v134;
            id v120 = v306;
            id v119 = v313;
            uint64_t v145 = v132;
          }
          else
          {
            uint64_t v145 = 0;
            id v55 = v298;
            id v129 = v134;
            id v120 = v306;
            id v119 = v313;
          }
          id v123 = v272;
          id v121 = v279;
          id v147 = v262;
          id v124 = v267;
        }
        else
        {

          uint64_t v145 = 0;
          id v147 = v128;
        }
        [v129 addObject:v128];

        id v25 = v292;
        id v125 = v320;
      }
      else
      {
        id v129 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v125, 0);
        [v123 setObject:v129 forKeyedSubscript:v124];
      }

      uint64_t v146 = v123;
    }
    else
    {
      id v123 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v121, 0);
      uint64_t v146 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v123, v120, 0);
      [v119 setObject:v146 forKeyedSubscript:@"AllDevices"];
    }
  }
  if (v301)
  {
    v148 = [v296 objectForKeyedSubscript:v299];
    id v149 = [v148 canonicalBundleIdentifier];

    if (!v149) {
      id v149 = v299;
    }
    long long v150 = +[USTrustIdentifier identifierWithIdentifier:v149 trusted:v283];
    id v151 = v301;
    id v152 = v25;
    id v153 = v150;
    id v154 = v55;
    long long v155 = [v151 objectForKeyedSubscript:v152];
    if (v155)
    {
      id v156 = v155;
      id v157 = v153;
      id v158 = v154;
      long long v159 = [v156 objectForKeyedSubscript:v157];
      if (v159)
      {
        id v273 = v156;
        id v280 = v152;
        id v284 = v154;
        id v307 = v153;
        id v160 = v159;
        id v161 = v158;
        long long v332 = 0u;
        long long v333 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        id v162 = v160;
        uint64_t v163 = [v162 countByEnumeratingWithState:&v332 objects:v336 count:16];
        id v268 = v158;
        id v314 = v149;
        if (v163)
        {
          uint64_t v164 = v163;
          id v260 = v161;
          id v263 = v151;
          v329 = 0;
          uint64_t v165 = *(void *)v333;
          long long v166 = v161;
          do
          {
            uint64_t v167 = 0;
            uint64_t v321 = v164;
            do
            {
              if (*(void *)v333 != v165) {
                objc_enumerationMutation(v162);
              }
              long long v168 = *(void **)(*((void *)&v332 + 1) + 8 * v167);
              if ([v168 intersectsDateInterval:v166])
              {
                id v169 = v162;
                id v170 = v157;
                long long v171 = [v168 startDate];
                long long v172 = [v166 startDate];
                long long v173 = [v171 earlierDate:v172];

                v174 = [v168 endDate];
                v175 = [v166 endDate];
                v176 = [v174 laterDate:v175];

                uint64_t v177 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v173 endDate:v176];
                if (v329) {
                  [v329 addObject:v168];
                }
                else {
                  v329 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v168, 0);
                }
                id v157 = v170;

                long long v166 = (void *)v177;
                id v162 = v169;
                uint64_t v164 = v321;
              }
              ++v167;
            }
            while (v164 != v167);
            uint64_t v164 = [v162 countByEnumeratingWithState:&v332 objects:v336 count:16];
          }
          while (v164);

          v178 = v329;
          if (v329) {
            [v162 removeObjectsInArray:v329];
          }
          uint64_t v179 = v260;
          id v151 = v263;
        }
        else
        {

          v178 = 0;
          long long v166 = v161;
          uint64_t v179 = v161;
        }
        id v153 = v307;
        id v152 = v280;
        id v154 = v284;
        id v156 = v273;
        [v162 addObject:v166];

        v181 = v162;
        id v25 = v292;
        id v158 = v268;
        id v149 = v314;
      }
      else
      {
        v181 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v158, 0);
        [v156 setObject:v181 forKeyedSubscript:v157];
      }

      uint64_t v180 = v156;
    }
    else
    {
      id v156 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v154, 0);
      uint64_t v180 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v156, v153, 0);
      [v151 setObject:v180 forKeyedSubscript:v152];
    }

    id v182 = v151;
    id v183 = v153;
    id v184 = v154;
    uint64_t v185 = [v182 objectForKeyedSubscript:@"AllDevices"];
    if (v185)
    {
      id v186 = v185;
      id v187 = v183;
      id v188 = v184;
      v189 = [v186 objectForKeyedSubscript:v187];
      id v55 = v298;
      if (v189)
      {
        id v190 = v189;
        id v322 = v188;
        id v191 = v188;
        long long v332 = 0u;
        long long v333 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        id v192 = v190;
        uint64_t v193 = [v192 countByEnumeratingWithState:&v332 objects:v336 count:16];
        id v315 = v149;
        if (v193)
        {
          uint64_t v194 = v193;
          id v269 = v187;
          id v274 = v186;
          id v281 = v184;
          id v285 = v183;
          id v308 = v182;
          v195 = 0;
          uint64_t v196 = *(void *)v333;
          id v264 = v191;
          do
          {
            uint64_t v197 = 0;
            uint64_t v330 = v194;
            do
            {
              if (*(void *)v333 != v196) {
                objc_enumerationMutation(v192);
              }
              v198 = *(void **)(*((void *)&v332 + 1) + 8 * v197);
              if ([v198 intersectsDateInterval:v191])
              {
                id v199 = v192;
                v200 = [v198 startDate];
                v201 = [v191 startDate];
                v202 = [v200 earlierDate:v201];

                v203 = [v198 endDate];
                v204 = [v191 endDate];
                v205 = [v203 laterDate:v204];

                uint64_t v206 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v202 endDate:v205];
                if (v195) {
                  [v195 addObject:v198];
                }
                else {
                  v195 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v198, 0);
                }

                id v191 = (id)v206;
                id v192 = v199;
                uint64_t v194 = v330;
              }
              ++v197;
            }
            while (v194 != v197);
            uint64_t v194 = [v192 countByEnumeratingWithState:&v332 objects:v336 count:16];
          }
          while (v194);

          if (v195)
          {
            [v192 removeObjectsInArray:v195];
            id v182 = v308;
            v207 = v195;
          }
          else
          {
            v207 = 0;
            id v182 = v308;
          }
          id v184 = v281;
          id v183 = v285;
          id v187 = v269;
          id v186 = v274;
          id v188 = v322;
          v209 = v264;
        }
        else
        {

          v207 = 0;
          v209 = v191;
        }
        [v192 addObject:v191];

        id v25 = v292;
        id v55 = v298;
        id v149 = v315;
      }
      else
      {
        id v192 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v188, 0);
        [v186 setObject:v192 forKeyedSubscript:v187];
      }

      v208 = v186;
    }
    else
    {
      id v186 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v184, 0);
      v208 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v186, v183, 0);
      [v182 setObject:v208 forKeyedSubscript:@"AllDevices"];
      id v55 = v298;
    }
  }
  if (v300 && v295)
  {
    id v210 = v300;
    id v211 = v295;
    id v212 = v287;
    id v213 = v55;
    id v214 = v25;
    v215 = [v210 objectForKeyedSubscript:v214];

    if (!v215)
    {
      v216 = [v212 timeZone];
      if (v216)
      {
        [v210 setObject:v216 forKeyedSubscript:v214];
      }
      else
      {
        v217 = [MEMORY[0x263EFFA18] localTimeZone];
        [v210 setObject:v217 forKeyedSubscript:v214];
      }
    }
    v218 = [v213 endDate];
    v219 = [v211 objectForKeyedSubscript:v214];
    v220 = v219;
    if (!v219 || [v219 compare:v218] == -1) {
      [v211 setObject:v218 forKeyedSubscript:v214];
    }

    id v221 = v210;
    id v222 = v211;
    id v223 = v212;
    id v224 = v213;
    v225 = [v221 objectForKeyedSubscript:@"AllDevices"];

    id v55 = v298;
    if (!v225)
    {
      v226 = [v223 timeZone];
      if (v226)
      {
        [v221 setObject:v226 forKeyedSubscript:@"AllDevices"];
      }
      else
      {
        v227 = [MEMORY[0x263EFFA18] localTimeZone];
        [v221 setObject:v227 forKeyedSubscript:@"AllDevices"];
      }
    }
    v228 = [v224 endDate];
    v229 = [v222 objectForKeyedSubscript:@"AllDevices"];
    v230 = v229;
    if (!v229 || [v229 compare:v228] == -1) {
      [v222 setObject:v228 forKeyedSubscript:@"AllDevices"];
    }
  }
  v231 = v290;
  if (v290)
  {
    id v232 = v290;
    id v233 = v25;
    id v234 = v294;
    id v235 = v291;
    v236 = [v232 objectForKeyedSubscript:v233];
    if (v236)
    {
      id v237 = v236;
      id v238 = v234;
      id v239 = v235;
      v240 = [v237 objectForKeyedSubscript:v238];
      if (v240)
      {
        id v286 = v238;
        id v309 = v237;
        id v316 = v235;
        id v323 = v234;
        id v241 = v240;
        id v282 = v239;
        id v242 = v239;
        long long v332 = 0u;
        long long v333 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        id v243 = v241;
        uint64_t v244 = [v243 countByEnumeratingWithState:&v332 objects:v336 count:16];
        if (v244)
        {
          uint64_t v245 = v244;
          id v270 = v233;
          id v275 = v232;
          v331 = 0;
          uint64_t v246 = *(void *)v333;
          id v265 = v242;
          do
          {
            for (uint64_t i = 0; i != v245; ++i)
            {
              if (*(void *)v333 != v246) {
                objc_enumerationMutation(v243);
              }
              v248 = *(void **)(*((void *)&v332 + 1) + 8 * i);
              if ([v248 intersectsDateInterval:v242])
              {
                v249 = [v248 startDate];
                v250 = [v242 startDate];
                v251 = [v249 earlierDate:v250];

                v252 = [v248 endDate];
                v253 = [v242 endDate];
                v254 = [v252 laterDate:v253];

                uint64_t v255 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v251 endDate:v254];
                if (v331) {
                  [v331 addObject:v248];
                }
                else {
                  v331 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v248, 0);
                }

                id v242 = (id)v255;
              }
            }
            uint64_t v245 = [v243 countByEnumeratingWithState:&v332 objects:v336 count:16];
          }
          while (v245);

          v256 = v331;
          if (v331) {
            [v243 removeObjectsInArray:v331];
          }
          id v25 = v292;
          id v233 = v270;
          id v232 = v275;
          v257 = v265;
        }
        else
        {

          v256 = 0;
          v257 = v242;
          id v25 = v292;
        }
        [v243 addObject:v242];

        id v55 = v298;
        id v235 = v316;
        id v234 = v323;
        id v237 = v309;
        id v239 = v282;
        id v238 = v286;
      }
      else
      {
        id v243 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v239, 0);
        [v237 setObject:v243 forKeyedSubscript:v238];
      }

      v258 = v237;
    }
    else
    {
      id v237 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v235, 0);
      v258 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v237, v234, 0);
      [v232 setObject:v258 forKeyedSubscript:v233];
    }

    v231 = v290;
  }
}

- (void)_enumerateCurrentApplicationUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 focalOnly:(BOOL)a5 block:(id)a6
{
  BOOL v36 = a5;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v40 = a4;
  id v34 = (void (**)(id, void *, id, void *, uint64_t))a6;
  id v9 = [MEMORY[0x263F351D0] keyPathForAppUsageDataDictionaries];
  id v10 = [(USUsageQuerying *)self context];
  id v11 = [v10 objectForKeyedSubscript:v9];
  if (v11)
  {
    id v32 = v10;
    id v33 = v9;
    uint64_t v39 = [MEMORY[0x263F351D0] appUsageBundleID];
    id v38 = [MEMORY[0x263F351D0] appUsageStartDate];
    uint64_t v37 = [MEMORY[0x263F351D0] isUsageTrusted];
    id v43 = [MEMORY[0x263F351D0] appUsageType];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v31 = v11;
    id obj = v11;
    uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v46 != v42) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v14 = [v13 objectForKeyedSubscript:v43];
          uint64_t v15 = v14;
          if (!v14 || (uint64_t v16 = [v14 integerValue], !v36) || v16 == 1)
          {
            BOOL v17 = [v13 objectForKeyedSubscript:v39];
            id v18 = [v13 objectForKeyedSubscript:v38];
            uint64_t v19 = [v13 objectForKeyedSubscript:v37];
            id v20 = (void *)v19;
            id v21 = (void *)MEMORY[0x263EFFA88];
            if (v19) {
              id v21 = (void *)v19;
            }
            id v22 = v21;

            id v23 = v41;
            id v24 = v18;
            id v25 = v40;
            id v26 = [v23 startDate];
            id v27 = [v26 laterDate:v24];

            id v28 = [v23 endDate];
            id v29 = [v28 earlierDate:v25];

            if ([v27 compare:v29] == 1) {
              id v30 = 0;
            }
            else {
              id v30 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v27 endDate:v29];
            }

            if (v30) {
              v34[2](v34, v30, v24, v17, [v22 BOOLValue]);
            }
          }
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v44);
    }

    id v10 = v32;
    id v9 = v33;
    id v11 = v31;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:]();
  }
}

- (id)_getWebDomainsFromWebUsageEvents:(id)a3 videoUsageEvents:(id)a4 interval:(id)a5 referenceDate:(id)a6 focalOnly:(BOOL)a7
{
  BOOL v35 = a7;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v36 = a6;
  id v13 = objc_opt_new();
  id v14 = [MEMORY[0x263F35080] webDomain];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v46 + 1) + 8 * i) metadata];
        id v21 = [v20 objectForKeyedSubscript:v14];

        if (v21) {
          [v13 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v17);
  }

  if (v11)
  {
    id v33 = v12;
    id v22 = [MEMORY[0x263F35018] URL];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v34 = v11;
    id v23 = v11;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [*(id *)(*((void *)&v42 + 1) + 8 * j) metadata];
          id v29 = [v28 objectForKeyedSubscript:v22];

          id v30 = [v29 host];
          if (v30) {
            [v13 addObject:v30];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v25);
    }

    id v12 = v33;
    id v11 = v34;
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke;
  v40[3] = &unk_26431E2D0;
  id v31 = v13;
  id v41 = v31;
  [(USUsageQuerying *)self _enumerateCurrentWebUsageIntervalsDuringInterval:v12 referenceDate:v36 focalOnly:v35 block:v40];
  if (v11)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2;
    v38[3] = &unk_26431E230;
    id v39 = v31;
    [(USUsageQuerying *)self _enumerateCurrentVideoUsageIntervalsDuringInterval:v12 referenceDate:v36 block:v38];
  }
  return v31;
}

void __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  [a2 duration];
  if (v5 > 0.0) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __102__USUsageQuerying__getWebDomainsFromWebUsageEvents_videoUsageEvents_interval_referenceDate_focalOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  [a2 duration];
  id v8 = v9;
  if (v9 && v7 > 0.0)
  {
    [*(id *)(a1 + 32) addObject:v9];
    id v8 = v9;
  }
}

- (id)_computeWebUsageWithEvents:(id)a3 timeZoneByDevice:(id)a4 lastEventDateByDevice:(id)a5 categoryUsageIntervalsByDevice:(id)a6 aggregatedApplicationUsageIntervalsByDevice:(id)a7 aggregatedWebUsageIntervalsByDevice:(id)a8 categoryByWebDomain:(id)a9 partition:(id)a10 referenceDate:(id)a11 focalOnly:(BOOL)a12
{
  id v59 = a4;
  id v61 = a5;
  id v18 = a6;
  id v50 = a7;
  id v55 = a8;
  id v57 = a9;
  id v19 = a10;
  id v53 = a11;
  id v52 = a3;
  id v20 = objc_opt_new();
  long long v47 = [MEMORY[0x263F35080] webDomain];
  id v21 = [MEMORY[0x263F35080] isUsageTrusted];
  long long v48 = [MEMORY[0x263F35018] URL];
  id v22 = [MEMORY[0x263F35148] appMediaUsageStream];
  id v23 = [v22 name];

  long long v49 = [v19 endDate];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke;
  v79[3] = &unk_26431E2F8;
  id v80 = v23;
  id v81 = v48;
  id v82 = v47;
  id v83 = v19;
  id v84 = v21;
  id v85 = self;
  id v24 = v20;
  id v86 = v24;
  id v25 = v18;
  id v87 = v25;
  id v26 = v50;
  id v88 = v26;
  id v27 = v55;
  id v89 = v27;
  id v51 = v57;
  id v90 = v51;
  id v28 = v59;
  id v91 = v28;
  id v29 = v61;
  id v92 = v29;
  id v62 = v21;
  id v30 = v19;
  id v60 = v47;
  id v58 = v48;
  id v56 = v23;
  [(USUsageQuerying *)self _enumerateEvents:v52 intervalEndDate:v49 block:v79];

  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_2;
  v71[3] = &unk_26431E320;
  void v71[4] = self;
  id v31 = v24;
  id v72 = v31;
  id v32 = v25;
  id v73 = v32;
  id v33 = v26;
  id v74 = v33;
  id v34 = v27;
  id v75 = v34;
  id v35 = v51;
  id v76 = v35;
  id v36 = v28;
  id v77 = v36;
  id v37 = v29;
  id v78 = v37;
  [(USUsageQuerying *)self _enumerateCurrentWebUsageIntervalsDuringInterval:v30 referenceDate:v53 focalOnly:a12 block:v71];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_3;
  v63[3] = &unk_26431E348;
  v63[4] = self;
  id v38 = v31;
  id v64 = v38;
  id v65 = v32;
  id v66 = v33;
  id v67 = v34;
  id v68 = v35;
  id v69 = v36;
  id v70 = v37;
  id v54 = v37;
  id v39 = v36;
  id v40 = v35;
  id v41 = v34;
  id v42 = v33;
  id v43 = v32;
  [(USUsageQuerying *)self _enumerateCurrentVideoUsageIntervalsDuringInterval:v30 referenceDate:v53 block:v63];

  long long v44 = v70;
  id v45 = v38;

  return v45;
}

void __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke(void *a1, void *a2)
{
  id v31 = a2;
  id v3 = [v31 source];
  uint64_t v4 = [v3 syncDeviceID];
  double v5 = (void *)v4;
  id v6 = @"LocalDevice";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  double v7 = v6;

  id v8 = [v31 stream];
  id v9 = [v8 name];

  LODWORD(v8) = [v9 isEqualToString:a1[4]];
  id v10 = [v31 metadata];
  id v11 = v10;
  if (v8)
  {
    id v12 = [v10 objectForKeyedSubscript:a1[5]];

    id v13 = [v12 host];
    id v11 = v12;
  }
  else
  {
    id v13 = [v10 objectForKeyedSubscript:a1[6]];
  }

  if (v13)
  {
    id v14 = (void *)a1[7];
    id v15 = v31;
    id v16 = v14;
    uint64_t v17 = [v16 startDate];
    id v18 = [v15 startDate];
    id v19 = [v17 laterDate:v18];

    id v20 = [v16 endDate];

    id v21 = [v15 endDate];
    id v22 = [v20 earlierDate:v21];

    if ([v19 compare:v22] == 1) {
      id v23 = 0;
    }
    else {
      id v23 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v19 endDate:v22];
    }

    if (v23)
    {
      id v24 = [v15 metadata];
      uint64_t v25 = [v24 objectForKeyedSubscript:a1[8]];
      id v26 = (void *)v25;
      id v27 = (void *)MEMORY[0x263EFFA88];
      if (v25) {
        id v27 = (void *)v25;
      }
      id v28 = v27;

      id v29 = (void *)a1[9];
      uint64_t v30 = [v28 BOOLValue];

      [v29 _updateWebUsageWithInterval:v23 webDomain:v13 trustedWebUsage:v30 deviceIdentifier:v7 event:v15 webUsageIntervalsByDevice:a1[10] categoryUsageIntervalsByDevice:a1[11] aggregatedApplicationUsageIntervalsByDevice:a1[12] aggregatedWebUsageIntervalsByDevice:a1[13] categoryByWebDomain:a1[14] timeZoneByDevice:a1[15] lastEventDateByDevice:a1[16]];
    }
  }
}

uint64_t __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _updateWebUsageWithInterval:a2 webDomain:a3 trustedWebUsage:a5 deviceIdentifier:@"LocalDevice" event:0 webUsageIntervalsByDevice:*(void *)(a1 + 40) categoryUsageIntervalsByDevice:*(void *)(a1 + 48) aggregatedApplicationUsageIntervalsByDevice:*(void *)(a1 + 56) aggregatedWebUsageIntervalsByDevice:*(void *)(a1 + 64) categoryByWebDomain:*(void *)(a1 + 72) timeZoneByDevice:*(void *)(a1 + 80) lastEventDateByDevice:*(void *)(a1 + 88)];
}

uint64_t __250__USUsageQuerying__computeWebUsageWithEvents_timeZoneByDevice_lastEventDateByDevice_categoryUsageIntervalsByDevice_aggregatedApplicationUsageIntervalsByDevice_aggregatedWebUsageIntervalsByDevice_categoryByWebDomain_partition_referenceDate_focalOnly___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5) {
    return [*(id *)(result + 32) _updateWebUsageWithInterval:a2 webDomain:a5 trustedWebUsage:a6 deviceIdentifier:@"LocalDevice" event:0 webUsageIntervalsByDevice:*(void *)(result + 40) categoryUsageIntervalsByDevice:*(void *)(result + 48) aggregatedApplicationUsageIntervalsByDevice:*(void *)(result + 56) aggregatedWebUsageIntervalsByDevice:*(void *)(result + 64) categoryByWebDomain:*(void *)(result + 72) timeZoneByDevice:*(void *)(result + 80) lastEventDateByDevice:*(void *)(result + 88)];
  }
  return result;
}

- (void)_updateWebUsageWithInterval:(id)a3 webDomain:(id)a4 trustedWebUsage:(BOOL)a5 deviceIdentifier:(id)a6 event:(id)a7 webUsageIntervalsByDevice:(id)a8 categoryUsageIntervalsByDevice:(id)a9 aggregatedApplicationUsageIntervalsByDevice:(id)a10 aggregatedWebUsageIntervalsByDevice:(id)a11 categoryByWebDomain:(id)a12 timeZoneByDevice:(id)a13 lastEventDateByDevice:(id)a14
{
  BOOL v17 = a5;
  uint64_t v368 = *MEMORY[0x263EF8340];
  id v354 = a3;
  id v19 = a4;
  id v20 = a6;
  id v340 = a7;
  id v21 = a8;
  id v346 = a9;
  *((void *)&v347 + 1) = a10;
  *(void *)&long long v347 = a11;
  id v341 = a12;
  id v345 = a13;
  id v344 = a14;
  v342 = v19;
  BOOL v337 = v17;
  id v22 = +[USTrustIdentifier identifierWithIdentifier:v19 trusted:v17];
  id v23 = v21;
  id v24 = v20;
  id v25 = v22;
  id v26 = v354;
  id v27 = [v23 objectForKeyedSubscript:v24];
  id v343 = v24;
  if (v27)
  {
    id v28 = v27;
    id v29 = v25;
    id v30 = v26;
    id v31 = [v28 objectForKeyedSubscript:v29];
    if (v31)
    {
      id v32 = v31;
      id v352 = v30;
      id v33 = v30;
      long long v363 = 0u;
      long long v364 = 0u;
      long long v365 = 0u;
      long long v366 = 0u;
      id v34 = v32;
      id v35 = (void *)[v34 countByEnumeratingWithState:&v363 objects:v367 count:16];
      if (v35)
      {
        id v319 = v29;
        id v326 = v28;
        id v332 = v26;
        id v348 = v25;
        id v350 = v23;
        uint64_t v36 = 0;
        uint64_t v37 = *(void *)v364;
        id v311 = v33;
        do
        {
          id v38 = 0;
          v355 = v35;
          do
          {
            if (*(void *)v364 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v363 + 1) + 8 * (void)v38);
            if ([v39 intersectsDateInterval:v33])
            {
              id v40 = v34;
              id v41 = [v39 startDate];
              id v42 = [v33 startDate];
              id v43 = [v41 earlierDate:v42];

              long long v44 = [v39 endDate];
              [v33 endDate];
              v46 = id v45 = (void *)v36;
              long long v47 = [v44 laterDate:v46];

              uint64_t v36 = (uint64_t)v45;
              uint64_t v48 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v43 endDate:v47];

              if (v45) {
                [v45 addObject:v39];
              }
              else {
                uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v39, 0);
              }

              id v33 = (id)v48;
              id v34 = v40;
              id v35 = v355;
            }
            id v38 = (char *)v38 + 1;
          }
          while (v35 != v38);
          id v35 = (void *)[v34 countByEnumeratingWithState:&v363 objects:v367 count:16];
        }
        while (v35);

        if (v36)
        {
          [v34 removeObjectsInArray:v36];
          id v23 = v350;
          id v35 = (void *)v36;
        }
        else
        {
          id v35 = 0;
          id v23 = v350;
        }
        id v25 = v348;
        id v28 = v326;
        id v26 = v332;
        id v50 = v311;
        id v29 = v319;
      }
      else
      {

        id v50 = v33;
      }
      [v34 addObject:v33];

      id v24 = v343;
      id v30 = v352;
    }
    else
    {
      id v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v30, 0);
      [v28 setObject:v34 forKeyedSubscript:v29];
    }
  }
  else
  {
    long long v49 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v26, 0);
    id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v49, v25, 0);
    [v23 setObject:v28 forKeyedSubscript:v24];
  }
  id v51 = v23;
  id v52 = v25;
  id v53 = v26;
  id v54 = [v51 objectForKeyedSubscript:@"AllDevices"];
  id v349 = v53;
  id v351 = v51;
  id v353 = v52;
  if (v54)
  {
    id v55 = v54;
    id v56 = v52;
    id v57 = v53;
    id v58 = [v55 objectForKeyedSubscript:v56];
    if (v58)
    {
      id v59 = v58;
      id v60 = v57;
      long long v363 = 0u;
      long long v364 = 0u;
      long long v365 = 0u;
      long long v366 = 0u;
      id v61 = v59;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v363 objects:v367 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        id v320 = v57;
        id v327 = v56;
        id v333 = v55;
        v356 = 0;
        uint64_t v64 = *(void *)v364;
        id v312 = v60;
        id v52 = v353;
        id v65 = v61;
        do
        {
          for (uint64_t i = 0; i != v63; ++i)
          {
            if (*(void *)v364 != v64) {
              objc_enumerationMutation(v65);
            }
            id v67 = *(void **)(*((void *)&v363 + 1) + 8 * i);
            if ([v67 intersectsDateInterval:v60])
            {
              id v68 = [v67 startDate];
              id v69 = [v60 startDate];
              id v70 = [v68 earlierDate:v69];

              double v71 = [v67 endDate];
              id v72 = [v60 endDate];
              id v73 = [v71 laterDate:v72];

              uint64_t v74 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v70 endDate:v73];
              if (v356) {
                [v356 addObject:v67];
              }
              else {
                v356 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v67, 0);
              }

              id v60 = (id)v74;
              id v51 = v351;
              id v52 = v353;
            }
          }
          uint64_t v63 = [v65 countByEnumeratingWithState:&v363 objects:v367 count:16];
        }
        while (v63);

        id v75 = v356;
        if (v356) {
          [v65 removeObjectsInArray:v356];
        }
        id v24 = v343;
        id v56 = v327;
        id v55 = v333;
        id v61 = v65;
        id v76 = v312;
        id v57 = v320;
      }
      else
      {

        id v75 = 0;
        id v76 = v60;
        id v24 = v343;
        id v52 = v353;
      }
      [v61 addObject:v60];

      id v53 = v349;
    }
    else
    {
      id v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v57, 0);
      [v55 setObject:v61 forKeyedSubscript:v56];
    }

    id v77 = v55;
  }
  else
  {
    id v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v53, 0);
    id v77 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v55, v52, 0);
    [v51 setObject:v77 forKeyedSubscript:@"AllDevices"];
  }

  if (v346)
  {
    id v78 = [v341 objectForKeyedSubscript:v342];
    uint64_t v79 = [v78 identifier];
    id v80 = (void *)v79;
    id v81 = (void *)*MEMORY[0x263F31838];
    if (v79) {
      id v81 = (void *)v79;
    }
    id v82 = v81;

    id v83 = v346;
    id v84 = v24;
    id v85 = v82;
    id v86 = v53;
    id v87 = [v83 objectForKeyedSubscript:v84];
    if (v87)
    {
      id v334 = v84;
      id v88 = v87;
      id v89 = v85;
      id v90 = v86;
      id v91 = [v88 objectForKeyedSubscript:v89];
      if (v91)
      {
        id v321 = v89;
        id v328 = v88;
        id v92 = v91;
        id v313 = v90;
        id v93 = v90;
        long long v363 = 0u;
        long long v364 = 0u;
        long long v365 = 0u;
        long long v366 = 0u;
        id v94 = v92;
        id v95 = (void *)[v94 countByEnumeratingWithState:&v363 objects:v367 count:16];
        if (v95)
        {
          id v293 = v86;
          id v299 = v85;
          id v305 = v83;
          v357 = 0;
          uint64_t v96 = *(void *)v364;
          id v288 = v93;
          id v97 = v94;
          do
          {
            for (uint64_t j = 0; j != v95; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v364 != v96) {
                objc_enumerationMutation(v97);
              }
              id v99 = *(void **)(*((void *)&v363 + 1) + 8 * (void)j);
              if ([v99 intersectsDateInterval:v93])
              {
                uint64_t v100 = [v99 startDate];
                uint64_t v101 = [v93 startDate];
                uint64_t v102 = [v100 earlierDate:v101];

                id v103 = [v99 endDate];
                uint64_t v104 = [v93 endDate];
                id v105 = [v103 laterDate:v104];

                uint64_t v106 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v102 endDate:v105];
                if (v357) {
                  [v357 addObject:v99];
                }
                else {
                  v357 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v99, 0);
                }
                id v53 = v349;

                id v93 = (id)v106;
              }
            }
            id v95 = (void *)[v97 countByEnumeratingWithState:&v363 objects:v367 count:16];
          }
          while (v95);

          id v95 = v357;
          if (v357) {
            [v97 removeObjectsInArray:v357];
          }
          id v52 = v353;
          id v85 = v299;
          id v83 = v305;
          id v94 = v97;
          id v107 = v288;
          id v86 = v293;
        }
        else
        {

          id v107 = v93;
          id v52 = v353;
        }
        [v94 addObject:v93];

        id v51 = v351;
        id v89 = v321;
        id v88 = v328;
        long long v110 = v313;
      }
      else
      {
        id v94 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v90, 0);
        [v88 setObject:v94 forKeyedSubscript:v89];
        long long v110 = v90;
        id v52 = v353;
      }

      id v108 = v88;
      uint64_t v109 = v334;
    }
    else
    {
      id v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v86, 0);
      id v108 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v88, v85, 0);
      [v83 setObject:v108 forKeyedSubscript:v84];
      uint64_t v109 = v84;
      id v52 = v353;
    }

    id v111 = v83;
    id v112 = v85;
    id v113 = v86;
    uint64_t v114 = [v111 objectForKeyedSubscript:@"AllDevices"];
    if (v114)
    {
      id v115 = v114;
      id v116 = v112;
      id v117 = v113;
      id v118 = [v115 objectForKeyedSubscript:v116];
      if (v118)
      {
        id v306 = v116;
        id v314 = v115;
        id v322 = v113;
        id v329 = v112;
        id v335 = v111;
        id v119 = v118;
        id v300 = v117;
        id v120 = v117;
        long long v363 = 0u;
        long long v364 = 0u;
        long long v365 = 0u;
        long long v366 = 0u;
        id v121 = v119;
        uint64_t v122 = [v121 countByEnumeratingWithState:&v363 objects:v367 count:16];
        if (v122)
        {
          uint64_t v123 = v122;
          v358 = 0;
          uint64_t v124 = *(void *)v364;
          id v294 = v120;
          do
          {
            for (uint64_t k = 0; k != v123; ++k)
            {
              if (*(void *)v364 != v124) {
                objc_enumerationMutation(v121);
              }
              v126 = *(void **)(*((void *)&v363 + 1) + 8 * k);
              if ([v126 intersectsDateInterval:v120])
              {
                id v127 = [v126 startDate];
                id v128 = [v120 startDate];
                id v129 = [v127 earlierDate:v128];

                uint64_t v130 = [v126 endDate];
                uint64_t v131 = [v120 endDate];
                id v132 = [v130 laterDate:v131];

                uint64_t v133 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v129 endDate:v132];
                if (v358) {
                  [v358 addObject:v126];
                }
                else {
                  v358 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v126, 0);
                }

                id v120 = (id)v133;
              }
            }
            uint64_t v123 = [v121 countByEnumeratingWithState:&v363 objects:v367 count:16];
          }
          while (v123);

          id v53 = v349;
          id v134 = v358;
          if (v358) {
            [v121 removeObjectsInArray:v358];
          }
          id v51 = v351;
          id v52 = v353;
          uint64_t v135 = v294;
        }
        else
        {

          id v134 = 0;
          uint64_t v135 = v120;
          id v51 = v351;
        }
        [v121 addObject:v120];

        id v112 = v329;
        id v111 = v335;
        id v115 = v314;
        id v113 = v322;
        uint64_t v137 = v121;
        id v117 = v300;
        id v116 = v306;
      }
      else
      {
        uint64_t v137 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v117, 0);
        [v115 setObject:v137 forKeyedSubscript:v116];
      }

      id v136 = v115;
    }
    else
    {
      id v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v113, 0);
      id v136 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v115, v112, 0);
      [v111 setObject:v136 forKeyedSubscript:@"AllDevices"];
    }
    id v24 = v343;
  }
  if (v347 != 0)
  {
    uint64_t v138 = [v341 objectForKeyedSubscript:v342];
    uint64_t v139 = v138;
    if (*((void *)&v347 + 1))
    {
      uint64_t v140 = [v138 canonicalBundleIdentifier];
      id v141 = (void *)v140;
      if (v140)
      {
        uint64_t v330 = v139;
        v336 = (void *)v140;
        id v142 = +[USTrustIdentifier identifierWithIdentifier:v140 trusted:v337];
        id v143 = *((id *)&v347 + 1);
        id v144 = v24;
        id v145 = v142;
        id v146 = v53;
        id v147 = [v143 objectForKeyedSubscript:v144];
        if (v147)
        {
          id v148 = v147;
          id v149 = v145;
          id v150 = v146;
          id v151 = [v148 objectForKeyedSubscript:v149];
          id v323 = v145;
          if (v151)
          {
            id v289 = v149;
            id v295 = v148;
            id v301 = v144;
            id v307 = v146;
            id v315 = v143;
            id v152 = v151;
            id v153 = v150;
            long long v363 = 0u;
            long long v364 = 0u;
            long long v365 = 0u;
            long long v366 = 0u;
            id v154 = v152;
            uint64_t v155 = [v154 countByEnumeratingWithState:&v363 objects:v367 count:16];
            id v284 = v150;
            if (v155)
            {
              uint64_t v156 = v155;
              v359 = 0;
              uint64_t v157 = *(void *)v364;
              id v282 = v153;
              do
              {
                for (uint64_t m = 0; m != v156; ++m)
                {
                  if (*(void *)v364 != v157) {
                    objc_enumerationMutation(v154);
                  }
                  long long v159 = *(void **)(*((void *)&v363 + 1) + 8 * m);
                  if ([v159 intersectsDateInterval:v153])
                  {
                    id v160 = v154;
                    id v161 = [v159 startDate];
                    id v162 = [v153 startDate];
                    uint64_t v163 = [v161 earlierDate:v162];

                    uint64_t v164 = [v159 endDate];
                    uint64_t v165 = [v153 endDate];
                    long long v166 = [v164 laterDate:v165];

                    uint64_t v167 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v163 endDate:v166];
                    if (v359) {
                      [v359 addObject:v159];
                    }
                    else {
                      v359 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v159, 0);
                    }
                    id v53 = v349;

                    id v153 = (id)v167;
                    id v154 = v160;
                  }
                }
                uint64_t v156 = [v154 countByEnumeratingWithState:&v363 objects:v367 count:16];
              }
              while (v156);

              long long v168 = v359;
              if (v359) {
                [v154 removeObjectsInArray:v359];
              }
              id v24 = v343;
              id v149 = v289;
              id v169 = v282;
            }
            else
            {

              long long v168 = 0;
              id v169 = v153;
              id v24 = v343;
              id v149 = v289;
            }
            [v154 addObject:v153];

            id v51 = v351;
            id v146 = v307;
            id v143 = v315;
            id v148 = v295;
            id v171 = v301;
            id v150 = v284;
          }
          else
          {
            id v171 = v144;
            id v154 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v150, 0);
            [v148 setObject:v154 forKeyedSubscript:v149];
          }

          id v170 = v148;
          id v144 = v171;
          id v145 = v323;
        }
        else
        {
          id v148 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v146, 0);
          id v170 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v148, v145, 0);
          [v143 setObject:v170 forKeyedSubscript:v144];
        }

        id v172 = v143;
        id v173 = v145;
        id v174 = v146;
        v175 = [v172 objectForKeyedSubscript:@"AllDevices"];
        if (v175)
        {
          id v176 = v175;
          id v177 = v173;
          id v178 = v174;
          uint64_t v179 = [v176 objectForKeyedSubscript:v177];
          id v316 = v172;
          if (v179)
          {
            id v296 = v177;
            id v302 = v176;
            id v308 = v174;
            id v324 = v173;
            id v180 = v179;
            id v290 = v178;
            id v181 = v178;
            long long v363 = 0u;
            long long v364 = 0u;
            long long v365 = 0u;
            long long v366 = 0u;
            id v182 = v180;
            id v183 = (void *)[v182 countByEnumeratingWithState:&v363 objects:v367 count:16];
            if (v183)
            {
              uint64_t v184 = 0;
              uint64_t v185 = *(void *)v364;
              id v285 = v181;
              do
              {
                id v186 = 0;
                v360 = v183;
                do
                {
                  if (*(void *)v364 != v185) {
                    objc_enumerationMutation(v182);
                  }
                  id v187 = *(void **)(*((void *)&v363 + 1) + 8 * (void)v186);
                  if ([v187 intersectsDateInterval:v181])
                  {
                    id v188 = [v187 startDate];
                    v189 = [v181 startDate];
                    id v190 = [v188 earlierDate:v189];

                    id v191 = [v187 endDate];
                    [v181 endDate];
                    v193 = id v192 = (void *)v184;
                    uint64_t v194 = [v191 laterDate:v193];

                    uint64_t v184 = (uint64_t)v192;
                    uint64_t v195 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v190 endDate:v194];

                    if (v192) {
                      [v192 addObject:v187];
                    }
                    else {
                      uint64_t v184 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v187, 0);
                    }

                    id v181 = (id)v195;
                    id v183 = v360;
                  }
                  id v186 = (char *)v186 + 1;
                }
                while (v183 != v186);
                id v183 = (void *)[v182 countByEnumeratingWithState:&v363 objects:v367 count:16];
              }
              while (v183);

              id v52 = v353;
              if (v184)
              {
                [v182 removeObjectsInArray:v184];
                id v53 = v349;
                id v51 = v351;
                id v183 = (void *)v184;
              }
              else
              {
                id v183 = 0;
                id v53 = v349;
                id v51 = v351;
              }
              id v199 = v285;
            }
            else
            {

              id v199 = v181;
              id v51 = v351;
              id v52 = v353;
            }
            [v182 addObject:v181];

            id v24 = v343;
            id v173 = v324;
            id v176 = v302;
            id v174 = v308;
            v198 = v182;
            id v178 = v290;
            id v177 = v296;
          }
          else
          {
            v198 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v178, 0);
            [v176 setObject:v198 forKeyedSubscript:v177];
            id v52 = v353;
          }

          uint64_t v196 = v176;
          uint64_t v197 = v316;
        }
        else
        {
          id v176 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v174, 0);
          uint64_t v196 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v176, v173, 0);
          [v172 setObject:v196 forKeyedSubscript:@"AllDevices"];
          uint64_t v197 = v172;
          id v52 = v353;
        }

        uint64_t v139 = v330;
        id v141 = v336;
      }
    }
    else
    {
      id v141 = 0;
    }
    if ((void)v347 && !v141)
    {
      uint64_t v200 = [v139 primaryWebDomain];
      v201 = (void *)v200;
      if (v200)
      {
        uint64_t v325 = (void *)v200;
        v331 = v139;
        v202 = +[USTrustIdentifier identifierWithIdentifier:v200 trusted:v337];
        id v203 = (id)v347;
        id v204 = v24;
        id v205 = v202;
        id v206 = v53;
        v207 = [v203 objectForKeyedSubscript:v204];
        if (v207)
        {
          id v208 = v207;
          id v209 = v205;
          id v210 = v206;
          id v211 = [v208 objectForKeyedSubscript:v209];
          id v338 = v205;
          if (v211)
          {
            id v286 = v209;
            id v297 = v208;
            id v303 = v204;
            id v309 = v206;
            id v317 = v203;
            id v212 = v211;
            id v213 = v210;
            long long v363 = 0u;
            long long v364 = 0u;
            long long v365 = 0u;
            long long v366 = 0u;
            id v214 = v212;
            uint64_t v215 = [v214 countByEnumeratingWithState:&v363 objects:v367 count:16];
            id v291 = v210;
            if (v215)
            {
              uint64_t v216 = v215;
              v361 = 0;
              uint64_t v217 = *(void *)v364;
              id v283 = v213;
              do
              {
                for (uint64_t n = 0; n != v216; ++n)
                {
                  if (*(void *)v364 != v217) {
                    objc_enumerationMutation(v214);
                  }
                  v219 = *(void **)(*((void *)&v363 + 1) + 8 * n);
                  if ([v219 intersectsDateInterval:v213])
                  {
                    id v220 = v214;
                    id v221 = [v219 startDate];
                    id v222 = [v213 startDate];
                    id v223 = [v221 earlierDate:v222];

                    id v224 = [v219 endDate];
                    v225 = [v213 endDate];
                    v226 = [v224 laterDate:v225];

                    uint64_t v227 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v223 endDate:v226];
                    if (v361) {
                      [v361 addObject:v219];
                    }
                    else {
                      v361 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v219, 0);
                    }

                    id v213 = (id)v227;
                    id v53 = v349;
                    id v214 = v220;
                  }
                }
                uint64_t v216 = [v214 countByEnumeratingWithState:&v363 objects:v367 count:16];
              }
              while (v216);

              v228 = v361;
              if (v361) {
                [v214 removeObjectsInArray:v361];
              }
              id v24 = v343;
              v229 = v283;
              id v209 = v286;
            }
            else
            {

              v228 = 0;
              v229 = v213;
              id v24 = v343;
              id v209 = v286;
            }
            [v214 addObject:v213];

            id v51 = v351;
            id v206 = v309;
            id v203 = v317;
            id v208 = v297;
            id v231 = v303;
            id v210 = v291;
          }
          else
          {
            id v231 = v204;
            id v214 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v210, 0);
            [v208 setObject:v214 forKeyedSubscript:v209];
          }

          v230 = v208;
          id v204 = v231;
          id v205 = v338;
        }
        else
        {
          id v208 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v206, 0);
          v230 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v208, v205, 0);
          [v203 setObject:v230 forKeyedSubscript:v204];
        }

        id v232 = v203;
        id v233 = v205;
        id v234 = v206;
        id v235 = [v232 objectForKeyedSubscript:@"AllDevices"];
        if (v235)
        {
          id v236 = v235;
          id v237 = v233;
          id v238 = v234;
          id v239 = [v236 objectForKeyedSubscript:v237];
          id v318 = v232;
          if (v239)
          {
            id v298 = v237;
            id v304 = v236;
            id v310 = v234;
            id v339 = v233;
            id v240 = v239;
            id v292 = v238;
            id v241 = v238;
            long long v363 = 0u;
            long long v364 = 0u;
            long long v365 = 0u;
            long long v366 = 0u;
            id v242 = v240;
            uint64_t v243 = [v242 countByEnumeratingWithState:&v363 objects:v367 count:16];
            if (v243)
            {
              uint64_t v244 = v243;
              uint64_t v245 = 0;
              uint64_t v246 = *(void *)v364;
              id v287 = v241;
              do
              {
                uint64_t v247 = 0;
                uint64_t v362 = v244;
                do
                {
                  if (*(void *)v364 != v246) {
                    objc_enumerationMutation(v242);
                  }
                  v248 = *(void **)(*((void *)&v363 + 1) + 8 * v247);
                  if ([v248 intersectsDateInterval:v241])
                  {
                    v249 = [v248 startDate];
                    v250 = [v241 startDate];
                    v251 = [v249 earlierDate:v250];

                    v252 = [v248 endDate];
                    [v241 endDate];
                    v254 = v253 = v245;
                    uint64_t v255 = [v252 laterDate:v254];

                    uint64_t v245 = v253;
                    uint64_t v256 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v251 endDate:v255];

                    if (v253) {
                      [v253 addObject:v248];
                    }
                    else {
                      uint64_t v245 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v248, 0);
                    }

                    id v241 = (id)v256;
                    uint64_t v244 = v362;
                  }
                  ++v247;
                }
                while (v244 != v247);
                uint64_t v244 = [v242 countByEnumeratingWithState:&v363 objects:v367 count:16];
              }
              while (v244);

              id v53 = v349;
              id v52 = v353;
              if (v245) {
                [v242 removeObjectsInArray:v245];
              }
              id v51 = v351;
              v257 = v287;
            }
            else
            {

              uint64_t v245 = 0;
              v257 = v241;
              id v51 = v351;
              id v52 = v353;
            }
            [v242 addObject:v241];

            id v24 = v343;
            id v233 = v339;
            id v236 = v304;
            id v234 = v310;
            id v260 = v242;
            id v238 = v292;
            id v237 = v298;
          }
          else
          {
            id v260 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v238, 0);
            [v236 setObject:v260 forKeyedSubscript:v237];
            id v52 = v353;
          }

          v258 = v236;
          id v259 = v318;
        }
        else
        {
          id v236 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v234, 0);
          v258 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v236, v233, 0);
          [v232 setObject:v258 forKeyedSubscript:@"AllDevices"];
          id v259 = v232;
          id v52 = v353;
        }

        v201 = v325;
        uint64_t v139 = v331;
      }

      id v141 = 0;
    }
  }
  if (v345 && v344)
  {
    id v261 = v345;
    id v262 = v344;
    id v263 = v340;
    id v264 = v53;
    id v265 = v24;
    id v266 = [v261 objectForKeyedSubscript:v265];

    if (!v266)
    {
      id v267 = [v263 timeZone];
      if (v267)
      {
        [v261 setObject:v267 forKeyedSubscript:v265];
      }
      else
      {
        id v268 = [MEMORY[0x263EFFA18] localTimeZone];
        [v261 setObject:v268 forKeyedSubscript:v265];
      }
    }
    id v269 = [v264 endDate];
    id v270 = [v262 objectForKeyedSubscript:v265];
    id v271 = v270;
    if (!v270 || [v270 compare:v269] == -1) {
      [v262 setObject:v269 forKeyedSubscript:v265];
    }

    id v272 = v261;
    id v273 = v262;
    id v274 = v263;
    id v275 = v264;
    id v276 = [v272 objectForKeyedSubscript:@"AllDevices"];

    id v24 = v343;
    if (!v276)
    {
      id v277 = [v274 timeZone];
      if (v277)
      {
        [v272 setObject:v277 forKeyedSubscript:@"AllDevices"];
      }
      else
      {
        id v278 = [MEMORY[0x263EFFA18] localTimeZone];
        [v272 setObject:v278 forKeyedSubscript:@"AllDevices"];
      }
    }
    id v279 = [v275 endDate];
    id v280 = [v273 objectForKeyedSubscript:@"AllDevices"];
    id v281 = v280;
    if (!v280 || [v280 compare:v279] == -1) {
      [v273 setObject:v279 forKeyedSubscript:@"AllDevices"];
    }

    id v52 = v353;
  }
}

- (void)_enumerateCurrentWebUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 focalOnly:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v48 = a4;
  id v41 = (void (**)(id, void *, void *, void *, uint64_t))a6;
  id v10 = [MEMORY[0x263F351D0] keyPathForAppWebUsageDataDictionaries];
  id v11 = [(USUsageQuerying *)self context];
  id v12 = [v11 objectForKeyedSubscript:v10];
  if (v12)
  {
    id v38 = v11;
    id v39 = v10;
    long long v47 = [MEMORY[0x263F351D0] appWebUsageWebDomain];
    long long v46 = [MEMORY[0x263F351D0] appWebUsageStartDate];
    id v45 = [MEMORY[0x263F351D0] isUsageTrusted];
    id v40 = [MEMORY[0x263F351D0] appWebUsageBundleID];
    id v13 = [MEMORY[0x263F351D0] appWebUsageType];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v37 = v12;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v54;
      BOOL v44 = v7;
      uint64_t v42 = *(void *)v54;
      id v43 = v13;
      do
      {
        uint64_t v17 = 0;
        uint64_t v50 = v15;
        do
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v53 + 1) + 8 * v17);
          id v19 = [v18 objectForKeyedSubscript:v13];
          uint64_t v20 = [v19 integerValue];
          uint64_t v21 = [v19 integerValue];
          BOOL v22 = v20 == 1;
          if (!v7) {
            BOOL v22 = v20 == 1 || v21 == 0;
          }
          if (v22)
          {
            id v52 = [v18 objectForKeyedSubscript:v47];
            id v23 = [v18 objectForKeyedSubscript:v46];
            uint64_t v24 = [v18 objectForKeyedSubscript:v45];
            id v25 = (void *)v24;
            id v26 = (void *)MEMORY[0x263EFFA88];
            if (v24) {
              id v26 = (void *)v24;
            }
            id v27 = v26;

            id v28 = v49;
            id v29 = v23;
            id v30 = v48;
            id v31 = [v28 startDate];
            id v32 = [v31 laterDate:v29];

            id v33 = [v28 endDate];
            id v34 = [v33 earlierDate:v30];

            if ([v32 compare:v34] == 1) {
              id v35 = 0;
            }
            else {
              id v35 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v32 endDate:v34];
            }

            if (v35)
            {
              uint64_t v36 = [v18 objectForKeyedSubscript:v40];
              v41[2](v41, v35, v52, v36, [v27 BOOLValue]);
            }
            BOOL v7 = v44;
            uint64_t v16 = v42;
            id v13 = v43;
            uint64_t v15 = v50;
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v15);
    }

    id v11 = v38;
    id v10 = v39;
    id v12 = v37;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:]();
  }
}

- (void)_computeNowPlayingUsageWithEvents:(id)a3 categoryUsageIntervalsByDevice:(id)a4 timeZoneByDevice:(id)a5 lastEventDateByDevice:(id)a6 partition:(id)a7 referenceDate:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v24 = a6;
  id v16 = a8;
  id v17 = a7;
  id v18 = a3;
  id v19 = [v17 endDate];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __147__USUsageQuerying__computeNowPlayingUsageWithEvents_categoryUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke;
  v25[3] = &unk_26431E370;
  v25[4] = self;
  id v20 = v14;
  id v26 = v20;
  id v21 = v15;
  id v27 = v21;
  id v22 = v24;
  id v28 = v22;
  [(USUsageQuerying *)self _enumerateEvents:v18 intervalEndDate:v19 block:v25];

  id v23 = [(USUsageQuerying *)self _currentNowPlayingUsageIntervalsDuringInterval:v17 referenceDate:v16];

  if (v23) {
    [(USUsageQuerying *)self _updateNowPlayingUsageWithInterval:v23 event:0 deviceIdentifier:@"LocalDevice" categoryUsageIntervalsByDevice:v20 timeZoneByDevice:v21 lastEventDateByDevice:v22];
  }
}

void __147__USUsageQuerying__computeNowPlayingUsageWithEvents_categoryUsageIntervalsByDevice_timeZoneByDevice_lastEventDateByDevice_partition_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 source];
  uint64_t v5 = [v4 syncDeviceID];
  id v6 = (void *)v5;
  BOOL v7 = @"LocalDevice";
  if (v5) {
    BOOL v7 = (__CFString *)v5;
  }
  id v8 = v7;

  id v9 = objc_alloc(MEMORY[0x263F08798]);
  id v10 = [v3 startDate];
  id v11 = [v3 endDate];
  id v12 = (id)[v9 initWithStartDate:v10 endDate:v11];

  [*(id *)(a1 + 32) _updateNowPlayingUsageWithInterval:v12 event:v3 deviceIdentifier:v8 categoryUsageIntervalsByDevice:*(void *)(a1 + 40) timeZoneByDevice:*(void *)(a1 + 48) lastEventDateByDevice:*(void *)(a1 + 56)];
}

- (void)_updateNowPlayingUsageWithInterval:(id)a3 event:(id)a4 deviceIdentifier:(id)a5 categoryUsageIntervalsByDevice:(id)a6 timeZoneByDevice:(id)a7 lastEventDateByDevice:(id)a8
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v113 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v15)
  {
    id v105 = v17;
    id v18 = (void *)*MEMORY[0x263F31820];
    id v19 = v13;
    id v20 = v15;
    id v21 = v14;
    id v22 = v18;
    uint64_t v106 = v19;
    id v23 = v19;
    id v24 = [v20 objectForKeyedSubscript:v21];
    if (v24)
    {
      id v25 = v24;
      id v26 = v23;
      id v27 = [v25 objectForKeyedSubscript:v22];
      if (v27)
      {
        id v99 = v22;
        id v101 = v20;
        id v103 = v14;
        id v28 = v27;
        id v29 = v26;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        uint64_t v30 = [v28 countByEnumeratingWithState:&v122 objects:v126 count:16];
        id v98 = v26;
        if (v30)
        {
          uint64_t v31 = v30;
          id v107 = v16;
          id v110 = v15;
          id obj = 0;
          uint64_t v32 = *(void *)v123;
          uint64_t v114 = *(void *)v123;
          id v116 = v28;
          do
          {
            uint64_t v33 = 0;
            uint64_t v118 = v31;
            do
            {
              if (*(void *)v123 != v32) {
                objc_enumerationMutation(v28);
              }
              id v34 = *(void **)(*((void *)&v122 + 1) + 8 * v33);
              if ([v34 intersectsDateInterval:v29])
              {
                id v35 = v25;
                id v36 = v21;
                id v37 = v23;
                id v38 = [v34 startDate];
                id v39 = [v29 startDate];
                id v40 = [v38 earlierDate:v39];

                id v41 = [v34 endDate];
                uint64_t v42 = [v29 endDate];
                id v43 = [v41 laterDate:v42];

                uint64_t v44 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v40 endDate:v43];
                if (obj) {
                  [obj addObject:v34];
                }
                else {
                  id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v34, 0);
                }
                id v23 = v37;

                id v29 = (id)v44;
                id v21 = v36;
                id v25 = v35;
                uint64_t v32 = v114;
                id v28 = v116;
                uint64_t v31 = v118;
              }
              ++v33;
            }
            while (v31 != v33);
            uint64_t v31 = [v28 countByEnumeratingWithState:&v122 objects:v126 count:16];
          }
          while (v31);
          id v45 = obj;
          if (obj) {
            [v28 removeObjectsInArray:obj];
          }
          id v14 = v103;
          id v16 = v107;
          id v15 = v110;
        }
        else
        {
          id v45 = 0;
        }
        [v28 addObject:v29];

        id v22 = v99;
        id v20 = v101;
        id v26 = v98;
      }
      else
      {
        id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v26, 0);
        [v25 setObject:v28 forKeyedSubscript:v22];
      }
    }
    else
    {
      long long v46 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v23, 0);
      id v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v46, v22, 0);
      [v20 setObject:v25 forKeyedSubscript:v21];
    }
    id v47 = v20;
    id v48 = v22;
    id v49 = v23;
    uint64_t v50 = [v47 objectForKeyedSubscript:@"AllDevices"];
    if (v50)
    {
      id v51 = v50;
      id v52 = v49;
      long long v53 = [v51 objectForKeyedSubscript:v48];
      id v13 = v106;
      if (v53)
      {
        id v111 = v15;
        id v104 = v14;
        id v54 = v53;
        id v55 = v52;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id obja = v54;
        uint64_t v56 = [v54 countByEnumeratingWithState:&v122 objects:v126 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          id v100 = v52;
          id v102 = v51;
          id v115 = v49;
          id v117 = v48;
          id v119 = v47;
          id v108 = v16;
          uint64_t v58 = 0;
          uint64_t v59 = *(void *)v123;
          id v60 = obja;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v123 != v59) {
                objc_enumerationMutation(v60);
              }
              uint64_t v62 = *(void **)(*((void *)&v122 + 1) + 8 * i);
              if ([v62 intersectsDateInterval:v55])
              {
                uint64_t v63 = [v62 startDate];
                uint64_t v64 = [v55 startDate];
                id v65 = [v63 earlierDate:v64];

                id v66 = [v62 endDate];
                id v67 = [v55 endDate];
                id v68 = [v66 laterDate:v67];

                uint64_t v69 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v65 endDate:v68];
                if (v58) {
                  [v58 addObject:v62];
                }
                else {
                  uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v62, 0);
                }

                id v55 = (id)v69;
                id v60 = obja;
              }
            }
            uint64_t v57 = [v60 countByEnumeratingWithState:&v122 objects:v126 count:16];
          }
          while (v57);
          if (v58) {
            [v60 removeObjectsInArray:v58];
          }
          id v51 = v102;
          id v14 = v104;
          id v16 = v108;
          id v48 = v117;
          id v47 = v119;
          id v49 = v115;
          id v70 = v60;
          id v52 = v100;
        }
        else
        {
          uint64_t v58 = 0;
          id v70 = obja;
        }
        [v70 addObject:v55];

        id v13 = v106;
        id v15 = v111;
      }
      else
      {
        id v70 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v52, 0);
        [v51 setObject:v70 forKeyedSubscript:v48];
      }

      double v71 = v51;
    }
    else
    {
      id v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v49, 0);
      double v71 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v51, v48, 0);
      [v47 setObject:v71 forKeyedSubscript:@"AllDevices"];
      id v13 = v106;
    }

    id v17 = v105;
  }
  if (v16 && v17)
  {
    id v109 = v16;
    id v112 = v15;
    id v72 = v17;
    id v73 = v16;
    uint64_t v74 = v72;
    id v75 = v72;
    id v76 = v113;
    id v77 = v13;
    id v78 = v14;
    id v79 = v77;
    id v80 = v78;
    id v81 = v78;
    id v82 = [v73 objectForKeyedSubscript:v81];

    if (!v82)
    {
      id v83 = [v76 timeZone];
      if (v83)
      {
        [v73 setObject:v83 forKeyedSubscript:v81];
      }
      else
      {
        id v84 = [MEMORY[0x263EFFA18] localTimeZone];
        [v73 setObject:v84 forKeyedSubscript:v81];
      }
    }
    id v85 = [v79 endDate];
    id v86 = [v75 objectForKeyedSubscript:v81];
    id v87 = v86;
    if (!v86 || [v86 compare:v85] == -1) {
      [v75 setObject:v85 forKeyedSubscript:v81];
    }

    id v88 = v73;
    id v89 = v75;
    id v90 = v76;
    id v91 = v79;
    id v92 = [v88 objectForKeyedSubscript:@"AllDevices"];

    if (!v92)
    {
      id v93 = [v90 timeZone];
      if (v93)
      {
        [v88 setObject:v93 forKeyedSubscript:@"AllDevices"];
      }
      else
      {
        id v94 = [MEMORY[0x263EFFA18] localTimeZone];
        [v88 setObject:v94 forKeyedSubscript:@"AllDevices"];
      }
    }
    id v95 = [v91 endDate];
    uint64_t v96 = [v89 objectForKeyedSubscript:@"AllDevices"];
    id v97 = v96;
    if (!v96 || [v96 compare:v95] == -1) {
      [v89 setObject:v95 forKeyedSubscript:@"AllDevices"];
    }

    id v14 = v80;
    id v16 = v109;
    id v15 = v112;
    id v17 = v74;
  }
}

- (id)_currentNowPlayingUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F351D0] keyPathForNowPlayingDataDictionary];
  id v9 = [(USUsageQuerying *)self context];
  id v10 = [v9 objectForKeyedSubscript:v8];
  id v11 = v10;
  if (v10)
  {
    if (usageContextContainsPlayingQuickLookVideo(v10))
    {
      uint64_t v12 = [v9 lastModifiedDateForContextualKeyPath:v8];
      id v13 = v6;
      id v14 = v7;
      id v15 = [v13 startDate];
      id v21 = (void *)v12;
      id v16 = [v15 laterDate:v12];

      id v17 = [v13 endDate];
      id v18 = [v17 earlierDate:v14];

      if ([v16 compare:v18] == 1) {
        id v19 = 0;
      }
      else {
        id v19 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v16 endDate:v18];
      }

      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:]();
  }
  id v19 = 0;
LABEL_10:

  return v19;
}

- (void)_enumerateCurrentVideoUsageIntervalsDuringInterval:(id)a3 referenceDate:(id)a4 block:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v38 = a4;
  uint64_t v32 = (void (**)(id, void *, id, void *, void *, uint64_t))a5;
  id v8 = [MEMORY[0x263F351D0] keyPathForAppMediaUsageDataDictionaries];
  id v9 = [(USUsageQuerying *)self context];
  id v10 = [v9 objectForKeyedSubscript:v8];
  if (v10)
  {
    id v29 = v9;
    uint64_t v30 = v8;
    id v37 = [MEMORY[0x263F351D0] appMediaUsageBundleID];
    id v36 = [MEMORY[0x263F351D0] appMediaUsageStartDate];
    id v35 = [MEMORY[0x263F351D0] appMediaUsageURL];
    id v34 = [MEMORY[0x263F351D0] isUsageTrusted];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v28 = v10;
    id obj = v10;
    uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v40)
    {
      uint64_t v33 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v41 = [v12 objectForKeyedSubscript:v37];
          id v13 = [v12 objectForKeyedSubscript:v35];
          id v14 = [v13 host];
          id v15 = [v12 objectForKeyedSubscript:v36];
          uint64_t v16 = [v12 objectForKeyedSubscript:v34];
          id v17 = (void *)v16;
          id v18 = (void *)MEMORY[0x263EFFA88];
          if (v16) {
            id v18 = (void *)v16;
          }
          id v19 = v18;

          id v20 = v39;
          id v21 = v15;
          id v22 = v38;
          id v23 = [v20 startDate];
          id v24 = [v23 laterDate:v21];

          id v25 = [v20 endDate];
          id v26 = [v25 earlierDate:v22];

          if ([v24 compare:v26] == 1) {
            id v27 = 0;
          }
          else {
            id v27 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v24 endDate:v26];
          }

          if (v27) {
            v32[2](v32, v27, v21, v41, v14, [v19 BOOLValue]);
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v40);
    }

    id v9 = v29;
    id v8 = v30;
    id v10 = v28;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    -[USUsageQuerying _currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:]();
  }
}

- (id)_computeNotificationsWithEvents:(id)a3 timeZoneByDevice:(id)a4 lastEventDateByDevice:(id)a5 partition:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = [MEMORY[0x263F35008] appBundleID];
  uint64_t v16 = [MEMORY[0x263F350E8] bundleID];
  id v17 = [MEMORY[0x263F35080] isUsageTrusted];
  id v18 = [v12 endDate];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __100__USUsageQuerying__computeNotificationsWithEvents_timeZoneByDevice_lastEventDateByDevice_partition___block_invoke;
  v28[3] = &unk_26431E1E0;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  uint64_t v32 = self;
  id v19 = v14;
  id v33 = v19;
  id v34 = v10;
  id v35 = v11;
  id v20 = v11;
  id v21 = v10;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  [(USUsageQuerying *)self _enumerateEvents:v13 intervalEndDate:v18 block:v28];

  id v25 = v35;
  id v26 = v19;

  return v26;
}

void __100__USUsageQuerying__computeNotificationsWithEvents_timeZoneByDevice_lastEventDateByDevice_partition___block_invoke(void *a1, void *a2)
{
  id v20 = a2;
  id v3 = [v20 metadata];
  uint64_t v4 = [v3 objectForKeyedSubscript:a1[4]];
  uint64_t v5 = [v3 objectForKeyedSubscript:a1[5]];
  id v6 = (void *)v5;
  if (v4) {
    id v7 = v4;
  }
  else {
    id v7 = (void *)v5;
  }
  if (v7)
  {
    id v8 = v7;
    id v9 = [v20 source];
    uint64_t v10 = [v9 syncDeviceID];
    id v11 = (void *)v10;
    id v12 = @"LocalDevice";
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    id v13 = v12;

    uint64_t v14 = [v3 objectForKeyedSubscript:a1[6]];
    id v15 = (void *)v14;
    uint64_t v16 = (void *)MEMORY[0x263EFFA88];
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    id v17 = v16;

    id v18 = (void *)a1[7];
    uint64_t v19 = [v17 BOOLValue];

    [v18 _updateNotificationsWithEvent:v20 bundleIdentifier:v8 trustedNotification:v19 deviceIdentifier:v13 notificationsByDevice:a1[8] timeZoneByDevice:a1[9] lastEventDateByDevice:a1[10]];
  }
}

- (void)_updateNotificationsWithEvent:(id)a3 bundleIdentifier:(id)a4 trustedNotification:(BOOL)a5 deviceIdentifier:(id)a6 notificationsByDevice:(id)a7 timeZoneByDevice:(id)a8 lastEventDateByDevice:(id)a9
{
  BOOL v12 = a5;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  uint64_t v19 = +[USTrustIdentifier identifierWithIdentifier:a4 trusted:v12];
  id v20 = v16;
  id v21 = v15;
  id v22 = [v20 objectForKeyedSubscript:v21];
  if (v22)
  {
    id v23 = v22;
    id v24 = NSNumber;
    id v25 = [v22 objectForKeyedSubscript:v19];
    id v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + 1);
    [v23 setObject:v26 forKeyedSubscript:v19];
  }
  else
  {
    id v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", &unk_26C98EC00, v19, 0);
    [v20 setObject:v23 forKeyedSubscript:v21];
  }

  id v27 = v20;
  id v28 = v19;
  id v29 = [v27 objectForKeyedSubscript:@"AllDevices"];
  if (v29)
  {
    id v30 = v29;
    id v31 = NSNumber;
    uint64_t v32 = [v29 objectForKeyedSubscript:v28];
    id v33 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "unsignedIntegerValue") + 1);
    [v30 setObject:v33 forKeyedSubscript:v28];
  }
  else
  {
    id v30 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", &unk_26C98EC00, v28, 0);
    [v27 setObject:v30 forKeyedSubscript:@"AllDevices"];
  }

  id v34 = objc_alloc(MEMORY[0x263F08798]);
  id v35 = [v14 startDate];
  id v36 = [v14 endDate];
  id v37 = (void *)[v34 initWithStartDate:v35 endDate:v36];

  id v38 = v17;
  id v39 = v18;
  id v40 = v14;
  id v41 = v37;
  id v42 = v21;
  long long v43 = [v38 objectForKeyedSubscript:v42];

  if (!v43)
  {
    long long v44 = [v40 timeZone];
    if (v44)
    {
      [v38 setObject:v44 forKeyedSubscript:v42];
    }
    else
    {
      long long v45 = [MEMORY[0x263EFFA18] localTimeZone];
      [v38 setObject:v45 forKeyedSubscript:v42];
    }
  }
  long long v46 = [v41 endDate];
  uint64_t v47 = [v39 objectForKeyedSubscript:v42];
  id v48 = v47;
  if (!v47 || [v47 compare:v46] == -1) {
    [v39 setObject:v46 forKeyedSubscript:v42];
  }

  id v49 = v38;
  id v50 = v39;
  id v58 = v40;
  id v51 = v41;
  id v52 = [v49 objectForKeyedSubscript:@"AllDevices"];

  if (!v52)
  {
    long long v53 = [v58 timeZone];
    if (v53)
    {
      [v49 setObject:v53 forKeyedSubscript:@"AllDevices"];
    }
    else
    {
      id v54 = [MEMORY[0x263EFFA18] localTimeZone];
      [v49 setObject:v54 forKeyedSubscript:@"AllDevices"];
    }
  }
  id v55 = [v51 endDate];
  uint64_t v56 = [v50 objectForKeyedSubscript:@"AllDevices"];
  uint64_t v57 = v56;
  if (!v56 || [v56 compare:v55] == -1) {
    [v50 setObject:v55 forKeyedSubscript:@"AllDevices"];
  }
}

- (void)_enumerateEvents:(id)a3 intervalEndDate:(id)a4 block:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__USUsageQuerying__enumerateEvents_intervalEndDate_block___block_invoke;
  v14[3] = &unk_26431E398;
  id v15 = v7;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v7;
  [v9 enumerateObjectsUsingBlock:v14];
  [v9 removeObjectsAtIndexes:v12];
}

void __58__USUsageQuerying__enumerateEvents_intervalEndDate_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v13 = v7;
  id v9 = [v7 startDate];
  uint64_t v10 = [v8 compare:v9];

  if (v10 == -1)
  {
    *a4 = 1;
  }
  else
  {
    id v11 = [v13 endDate];
    uint64_t v12 = [v11 compare:*(void *)(a1 + 32)];

    if (v12 == -1) {
      [*(id *)(a1 + 40) addIndex:a3];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (_CDUserContext)context
{
  return (_CDUserContext *)objc_getProperty(self, a2, 8, 1);
}

- (BMCoreDuetStream)duetStream
{
  return (BMCoreDuetStream *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetStream, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (void)queryUsageDuringInterval:(id)a3 partitionInterval:(double)a4 adjustedStartDate:(id)a5 eventStreams:(id)a6 categoryByBundleIdentifier:(id)a7 categoryByWebDomain:(id)a8 usageReportHandler:(id)a9 completionHandler:(id)a10
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v48 = a5;
  id v47 = a6;
  id v45 = a7;
  id v46 = a8;
  id v41 = a9;
  id v42 = a10;
  long long v44 = v16;
  id v17 = [v16 startDate];
  long long v43 = [[USUsageAccumulator alloc] initWithApplicationCategories:v45 webCategories:v46];
  if ([v48 compare:v17] == -1)
  {
    id v40 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v48 endDate:v17 maxEvents:0 lastN:0 reversed:0];
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v47, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v19 = v47;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v72;
      uint64_t v22 = *MEMORY[0x263F29F08];
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v72 != v21) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          id v25 = [v24 identifier];
          char v26 = [v25 isEqualToString:v22];

          if ((v26 & 1) == 0) {
            [v18 addObject:v24];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v20);
    }

    id v27 = [a1 _chronologicalPublisherWithOptions:v40 eventStreams:v18];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke;
    v68[3] = &unk_26431E578;
    id v69 = v40;
    id v70 = a1;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2;
    v65[3] = &unk_26431E5A0;
    id v66 = v43;
    id v67 = v17;
    id v28 = v40;
    id v29 = (id)[v27 sinkWithCompletion:v68 receiveInput:v65];
  }
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__1;
  v63[4] = __Block_byref_object_dispose__1;
  id v64 = (id)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v17 duration:a4];
  id v30 = objc_alloc(MEMORY[0x263F2A8B0]);
  id v31 = [v44 endDate];
  uint64_t v32 = (void *)[v30 initWithStartDate:v17 endDate:v31 maxEvents:0 lastN:0 reversed:0];

  id v33 = [a1 _chronologicalPublisherWithOptions:v32 eventStreams:v47];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_155;
  v56[3] = &unk_26431E5C8;
  uint64_t v57 = v43;
  id v61 = v63;
  id v59 = v41;
  id v62 = a1;
  id v34 = v32;
  id v58 = v34;
  id v35 = v42;
  id v60 = v35;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2_156;
  v50[3] = &unk_26431E5F0;
  id v54 = v63;
  id v36 = v44;
  id v51 = v36;
  id v37 = v57;
  id v52 = v37;
  id v38 = v59;
  id v53 = v38;
  double v55 = a4;
  id v39 = (id)[v33 sinkWithCompletion:v56 receiveInput:v50];

  _Block_object_dispose(v63, 8);
}

uint64_t __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _completion:a2 options:*(void *)(a1 + 32)];
}

uint64_t __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accumulateEvent:a2 timestamp:*(void *)(a1 + 40)];
}

uint64_t __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  [v3 aggregateUsageForInterval:v4 usageReportHandler:v5];
  [*(id *)(a1 + 72) _completion:v6 options:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __184__USUsageQuerying_Biome__queryUsageDuringInterval_partitionInterval_adjustedStartDate_eventStreams_categoryByBundleIdentifier_categoryByWebDomain_usageReportHandler_completionHandler___block_invoke_2_156(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 absoluteTimestamp], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = objc_alloc(MEMORY[0x263EFF910]);
    [v3 timestamp];
    uint64_t v5 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  }

  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startDate];
  if ([v5 compare:v7] == -1)
  {
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) containsDate:v5];

    if (v8)
    {
      if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsDate:v5] & 1) == 0)
      {
        do
        {
          [*(id *)(a1 + 40) aggregateUsageForInterval:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) usageReportHandler:*(void *)(a1 + 48)];
          id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate];
          uint64_t v10 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 duration:*(double *)(a1 + 64)];
          uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;
        }
        while (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsDate:v5]);
      }
      [*(id *)(a1 + 40) accumulateEvent:v3 timestamp:v5];
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v3 eventBody];
    int v14 = 138543362;
    id v15 = v13;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Skipping event that occurred outside of the report interval %{public}@", (uint8_t *)&v14, 0xCu);
  }
LABEL_12:
}

+ (id)_chronologicalPublisherWithOptions:(id)a3 eventStreams:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [v6 firstObject];
    int v8 = [v7 publisherWithOptions:v5];
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v21 = v8;
      id v23 = v5;
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count") - 1);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v22 = v6;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v16 = [v15 identifier];
            id v17 = [v7 identifier];
            char v18 = [v16 isEqualToString:v17];

            if ((v18 & 1) == 0)
            {
              id v19 = [v15 publisherWithOptions:v23];
              [v9 addObject:v19];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v12);
      }

      int v8 = [v21 orderedMergeWithOthers:v9 comparator:&__block_literal_global_0];

      id v6 = v22;
      id v5 = v23;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

uint64_t __74__USUsageQuerying_Biome___chronologicalPublisherWithOptions_eventStreams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = [v6 eventBody];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 absoluteTimestamp], (int v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = objc_alloc(MEMORY[0x263EFF910]);
    [v6 timestamp];
    int v8 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  }

  id v10 = v5;
  uint64_t v11 = [v10 eventBody];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v11 absoluteTimestamp], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = objc_alloc(MEMORY[0x263EFF910]);
    [v10 timestamp];
    uint64_t v12 = objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
  }

  uint64_t v14 = [v8 compare:v12];
  return v14;
}

+ (void)_completion:(id)a3 options:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 state];
  if (v7 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[USUsageQuerying(Biome) _completion:options:]((uint64_t)v6, v5);
    }
  }
  else if (!v7 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Successfully queried Biome for usage reports with options %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Looking up %lu application categories to build a usage report", v1, v2, v3, v4, v5);
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_2_cold_2(uint8_t *buf, unsigned char *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Found notification event with no bundle ID. Skipping event", buf, 2u);
}

void __90__USUsageQuerying_queryUsageDuringInterval_partitionInterval_focalOnly_completionHandler___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Looking up %lu web domain categories to build a usage report", v1, v2, v3, v4, v5);
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Looking up %lu application categories to determine remaining budget time", v1, v2, v3, v4, v5);
}

void __87__USUsageQuerying_queryForApplications_webDomains_categories_interval_focalOnly_error___block_invoke_68_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Looking up %lu web domain categories to determine remaining budget time", v1, v2, v3, v4, v5);
}

void __86__USUsageQuerying_queryForUncategorizedLocalWebUsageDuringInterval_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Looking up %lu web domain categories to report uncategorized web domain usage", v1, v2, v3, v4, v5);
}

- (void)_currentScreenTimeIntervalDuringInterval:usageStartDate:referenceDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218373000, MEMORY[0x263EF8438], v0, "_CDClientContext has no knowledge of %{public}@", v1, v2, v3, v4, v5);
}

@end