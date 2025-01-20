@interface TUCallNotificationManager
- (BOOL)wantsCallNotifications;
- (NSMutableArray)deferredNotificationBlocks;
- (NSNotificationCenter)notificationCenter;
- (TUCallNotificationManager)initWithNotificationCenter:(id)a3;
- (TUCallNotificationManager)initWithNotificationCenter:(id)a3 wantsCallNotifications:(BOOL)a4;
- (void)_postNotificationName:(id)a3 object:(id)a4;
- (void)_postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5;
- (void)answeringMachineStreamTokenChangedForCall:(id)a3;
- (void)audioPropertiesChangedForCall:(id)a3;
- (void)bluetoothAudioFormatChangedForCall:(id)a3;
- (void)callGroupUUIDChangedForCall:(id)a3;
- (void)callRecordingAvailabilityChangedForCall:(id)a3;
- (void)callRecordingStateChanged:(id)a3;
- (void)cameraTypeChangedForCall:(id)a3;
- (void)conferenceParticipantCallsChangedForCallContainer:(id)a3 conferenceParticipantCalls:(id)a4;
- (void)connectedChangedForCall:(id)a3;
- (void)connectingChangedForCall:(id)a3;
- (void)conversationChangedForCall:(id)a3;
- (void)deferNotificationsUntilAfterPerformingBlock:(id)a3;
- (void)destinationIDChangedForCall:(id)a3;
- (void)displayContextChangedForCall:(id)a3;
- (void)endpointOnCurrentDeviceChangedForCall:(id)a3;
- (void)faceTimeIDStatusChangedForCall:(id)a3;
- (void)hardPauseDigitsStateChangedForCall:(id)a3;
- (void)hasBeenRedirectedChangedForCall:(id)a3;
- (void)hasSentInvitationChangedForCall:(id)a3;
- (void)isEmergencyChangedForCall:(id)a3;
- (void)isFailureExpectedChangedForCall:(id)a3;
- (void)isOnHoldChangedForCall:(id)a3;
- (void)isScreeningChangedForCall:(id)a3;
- (void)isSendingAudioChangedForCall:(id)a3;
- (void)isSendingVideoChangedForCall:(id)a3;
- (void)isThirdPartyVideoChangedForCall:(id)a3;
- (void)isUplinkMutedChangedForCall:(id)a3;
- (void)isUsingBasebandChangedForCall:(id)a3;
- (void)localSenderIdentityAccountUUIDChangedForCall:(id)a3;
- (void)mediaPropertiesChangedForCall:(id)a3 remoteAspectRatioDidChange:(BOOL)a4 remoteCameraOrientationDidChange:(BOOL)a5;
- (void)mediaStalledChangedForCall:(id)a3;
- (void)mediaTokensChangedForCall:(id)a3;
- (void)mixesVoiceWithMediaChangedForCall:(id)a3;
- (void)modelChangedForCall:(id)a3;
- (void)needsManualInCallSoundsChangedForCall:(id)a3;
- (void)postNotificationsForCall:(id)a3 afterUpdatesInBlock:(id)a4;
- (void)postNotificationsForCall:(id)a3 usingComparisonCall:(id)a4;
- (void)postNotificationsForCall:(id)a3 usingComparisonCall:(id)a4 afterUpdatesInBlock:(id)a5;
- (void)postNotificationsForCallContainer:(id)a3 afterUpdatesInBlock:(id)a4;
- (void)prefersExclusiveAccessToCellularNetworkChangedForCall:(id)a3;
- (void)providerContextChangedForCall:(id)a3;
- (void)remoteAspectRatioChangedForCall:(id)a3;
- (void)remoteCameraOrientationChangedForCall:(id)a3;
- (void)remoteScreenAspectRatioChangedForCall:(id)a3;
- (void)remoteScreenOrientationChangedForCall:(id)a3;
- (void)remoteUplinkMutedChangedForCall:(id)a3;
- (void)remoteVideoContentRectChangedForCall:(id)a3;
- (void)screeningAnnouncementFinishedChangedForCall:(id)a3;
- (void)setDeferredNotificationBlocks:(id)a3;
- (void)sharingScreenChangedForCall:(id)a3;
- (void)shouldSuppressRingtoneChangedForCall:(id)a3;
- (void)statusChangedForCall:(id)a3;
- (void)supportsDTMFUpdatesChangedForCall:(id)a3;
- (void)supportsEmergencyFallbackChangedForCall:(id)a3;
- (void)supportsTTYWithVoiceChangedForCall:(id)a3;
- (void)ttyTypeChangedForCall:(id)a3;
- (void)videoDegradedChangedForCall:(id)a3;
- (void)videoMirroredChangedForCall:(id)a3;
- (void)videoPausedChangedForCall:(id)a3;
- (void)videoStreamTokenChangedForCall:(id)a3;
- (void)wantsHoldMusicChangedForCall:(id)a3;
@end

@implementation TUCallNotificationManager

- (TUCallNotificationManager)initWithNotificationCenter:(id)a3 wantsCallNotifications:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCallNotificationManager;
  v8 = [(TUCallNotificationManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationCenter, a3);
    v9->_wantsCallNotifications = a4;
  }

  return v9;
}

- (void)deferNotificationsUntilAfterPerformingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(void))a3;
  v6 = [(TUCallNotificationManager *)self deferredNotificationBlocks];

  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"deferredNotificationBlocks was not nil! This means that somehow calls to deferNotificationsUntilAfterPerformingBlock have been nested"];
    NSLog(&cfstr_TuassertionFai.isa, v7);

    if (_TUAssertShouldCrashApplication())
    {
      v8 = [(TUCallNotificationManager *)self deferredNotificationBlocks];

      if (v8)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"TUCallNotificationManager.m" lineNumber:539 description:@"deferredNotificationBlocks was not nil! This means that somehow calls to deferNotificationsUntilAfterPerformingBlock have been nested"];
      }
    }
  }
  v9 = [MEMORY[0x1E4F1CA48] array];
  [(TUCallNotificationManager *)self setDeferredNotificationBlocks:v9];

  v5[2](v5);
  v10 = [(TUCallNotificationManager *)self deferredNotificationBlocks];
  [(TUCallNotificationManager *)self setDeferredNotificationBlocks:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)setDeferredNotificationBlocks:(id)a3
{
}

- (NSMutableArray)deferredNotificationBlocks
{
  return self->_deferredNotificationBlocks;
}

- (TUCallNotificationManager)initWithNotificationCenter:(id)a3
{
  return [(TUCallNotificationManager *)self initWithNotificationCenter:a3 wantsCallNotifications:1];
}

- (void)postNotificationsForCall:(id)a3 afterUpdatesInBlock:(id)a4
{
}

- (void)postNotificationsForCall:(id)a3 usingComparisonCall:(id)a4
{
}

- (void)postNotificationsForCall:(id)a3 usingComparisonCall:(id)a4 afterUpdatesInBlock:(id)a5
{
  id v205 = a3;
  id v7 = a4;
  v8 = (void (**)(id))a5;
  if (postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___pred_CGRectEqualToRectCoreGraphics != -1) {
    dispatch_once(&postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___pred_CGRectEqualToRectCoreGraphics, &__block_literal_global_41);
  }
  v203 = [v7 activeRemoteParticipant];
  v201 = [v7 callerNameFromNetwork];
  int v166 = [v7 status];
  char v130 = [v7 isConnecting];
  char v125 = [v7 isConnected];
  char v164 = [v7 wantsHoldMusic];
  char v162 = [v7 isEndpointOnCurrentDevice];
  char v160 = [v7 shouldSuppressRingtone];
  int v158 = [v7 faceTimeIDStatus];
  v199 = [v7 hardPauseDigits];
  int v156 = [v7 hardPauseDigitsState];
  char v154 = [v7 needsManualInCallSounds];
  char v152 = [v7 hasSentInvitation];
  v197 = [v7 imageURL];
  char v150 = [v7 isUsingBaseband];
  char v148 = [v7 isOnHold];
  char v146 = [v7 isUplinkMuted];
  char v145 = [v7 isSendingAudio];
  char v142 = [v7 isSendingVideo];
  char v140 = [v7 isSharingScreen];
  char v135 = [v7 isThirdPartyVideo];
  char v134 = [v7 isMediaStalled];
  char v133 = [v7 isVideoDegraded];
  char v132 = [v7 isVideoPaused];
  char v141 = [v7 isVideoMirrored];
  v9 = [v7 handle];
  v195 = [v9 value];

  v193 = [v7 displayContext];
  char v127 = [v7 isEmergency];
  char v126 = [v7 isFailureExpected];
  char v123 = [v7 supportsEmergencyFallback];
  v191 = [v7 audioCategory];
  v189 = [v7 audioMode];
  int v122 = [v7 ttyType];
  char v121 = [v7 supportsTTYWithVoice];
  uint64_t v120 = [v7 bluetoothAudioFormat];
  [v7 remoteAspectRatio];
  uint64_t v144 = v10;
  uint64_t v143 = v11;
  [v7 remoteVideoContentRect];
  uint64_t v138 = v13;
  uint64_t v139 = v12;
  uint64_t v136 = v15;
  uint64_t v137 = v14;
  uint64_t v117 = [v7 cameraType];
  uint64_t v124 = [v7 remoteCameraOrientation];
  uint64_t v116 = [v7 remoteScreenOrientation];
  [v7 remoteScreenAspectRatio];
  uint64_t v128 = v17;
  uint64_t v129 = v16;
  char v115 = [v7 prefersExclusiveAccessToCellularNetwork];
  char v114 = [v7 isRemoteUplinkMuted];
  v187 = [v7 localSenderIdentityAccountUUID];
  v185 = [v7 model];
  v183 = [v7 providerContext];
  v131 = [v7 remoteParticipantHandles];
  char v113 = [v7 isVideo];
  uint64_t v112 = [v7 videoStreamToken];
  uint64_t v110 = [v7 answeringMachineStreamToken];
  char v109 = [v7 isConversation];
  v119 = [v7 callGroupUUID];
  char v108 = [v7 mixesVoiceWithMedia];
  v118 = [v7 screenShareAttributes];
  uint64_t v111 = [v7 serviceStatus];
  uint64_t v99 = [v7 transmissionMode];
  char v98 = [v7 isReceivingTransmission];
  char v97 = [v7 isSendingTransmission];
  char v103 = [v7 isScreening];
  char v102 = [v7 screeningAnnouncementHasFinished];
  char v105 = [v7 hasBeenRedirected];
  char v104 = [v7 supportsDTMFUpdates];
  int v100 = [v7 callSubType];
  v107 = [v7 recordingSession];
  int v101 = [v7 recordingAvailability];
  v106 = [v7 tokens];
  if (v8) {
    v8[2](v8);
  }
  v168 = v8;
  v181 = [v7 activeRemoteParticipant];
  v179 = [v7 callerNameFromNetwork];
  int v94 = [v7 status];
  int v96 = [v7 callSubType];
  char v95 = [v7 isConnecting];
  char v93 = [v7 isConnected];
  char v92 = [v7 wantsHoldMusic];
  char v91 = [v7 isEndpointOnCurrentDevice];
  char v90 = [v7 shouldSuppressRingtone];
  int v89 = [v7 faceTimeIDStatus];
  v178 = [v7 hardPauseDigits];
  int v88 = [v7 hardPauseDigitsState];
  char v87 = [v7 needsManualInCallSounds];
  char v86 = [v7 hasSentInvitation];
  v177 = [v7 imageURL];
  char v85 = [v7 isUsingBaseband];
  char v84 = [v7 isOnHold];
  char v82 = [v7 isUplinkMuted];
  char v81 = [v7 isSendingAudio];
  char v80 = [v7 isSendingVideo];
  char v79 = [v7 isSharingScreen];
  char v78 = [v7 isThirdPartyVideo];
  char v77 = [v7 isMediaStalled];
  char v76 = [v7 isVideoDegraded];
  char v75 = [v7 isVideoPaused];
  char v83 = [v7 isVideoMirrored];
  long long v18 = [v7 handle];
  v176 = [v18 value];

  v169 = [v7 displayContext];
  char v72 = [v7 isEmergency];
  char v71 = [v7 isFailureExpected];
  char v70 = [v7 supportsEmergencyFallback];
  v53 = [v7 audioCategory];
  v175 = [v7 audioMode];
  int v69 = [v7 ttyType];
  char v68 = [v7 supportsTTYWithVoice];
  uint64_t v67 = [v7 bluetoothAudioFormat];
  [v7 remoteAspectRatio];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [v7 remoteVideoContentRect];
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v64 = [v7 cameraType];
  uint64_t v74 = [v7 remoteCameraOrientation];
  uint64_t v63 = [v7 remoteScreenOrientation];
  [v7 remoteScreenAspectRatio];
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  char v62 = [v7 prefersExclusiveAccessToCellularNetwork];
  char v61 = [v7 isRemoteUplinkMuted];
  v174 = [v7 localSenderIdentityAccountUUID];
  v172 = [v7 model];
  v170 = [v7 providerContext];
  v73 = [v7 remoteParticipantHandles];
  char v59 = [v7 isVideo];
  uint64_t v58 = [v7 videoStreamToken];
  uint64_t v57 = [v7 answeringMachineStreamToken];
  char v56 = [v7 isConversation];
  v65 = [v7 callGroupUUID];
  char v55 = [v7 mixesVoiceWithMedia];
  v66 = [v7 screenShareAttributes];
  uint64_t v60 = [v7 serviceStatus];
  uint64_t v35 = [v7 transmissionMode];
  char v36 = [v7 isReceivingTransmission];
  char v37 = [v7 isSendingTransmission];
  char v38 = [v7 isScreening];
  char v39 = [v7 screeningAnnouncementHasFinished];
  char v54 = [v7 hasBeenRedirected];
  LOBYTE(v18) = [v7 supportsDTMFUpdates];
  v40 = [v7 recordingSession];
  int v41 = [v7 recordingAvailability];
  v42 = [v7 tokens];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__TUCallNotificationManager_postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___block_invoke_2;
  aBlock[3] = &unk_1E58E7B38;
  int v274 = v166;
  int v275 = v94;
  uint64_t v242 = v99;
  uint64_t v243 = v35;
  char v286 = v98;
  char v287 = v36;
  char v288 = v97;
  char v289 = v37;
  char v290 = v130;
  char v291 = v95;
  char v292 = v125;
  char v293 = v93;
  char v294 = v164;
  char v295 = v92;
  char v296 = v162;
  char v297 = v91;
  char v298 = v160;
  char v299 = v90;
  int v276 = v158;
  int v277 = v89;
  int v278 = v156;
  int v279 = v88;
  char v300 = v154;
  char v301 = v87;
  char v302 = v152;
  char v303 = v86;
  char v304 = v150;
  char v305 = v85;
  char v306 = v148;
  char v307 = v84;
  char v308 = v146;
  char v309 = v82;
  char v310 = v145;
  char v311 = v81;
  char v312 = v142;
  char v313 = v80;
  char v314 = v140;
  char v315 = v79;
  char v316 = v135;
  char v317 = v78;
  char v318 = v134;
  char v319 = v77;
  char v320 = v133;
  char v321 = v76;
  char v322 = v132;
  char v323 = v75;
  char v324 = v127;
  char v325 = v72;
  char v326 = v126;
  char v327 = v71;
  char v328 = v123;
  char v329 = v70;
  int v280 = v100;
  int v281 = v96;
  int v282 = v122;
  int v283 = v69;
  char v330 = v121;
  char v331 = v68;
  uint64_t v244 = v120;
  uint64_t v245 = v67;
  uint64_t v246 = v117;
  uint64_t v247 = v64;
  char v332 = v141;
  char v333 = v83;
  uint64_t v248 = v116;
  uint64_t v249 = v63;
  char v334 = v115;
  char v335 = v62;
  char v336 = v114;
  char v337 = v61;
  char v338 = v113;
  char v339 = v59;
  uint64_t v254 = v112;
  uint64_t v255 = v58;
  uint64_t v256 = v110;
  uint64_t v257 = v57;
  char v340 = v109;
  char v341 = v56;
  char v342 = v108;
  char v343 = v55;
  char v344 = v103;
  char v345 = v38;
  char v346 = v102;
  char v347 = v39;
  uint64_t v270 = v124;
  uint64_t v271 = v74;
  char v348 = v54;
  char v349 = v105;
  char v350 = (char)v18;
  char v351 = v104;
  uint64_t v272 = v111;
  uint64_t v273 = v60;
  int v284 = v101;
  int v285 = v41;
  aBlock[4] = self;
  id v209 = v205;
  id v210 = v203;
  id v211 = v181;
  id v212 = v201;
  id v213 = v179;
  id v214 = v199;
  id v215 = v178;
  id v216 = v197;
  id v217 = v177;
  id v218 = v195;
  id v219 = v176;
  id v220 = v193;
  id v221 = v169;
  id v222 = v191;
  id v223 = v53;
  id v224 = v189;
  id v225 = v175;
  uint64_t v250 = v129;
  uint64_t v251 = v128;
  uint64_t v252 = v32;
  uint64_t v253 = v34;
  id v226 = v187;
  id v227 = v174;
  id v228 = v185;
  id v229 = v172;
  id v230 = v183;
  id v231 = v170;
  id v232 = v131;
  id v233 = v73;
  id v234 = v119;
  id v235 = v65;
  uint64_t v258 = v144;
  uint64_t v259 = v143;
  uint64_t v260 = v20;
  uint64_t v261 = v22;
  uint64_t v262 = v139;
  uint64_t v263 = v138;
  uint64_t v264 = v137;
  uint64_t v265 = v136;
  uint64_t v266 = v24;
  uint64_t v267 = v26;
  uint64_t v268 = v28;
  uint64_t v269 = v30;
  id v236 = v118;
  id v237 = v66;
  id v238 = v107;
  id v239 = v40;
  id v240 = v106;
  id v241 = v42;
  id v149 = v42;
  id v151 = v106;
  id v155 = v40;
  id v157 = v107;
  id v161 = v66;
  id v163 = v118;
  id v167 = v65;
  id v165 = v119;
  id v159 = v73;
  id v153 = v131;
  id v171 = v170;
  id v184 = v183;
  id v173 = v172;
  id v147 = v185;
  id v43 = v174;
  id v44 = v187;
  id v45 = v175;
  id v46 = v189;
  id v47 = v53;
  id v48 = v191;
  id v192 = v169;
  id v194 = v193;
  id v190 = v176;
  id v196 = v195;
  id v188 = v177;
  id v198 = v197;
  id v186 = v178;
  id v200 = v199;
  id v180 = v179;
  id v202 = v201;
  id v182 = v181;
  id v204 = v203;
  id v206 = v205;
  v49 = (void (**)(void))_Block_copy(aBlock);
  v50 = [(TUCallNotificationManager *)self deferredNotificationBlocks];

  if (v50)
  {
    v51 = [(TUCallNotificationManager *)self deferredNotificationBlocks];
    v52 = _Block_copy(v49);
    [v51 addObject:v52];
  }
  else
  {
    v49[2](v49);
  }
}

uint64_t (*__94__TUCallNotificationManager_postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___block_invoke())(void, double, double, double, double, double, double, double, double)
{
  result = (uint64_t (*)(void, double, double, double, double, double, double, double, double))CUTWeakLinkSymbol();
  postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___CGRectEqualToRect = result;
  return result;
}

uint64_t __94__TUCallNotificationManager_postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsCallNotifications];
  if (!result) {
    return result;
  }
  int v3 = [*(id *)(a1 + 40) isPTT];
  int v4 = *(_DWORD *)(a1 + 560);
  int v5 = *(_DWORD *)(a1 + 564);
  if (v4 == v5) {
    int v6 = 0;
  }
  else {
    int v6 = v3;
  }
  if (v4 != v5) {
    [*(id *)(a1 + 32) statusChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 48), *(void *)(a1 + 56)) & 1) == 0)
  {
    id v7 = @"TUCallActiveRemoteParticipantChangedNotification";
    if ([*(id *)(a1 + 40) isPTT])
    {
      v8 = @"TUBargeCallActiveRemoteParticipantChangedNotification";
      if (v6) {
        v8 = 0;
      }
      v9 = v8;

      id v7 = v9;
    }
    if ([(__CFString *)v7 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v7 object:*(void *)(a1 + 40)];
    }
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 64), *(void *)(a1 + 72)) & 1) == 0)
  {
    if ([*(id *)(a1 + 40) isPTT])
    {
      uint64_t v10 = @"TUBargeCallNameChangedNotification";
      if (v6) {
        uint64_t v10 = 0;
      }
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
    if ([(__CFString *)v11 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v11 object:*(void *)(a1 + 40)];
    }
  }
  if (*(void *)(a1 + 304) != *(void *)(a1 + 312))
  {
    uint64_t v12 = @"TUCallTransmissionModeChangedNotification";
    if ([*(id *)(a1 + 40) isPTT])
    {
      uint64_t v13 = @"TUBargeCallTransmissionModeChangedNotification";
      if (v6) {
        uint64_t v13 = 0;
      }
      uint64_t v14 = v13;

      uint64_t v12 = v14;
    }
    if ([(__CFString *)v12 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v12 object:*(void *)(a1 + 40)];
    }
  }
  if ([*(id *)(a1 + 40) isActive]
    && (*(unsigned __int8 *)(a1 + 608) != *(unsigned __int8 *)(a1 + 609)
     || *(unsigned __int8 *)(a1 + 610) != *(unsigned __int8 *)(a1 + 611)))
  {
    uint64_t v15 = @"TUCallTransmissionStateChangedNotification";
    if ([*(id *)(a1 + 40) isPTT])
    {
      uint64_t v16 = @"TUBargeCallTransmissionStateChangedNotification";
      if (v6) {
        uint64_t v16 = 0;
      }
      uint64_t v17 = v16;

      uint64_t v15 = v17;
    }
    if ([(__CFString *)v15 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v15 object:*(void *)(a1 + 40)];
    }
  }
  if (*(unsigned __int8 *)(a1 + 612) != *(unsigned __int8 *)(a1 + 613)) {
    [*(id *)(a1 + 32) connectingChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 614) != *(unsigned __int8 *)(a1 + 615)) {
    [*(id *)(a1 + 32) connectedChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 616) != *(unsigned __int8 *)(a1 + 617)) {
    [*(id *)(a1 + 32) wantsHoldMusicChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 618) != *(unsigned __int8 *)(a1 + 619)) {
    [*(id *)(a1 + 32) endpointOnCurrentDeviceChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 620) != *(unsigned __int8 *)(a1 + 621)) {
    [*(id *)(a1 + 32) shouldSuppressRingtoneChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(_DWORD *)(a1 + 568) != *(_DWORD *)(a1 + 572)) {
    [*(id *)(a1 + 32) faceTimeIDStatusChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(_DWORD *)(a1 + 576) != *(_DWORD *)(a1 + 580)
    || (TUStringsAreEqualOrNil(*(void *)(a1 + 80), *(void *)(a1 + 88)) & 1) == 0)
  {
    [*(id *)(a1 + 32) hardPauseDigitsStateChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 622) != *(unsigned __int8 *)(a1 + 623)) {
    [*(id *)(a1 + 32) needsManualInCallSoundsChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 624) != *(unsigned __int8 *)(a1 + 625)) {
    [*(id *)(a1 + 32) hasSentInvitationChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 626) != *(unsigned __int8 *)(a1 + 627)) {
    [*(id *)(a1 + 32) isUsingBasebandChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 628) != *(unsigned __int8 *)(a1 + 629)) {
    [*(id *)(a1 + 32) isOnHoldChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 630) != *(unsigned __int8 *)(a1 + 631)) {
    [*(id *)(a1 + 32) isUplinkMutedChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 96), *(void *)(a1 + 104)) & 1) == 0)
  {
    long long v18 = @"TUCallImageURLChangedNotification";
    if ([*(id *)(a1 + 40) isPTT])
    {
      uint64_t v19 = @"TUBargeCallImageURLChangedNotification";
      if (v6) {
        uint64_t v19 = 0;
      }
      uint64_t v20 = v19;

      long long v18 = v20;
    }
    if ([(__CFString *)v18 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v18 object:*(void *)(a1 + 40)];
    }
  }
  if (*(unsigned __int8 *)(a1 + 632) != *(unsigned __int8 *)(a1 + 633)) {
    [*(id *)(a1 + 32) isSendingAudioChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 634) != *(unsigned __int8 *)(a1 + 635)) {
    [*(id *)(a1 + 32) isSendingVideoChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 636) != *(unsigned __int8 *)(a1 + 637)) {
    [*(id *)(a1 + 32) sharingScreenChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 638) != *(unsigned __int8 *)(a1 + 639)) {
    [*(id *)(a1 + 32) isThirdPartyVideoChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 640) != *(unsigned __int8 *)(a1 + 641)) {
    [*(id *)(a1 + 32) mediaStalledChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 642) != *(unsigned __int8 *)(a1 + 643)) {
    [*(id *)(a1 + 32) videoDegradedChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 644) != *(unsigned __int8 *)(a1 + 645)) {
    [*(id *)(a1 + 32) videoPausedChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUStringsAreEqualOrNil(*(void *)(a1 + 112), *(void *)(a1 + 120)) & 1) == 0) {
    [*(id *)(a1 + 32) destinationIDChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 128), *(void *)(a1 + 136)) & 1) == 0) {
    [*(id *)(a1 + 32) displayContextChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 646) != *(unsigned __int8 *)(a1 + 647)) {
    [*(id *)(a1 + 32) isEmergencyChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 648) != *(unsigned __int8 *)(a1 + 649)) {
    [*(id *)(a1 + 32) isFailureExpectedChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 650) != *(unsigned __int8 *)(a1 + 651)) {
    [*(id *)(a1 + 32) supportsEmergencyFallbackChangedForCall:*(void *)(a1 + 40)];
  }
  if (!TUStringsAreEqualOrNil(*(void *)(a1 + 144), *(void *)(a1 + 152))
    || !TUStringsAreEqualOrNil(*(void *)(a1 + 160), *(void *)(a1 + 168))
    || *(_DWORD *)(a1 + 584) != *(_DWORD *)(a1 + 588))
  {
    [*(id *)(a1 + 32) audioPropertiesChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(_DWORD *)(a1 + 592) != *(_DWORD *)(a1 + 596)) {
    [*(id *)(a1 + 32) ttyTypeChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 652) != *(unsigned __int8 *)(a1 + 653)) {
    [*(id *)(a1 + 32) supportsTTYWithVoiceChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 320) != *(void *)(a1 + 328)) {
    [*(id *)(a1 + 32) bluetoothAudioFormatChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 336) != *(void *)(a1 + 344)) {
    [*(id *)(a1 + 32) cameraTypeChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 654) != *(unsigned __int8 *)(a1 + 655)) {
    [*(id *)(a1 + 32) videoMirroredChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 352) != *(void *)(a1 + 360)) {
    [*(id *)(a1 + 32) remoteScreenOrientationChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(double *)(a1 + 368) != *(double *)(a1 + 384) || *(double *)(a1 + 376) != *(double *)(a1 + 392)) {
    [*(id *)(a1 + 32) remoteScreenAspectRatioChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 656) != *(unsigned __int8 *)(a1 + 657)) {
    [*(id *)(a1 + 32) prefersExclusiveAccessToCellularNetworkChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 658) != *(unsigned __int8 *)(a1 + 659)) {
    [*(id *)(a1 + 32) remoteUplinkMutedChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 176) != *(void *)(a1 + 184)) {
    [*(id *)(a1 + 32) localSenderIdentityAccountUUIDChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 192), *(void *)(a1 + 200)) & 1) == 0) {
    [*(id *)(a1 + 32) modelChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 208), *(void *)(a1 + 216)) & 1) == 0) {
    [*(id *)(a1 + 32) providerContextChangedForCall:*(void *)(a1 + 40)];
  }
  if (!*(unsigned char *)(a1 + 660)
    || !*(unsigned char *)(a1 + 661)
    && ([*(id *)(a1 + 32) _postNotificationName:@"TUCallDowngradedToAudioNotification" object:*(void *)(a1 + 40)], !*(unsigned char *)(a1 + 660)))
  {
    if (*(unsigned char *)(a1 + 661)) {
      [*(id *)(a1 + 32) _postNotificationName:@"TUCallUpgradedToVideoNotification" object:*(void *)(a1 + 40)];
    }
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 224), *(void *)(a1 + 232)) & 1) == 0)
  {
    uint64_t v21 = @"TUCallRemoteParticipantHandlesChangedNotification";
    if ([*(id *)(a1 + 40) isPTT])
    {
      uint64_t v22 = @"TUBargeCallRemoteParticipantHandlesChangedNotification";
      if (v6) {
        uint64_t v22 = 0;
      }
      uint64_t v23 = v22;

      uint64_t v21 = v23;
    }
    if ([(__CFString *)v21 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v21 object:*(void *)(a1 + 40)];
    }
  }
  if (*(void *)(a1 + 400) != *(void *)(a1 + 408)) {
    [*(id *)(a1 + 32) videoStreamTokenChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 416) != *(void *)(a1 + 424)) {
    [*(id *)(a1 + 32) answeringMachineStreamTokenChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 662) != *(unsigned __int8 *)(a1 + 663)) {
    [*(id *)(a1 + 32) conversationChangedForCall:*(void *)(a1 + 40)];
  }
  uint64_t v24 = TUObjectsAreEqualOrNil(*(void *)(a1 + 240), *(void *)(a1 + 248));
  if ((v24 & 1) == 0) {
    uint64_t v24 = [*(id *)(a1 + 32) callGroupUUIDChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 664) != *(unsigned __int8 *)(a1 + 665)) {
    uint64_t v24 = [*(id *)(a1 + 32) mixesVoiceWithMediaChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 666) != *(unsigned __int8 *)(a1 + 667)) {
    uint64_t v24 = [*(id *)(a1 + 32) isScreeningChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 668) != *(unsigned __int8 *)(a1 + 669)) {
    uint64_t v24 = [*(id *)(a1 + 32) screeningAnnouncementFinishedChangedForCall:*(void *)(a1 + 40)];
  }
  BOOL v25 = *(double *)(a1 + 440) != *(double *)(a1 + 456) || *(double *)(a1 + 432) != *(double *)(a1 + 448);
  if (v25) {
    uint64_t v24 = [*(id *)(a1 + 32) remoteAspectRatioChangedForCall:*(void *)(a1 + 40)];
  }
  int v26 = postNotificationsForCall_usingComparisonCall_afterUpdatesInBlock___CGRectEqualToRect(v24, *(double *)(a1 + 464), *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 488), *(double *)(a1 + 496), *(double *)(a1 + 504), *(double *)(a1 + 512), *(double *)(a1 + 520));
  if ((v26 & 1) == 0) {
    [*(id *)(a1 + 32) remoteVideoContentRectChangedForCall:*(void *)(a1 + 40)];
  }
  uint64_t v27 = *(void *)(a1 + 528);
  uint64_t v28 = *(void *)(a1 + 536);
  if (v27 != v28) {
    [*(id *)(a1 + 32) remoteCameraOrientationChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 670) != *(unsigned __int8 *)(a1 + 671)) {
    [*(id *)(a1 + 32) hasBeenRedirectedChangedForCall:*(void *)(a1 + 40)];
  }
  if (*(unsigned __int8 *)(a1 + 672) != *(unsigned __int8 *)(a1 + 673)) {
    [*(id *)(a1 + 32) supportsDTMFUpdatesChangedForCall:*(void *)(a1 + 40)];
  }
  if ((TUObjectsAreEqualOrNil(*(void *)(a1 + 256), *(void *)(a1 + 264)) & 1) == 0) {
    [*(id *)(a1 + 32) _postNotificationName:@"TUCallScreenShareAttributesChangedNotification" object:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 544) != *(void *)(a1 + 552))
  {
    uint64_t v29 = @"TUCallServiceStatusChangedNotification";
    if ([*(id *)(a1 + 40) isPTT])
    {
      uint64_t v30 = @"TUBargeCallServiceStatusChangedNotification";
      if (v6) {
        uint64_t v30 = 0;
      }
      uint64_t v31 = v30;

      uint64_t v29 = v31;
    }
    if ([(__CFString *)v29 length]) {
      [*(id *)(a1 + 32) _postNotificationName:v29 object:*(void *)(a1 + 40)];
    }
  }
  if (v25 | v26 ^ 1u || v27 != v28) {
    [*(id *)(a1 + 32) mediaPropertiesChangedForCall:*(void *)(a1 + 40) remoteAspectRatioDidChange:v25 remoteCameraOrientationDidChange:v27 != v28];
  }
  uint64_t v32 = *(void **)(a1 + 272);
  uint64_t v33 = *(void *)(a1 + 280);
  if (v32)
  {
    if (!v33) {
      goto LABEL_186;
    }
  }
  else if (v33)
  {
LABEL_186:
    [*(id *)(a1 + 32) callRecordingStateChanged:*(void *)(a1 + 40)];
    goto LABEL_187;
  }
  int v34 = [v32 recordingState];
  if (v34 != [*(id *)(a1 + 280) recordingState]) {
    goto LABEL_186;
  }
LABEL_187:
  if (*(_DWORD *)(a1 + 600) != *(_DWORD *)(a1 + 604)) {
    [*(id *)(a1 + 32) callRecordingAvailabilityChangedForCall:*(void *)(a1 + 40)];
  }
  uint64_t result = TUObjectsAreEqualOrNil(*(void *)(a1 + 288), *(void *)(a1 + 296));
  if ((result & 1) == 0)
  {
    uint64_t v35 = *(void **)(a1 + 32);
    uint64_t v36 = *(void *)(a1 + 40);
    return [v35 mediaTokensChangedForCall:v36];
  }
  return result;
}

- (void)postNotificationsForCallContainer:(id)a3 afterUpdatesInBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [v6 conferenceParticipantCalls];
  if (v7) {
    v7[2](v7);
  }
  v9 = [v6 conferenceParticipantCalls];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __83__TUCallNotificationManager_postNotificationsForCallContainer_afterUpdatesInBlock___block_invoke;
  uint64_t v20 = &unk_1E58E63D8;
  id v21 = v8;
  id v22 = v9;
  uint64_t v23 = self;
  id v24 = v6;
  id v10 = v6;
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = (void (**)(void))_Block_copy(&v17);
  uint64_t v14 = [(TUCallNotificationManager *)self deferredNotificationBlocks];

  if (v14)
  {
    uint64_t v15 = [(TUCallNotificationManager *)self deferredNotificationBlocks];
    uint64_t v16 = _Block_copy(v13);
    [v15 addObject:v16];
  }
  else
  {
    v13[2](v13);
  }
}

uint64_t __83__TUCallNotificationManager_postNotificationsForCallContainer_afterUpdatesInBlock___block_invoke(void *a1)
{
  uint64_t result = a1[4];
  if (result != a1[5])
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToArray:");
    if ((result & 1) == 0)
    {
      int v3 = (void *)a1[6];
      uint64_t v4 = a1[7];
      uint64_t v5 = a1[5];
      return [v3 conferenceParticipantCallsChangedForCallContainer:v4 conferenceParticipantCalls:v5];
    }
  }
  return result;
}

- (void)_postNotificationName:(id)a3 object:(id)a4
{
}

- (void)_postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Posting %@ with object %@ userInfo %@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = [(TUCallNotificationManager *)self notificationCenter];
  [v12 postNotificationName:v8 object:v9 userInfo:v10];
}

- (void)statusChangedForCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "statusChangedForCall %@", (uint8_t *)&v8, 0xCu);
  }

  if ([v4 isVideo])
  {
    [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterVideoCallStatusChangedNotification" object:v4];
  }
  else
  {
    [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterCallStatusChangedInternalNotification" object:v4];
    id v6 = @"TUCallCenterCallStatusChangedNotification";
    if ([v4 isPTT])
    {
      id v7 = @"TUBargeCallStatusChangedNotification";

      id v6 = v7;
    }
    [(TUCallNotificationManager *)self _postNotificationName:v6 object:v4];
  }
}

- (void)connectingChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "connectingChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 isConnecting]) {
    [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterCallStartedConnectingNotification" object:v4];
  }
}

- (void)connectedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "connectedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 isConnected]) {
    [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterCallConnectedNotification" object:v4];
  }
}

- (void)wantsHoldMusicChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "wantsHoldMusicChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterCallWantsHoldMusicChangedNotification" object:v4];
}

- (void)endpointOnCurrentDeviceChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endpointOnCurrentDeviceChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterCallContinuityStateChangedNotification" object:v4];
}

- (void)shouldSuppressRingtoneChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "shouldSuppressRingtoneChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallShouldSuppressRingingChangedNotification" object:v4];
}

- (void)faceTimeIDStatusChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "faceTimeIDStatusChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallFaceTimeIDStatusChangedNotification" object:v4];
}

- (void)hardPauseDigitsStateChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "hardPauseDigitsStateChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallHardPauseDigitsStateChangedNotification" object:v4];
}

- (void)needsManualInCallSoundsChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "needsManualInCallSoundsChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallNeedsManualInCallSoundsChangedNotification" object:v4];
}

- (void)hasSentInvitationChangedForCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "hasSentInvitationChangedForCall %@", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [v4 isVideo];
  id v7 = &TUCallCenterVideoCallInvitationSentNotification;
  if (!v6) {
    id v7 = &TUCallCenterCallInvitationSentNotification;
  }
  [(TUCallNotificationManager *)self _postNotificationName:*v7 object:v4];
}

- (void)isUsingBasebandChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isUsingBasebandChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsUsingBasebandChangedNotification" object:v4];
}

- (void)isOnHoldChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isOnHoldChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsOnHoldChangedNotification" object:v4];
}

- (void)isUplinkMutedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isUplinkMutedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsUplinkMutedChangedNotification" object:v4];
}

- (void)destinationIDChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "destinationIDChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterCallerIDChangedNotification" object:v4];
}

- (void)displayContextChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "displayContextChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallDisplayContextChangedNotification" object:v4];
}

- (void)isEmergencyChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isEmergencyChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterIsEmergencyChangedNotification" object:v4];
}

- (void)isFailureExpectedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isFailureExpectedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterIsFailureExpectedChangedNotification" object:v4];
}

- (void)supportsEmergencyFallbackChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "supportsEmergencyFallbackChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterSupportsEmergencyFallbackChangedNotification" object:v4];
}

- (void)isSendingAudioChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isSendingAudioChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsSendingAudioChangedNotification" object:v4];
}

- (void)isSendingVideoChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isSendingVideoChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsSendingVideoChangedNotification" object:v4];
}

- (void)sharingScreenChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "sharingScreenChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsSharingScreenChangedNotification" object:v4];
}

- (void)isThirdPartyVideoChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isThirdPartyVideoChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallIsThirdPartyVideoChangedNotification" object:v4];
}

- (void)mediaStalledChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "mediaStalledChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterVideoCallMediaStalledChangedNotification" object:v4];
}

- (void)videoDegradedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "videoDegradedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterVideoCallVideoQualityChangedNotification" object:v4];
}

- (void)videoPausedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "videoPausedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterVideoCallPauseChangedNotification" object:v4];
}

- (void)audioPropertiesChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "audioPropertiesChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallAudioPropertiesChangedNotification" object:v4];
}

- (void)ttyTypeChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "ttyTypeChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallTTYTypeChangedNotification" object:v4];
}

- (void)bluetoothAudioFormatChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "bluetoothAudioFormatChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallBluetoothAudioFormatChangedNotification" object:v4];
}

- (void)remoteUplinkMutedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "remoteUplinkMutedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRemoteUplinkMutedChangedNotification" object:v4];
}

- (void)localSenderIdentityAccountUUIDChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "localSenderIdentityAccountUUIDChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallLocalSenderIdentityAccountUUIDChangedNotification" object:v4];
}

- (void)supportsTTYWithVoiceChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "supportsTTYWithVoiceChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallSupportsTTYWithVoiceChangedNotification" object:v4];
}

- (void)remoteAspectRatioChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "remoteAspectRatioChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRemoteAspectRatioChangedNotification" object:v4];
}

- (void)remoteVideoContentRectChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "remoteVideoContentRectChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRemoteVideoContentRectChangedNotification" object:v4];
}

- (void)cameraTypeChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "cameraTypeChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCameraTypeChangedNotification" object:v4];
}

- (void)videoMirroredChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "videoMirroredChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUVideoMirroredChangedNotification" object:v4];
}

- (void)remoteCameraOrientationChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "remoteCameraOrientationChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRemoteCameraOrientationChangedNotification" object:v4];
}

- (void)remoteScreenOrientationChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "remoteScreenOrientationChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRemoteScreenOrientationChangedNotification" object:v4];
}

- (void)remoteScreenAspectRatioChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "remoteScreenAspectRatioChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRemoteScreenAspectRatioChangedNotification" object:v4];
}

- (void)providerContextChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "providerContextChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallProviderContextChangedNotification" object:v4];
}

- (void)mediaPropertiesChangedForCall:(id)a3 remoteAspectRatioDidChange:(BOOL)a4 remoteCameraOrientationDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "mediaPropertiesChangedForCall %@", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v6)
  {
    id v11 = (void *)MEMORY[0x1E4F29238];
    [v8 remoteAspectRatio];
    id v12 = objc_msgSend(v11, "valueWithSize:");
    [v10 setObject:v12 forKeyedSubscript:@"TUCallCenterVideoCallCameraAspectRatioKey"];
  }
  if (v5)
  {
    int v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "remoteCameraOrientation"));
    [v10 setObject:v13 forKeyedSubscript:@"TUCallCenterVideoCallCameraOrientationKey"];
  }
  id v14 = (void *)[v10 copy];
  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterVideoCallMediaPropertiesChangedNotification" object:v8 userInfo:v14];
}

- (void)videoStreamTokenChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "videoStreamTokenChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallVideoStreamTokenChangedNotification" object:v4];
}

- (void)answeringMachineStreamTokenChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "answeringMachineStreamTokenChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallAnsewringMachineStreamTokenChangedNotification" object:v4];
}

- (void)conversationChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "conversationChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallConversationChangedNotification" object:v4];
}

- (void)callGroupUUIDChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "callGroupUUIDChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallGroupUUIDChangedNotification" object:v4];
}

- (void)mixesVoiceWithMediaChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "mixesVoiceWithMediaChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallMixesVoiceWithMediaChangedNotification" object:v4];
}

- (void)prefersExclusiveAccessToCellularNetworkChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "prefersExclusiveAccessToCellularNetworkChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallPrefersExclusiveAccessToCellularNetworkChangedNotification" object:v4];
}

- (void)isScreeningChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isScreeningChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterIsScreeningChangedNotification" object:v4];
}

- (void)screeningAnnouncementFinishedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "isScreeningAnnouncementFinishedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallScreeningDidFinishAnnouncementNotification" object:v4];
}

- (void)hasBeenRedirectedChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "hasBeenRedirectedChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallHasBeenRedirectedChangedNotification" object:v4];
}

- (void)supportsDTMFUpdatesChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "supportsDTMFUpdatesChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallSupportsDTMFUpdatesChangedNotification" object:v4];
}

- (void)callRecordingStateChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 recordingSession];
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 1024;
    int v10 = [v6 recordingState];
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "callRecordingStateChangedForCall %@, changed to %d", (uint8_t *)&v7, 0x12u);
  }
  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRecordingStateChangedNotification" object:v4];
}

- (void)callRecordingAvailabilityChangedForCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 1024;
    int v9 = [v4 recordingAvailability];
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "callRecordingAvailabilityChangedForCall %@, changed to %d", (uint8_t *)&v6, 0x12u);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallRecordingAvailabilityChangedNotification" object:v4];
}

- (void)mediaTokensChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "mediaTokensChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallMediaTokensChangedNotification" object:v4];
}

- (void)modelChangedForCall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "modelChangedForCall %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallModelChangedNotification" object:v4];
  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterModelStateChangedNotification" object:0];
}

- (void)conferenceParticipantCallsChangedForCallContainer:(id)a3 conferenceParticipantCalls:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "conferenceParticipantCallsChangedForCallContainer %@ conferenceParticipantCalls %@", (uint8_t *)&v9, 0x16u);
  }

  [(TUCallNotificationManager *)self _postNotificationName:@"TUCallCenterConferenceParticipantsChangedNotification" object:v7];
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)wantsCallNotifications
{
  return self->_wantsCallNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredNotificationBlocks, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end